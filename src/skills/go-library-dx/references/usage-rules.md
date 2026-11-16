# Usage rules

Every rule is checked against real call sites. The examples use two
illustrative libraries: `kv`, a key-value store with pluggable backends, and
`sqldb`, a SQL database layer with drivers for several databases. Each rule
shows the call site to write and the one it replaces.

## Shape

### 1. One handle per concern

The library exports one concrete type the caller holds for its concern.
Every operation hangs off that handle or takes it. The caller learns one
noun.

```go
// Good: one handle, every operation on it.
store, err := kv.Open(ctx, url, redis.Driver())
err = store.Set(ctx, "k", v)
n, err := store.Incr(ctx, "hits", 1)

// Bad: the caller juggles a client, a session, and a counter service.
client, err := kv.NewClient(url)
sess := client.NewSession()
err = sess.Set(ctx, "k", v)
n, err := kv.NewCounterService(client).Incr(ctx, "hits", 1)
```

### 2. The package name reads at the call site

Identifiers never repeat the package name. A call reads as a sentence.

```go
// Good
db, err := sqldb.Open(ctx, url)
var s *kv.Store

// Bad: stutter and noise.
db, err := sqldb.OpenSQLDBDatabase(ctx, url)
var s *kv.KVStoreClient
```

### 3. The smallest surface that covers the tasks

Every exported identifier earns its place with a call site from step 1.
One way to do each thing.

```go
// Good: one way to write, with options for variations.
err = store.Set(ctx, key, v, kv.WithTTL(time.Minute))
err = store.Set(ctx, key, v, kv.IfNotExists())

// Bad: a method per combination.
err = store.SetWithTTL(ctx, key, v, time.Minute)
err = store.SetNX(ctx, key, v)
err = store.SetNXWithTTL(ctx, key, v, time.Minute)
```

### 4. Accept interfaces the caller already has, return concrete types

Take standard interfaces such as `io.Reader`, `fs.FS`, and
`context.Context`. Return the handle type, so godoc and autocomplete show
everything it can do.

```go
// Good
func Load(ctx context.Context, fsys fs.FS) (*Config, error)
func Open(ctx context.Context, rawURL string, opts ...Option) (*Store, error)

// Bad: a custom input type, and an interface return that hides methods.
func Load(ctx context.Context, src ConfigSource) (*Config, error)
func Open(ctx context.Context, rawURL string, opts ...Option) (StoreInterface, error)
```

### 5. A shared interface for code that runs in more than one mode

When the same caller code runs against a handle, a transaction, or a scoped
view, define one small interface they all satisfy. A scoped view returns
the same handle type.

```go
// Good: one function works on the pool and inside a transaction.
func Rename(ctx context.Context, q sqldb.Querier, id int64, name string) error {
	_, err := q.Exec(ctx, "UPDATE users SET name = ? WHERE id = ?", name, id)
	return err
}
err = Rename(ctx, db, 1, "Ada")
err = db.Tx(ctx, func(tx *sqldb.Tx) error { return Rename(ctx, tx, 1, "Ada") })
sessions := store.Namespace("sessions") // a *kv.Store

// Bad: every function is written twice, and a view is a new type.
func RenameDB(ctx context.Context, db *sqldb.DB, id int64, name string) error
func RenameTx(ctx context.Context, tx *sqldb.Tx, id int64, name string) error
sessions := store.Namespace("sessions") // a *kv.NamespacedStore with fewer methods
```

## Construction

### 6. Zero configuration on the golden path

The constructor works with no options. Defaults are correct, safe for
production, and documented. An option changes a default, never makes the
library work.

```go
// Good
db, err := sqldb.Open(ctx, os.Getenv("DATABASE_URL"), postgres.Driver())

// Bad: required knobs with no sensible default.
db, err := sqldb.Open(ctx, url, postgres.Driver(),
	sqldb.WithPlaceholderStyle(sqldb.Dollar),
	sqldb.WithErrorMapper(postgres.ErrorMapper),
	sqldb.WithPingOnOpen(true))
```

### 7. Functional options for tuning, a `Config` struct for describing a resource

Tuning uses `Option func(*options)` named `WithX`. A resource is described
by a `Config` struct with plain named fields, so a configuration loader can
fill it from files and the environment. A zero field means the documented
default, and durations accept strings like `"30s"`.

```go
// Good
db, err := postgres.Open(ctx, postgres.Config{
	Host:     "db.internal",
	Database: "app",
	User:     user,
	Password: password,
}, sqldb.WithMaxOpenConns(25))

// Bad: positional arguments, and a builder that cannot be loaded from config.
db, err := postgres.Open(ctx, "db.internal", 5432, "app", user, password, 25, 0, true)
db, err := postgres.NewBuilder().Host("db.internal").Database("app").Pool(25).Build(ctx)
```

### 8. Construction validates

Invalid options, conflicting settings, and limits the backend cannot honor
fail in the constructor, never later in the first call.

```go
// Good: the mistake surfaces at startup.
_, err := sqldb.Open(ctx, url, drv, sqldb.WithMaxOpenConns(-1))
errors.Is(err, sqldb.ErrInvalidOption) // true

// Bad: Open succeeds, and the first query in production fails.
db, _ := sqldb.Open(ctx, url, drv, sqldb.WithMaxOpenConns(-1))
_, err := db.Exec(ctx, q) // "invalid pool size"
```

### 9. Context first, cancellation honored

Every call that can block takes `ctx context.Context` first and stops when
it is done, including waits for locks, retries, and polling.

```go
// Good
err = store.Set(ctx, key, v)
applied, err := db.Migrate(ctx, migrations) // waits for a lock, honoring ctx

// Bad: no way to cancel, or a timeout knob instead of ctx.
err = store.Set(key, v)
applied, err := db.Migrate(migrations, 30*time.Second)
```

### 10. `Close` releases everything

A handle that holds resources has `Close() error`. godoc says whether the
zero value is usable.

```go
// Good
store, err := kv.Open(ctx, url, drv)
if err != nil {
	return err
}
defer store.Close()

// Bad: cleanup spread over several calls the caller must remember.
defer store.Flush()
defer store.StopReaper()
defer store.Pool().Shutdown()
```

## Calls

### 11. Generics where the call site gets safer or shorter

Return the caller's type directly. Type parameters stay out of signatures
where they only add brackets.

```go
// Good
user, err := sqldb.One[User](ctx, db, "SELECT id, email FROM users WHERE id = ?", id)
port, err := config.Get[int](cfg, "server.port")

// Bad: interface{} results and type assertions at every call.
v, err := db.QueryOne(ctx, &User{}, "SELECT id, email FROM users WHERE id = ?", id)
user := v.(*User)
port := cfg.Get("server.port").(float64)
```

### 12. Iterators for streams

Large or unbounded results return `iter.Seq2[T, error]`, so the caller
writes a `for range` loop and stops early by breaking.

```go
// Good
for user, err := range sqldb.Each[User](ctx, db, "SELECT id, email FROM users") {
	if err != nil {
		return err
	}
	process(user)
}

// Bad: a cursor protocol the caller must drive and close correctly.
cur, err := db.Cursor(ctx, "SELECT id, email FROM users")
defer cur.Close()
for cur.Next() {
	var u User
	if err := cur.Decode(&u); err != nil {
		return err
	}
	process(u)
}
if err := cur.Err(); err != nil {
	return err
}
```

### 13. Per-call options mirror construction options

Variadic options on the call, named like construction options, resolved
into one struct before any backend sees them.

```go
// Good
err = store.Set(ctx, key, v, kv.WithTTL(time.Minute), kv.IfNotExists())

// Bad: a positional zero value for "no TTL", and a bare bool.
err = store.Set(ctx, key, v, 0, true)
```

### 14. Inputs stay in the caller's words

The caller writes one form, and the library translates it for each backend.

```go
// Good: one placeholder style on every database.
_, err = db.Exec(ctx, "UPDATE users SET name = ? WHERE id = ?", name, id)

// Bad: the caller writes per-database syntax.
q := "UPDATE users SET name = ? WHERE id = ?"
if db.Dialect() == sqldb.Postgres {
	q = "UPDATE users SET name = $1 WHERE id = $2"
}
_, err = db.Exec(ctx, q, name, id)
```

## Errors

### 15. Sentinels, matched with `errors.Is`

Each failure a caller can act on has a package-level sentinel whose
message starts with `"<package>: "`. The caller never parses a message or
imports a backend's error type.

```go
// Good
if errors.Is(err, sqldb.ErrUniqueViolation) {
	return ErrEmailTaken
}

// Bad: string matching, and a backend import in application code.
if strings.Contains(err.Error(), "duplicate key") {
	return ErrEmailTaken
}
var pgErr *pgconn.PgError
if errors.As(err, &pgErr) && pgErr.Code == "23505" {
	return ErrEmailTaken
}
```

### 16. One error type carries context

Failures are a `*<package>.Error` with the operation and the sentinel,
unwrapping to both the sentinel and the original cause.

```go
// Good
var e *sqldb.Error
if errors.As(err, &e) {
	log.Printf("op=%s kind=%v", e.Op, e.Kind)
}
errors.Is(err, sqldb.ErrNotFound) // true
errors.Is(err, sql.ErrNoRows)     // also true

// Bad: the cause is flattened into a string and lost.
return fmt.Errorf("query failed: %v", err)
```

### 17. The message says what happened and where

Name the operation and the location. The sentinel's godoc says what to do
next.

```text
Good: sqldb: migrate: 0002_add_index.sql line 3: relation "users" does not exist
Bad:  error executing migration
```

### 18. Messages keep secrets out

No URLs, credentials, keys, or values in any message. Sensitive context is
a field on the error, left out of `Error()`.

```text
Good: sqldb: open: invalid url
Bad:  sqldb: open: parse "postgres://app:hunter2@db.internal/app": invalid port
Good: config: get "db.password": cannot convert string to int
Bad:  config: get "db.password": cannot convert "hunter2" to int
```

### 19. Errors are the only failure channel

Every failure is a returned error. A panic means a bug in the library.

```go
// Good
cfg, err := config.Load(ctx, fsys)
if err != nil {
	return err
}

// Bad: a Must variant as the primary API, or a panic on bad input.
cfg := config.MustLoad(ctx, fsys)
```

## Footguns

### 20. Mistakes fail loudly at the first chance

Typos and silent no-ops are errors. Loosening is an explicit, named option.

```go
// Good: a column with no matching field is caught.
type User struct{ ID int64; Email string }
_, err := sqldb.One[User](ctx, db, "SELECT id, emial FROM users WHERE id = ?", id)
errors.Is(err, sqldb.ErrScan) // true: "emial" matches no field
db, err := sqldb.Open(ctx, url, drv, sqldb.WithoutStrictScan()) // opt out by name

// Bad: the typo is ignored, Email is silently empty, and the bug ships.
user, err := db.QueryOne(ctx, "SELECT id, emial FROM users WHERE id = ?", id) // err == nil
```

### 21. Safe by default

The default never weakens security or durability. The unsafe variant, when
it exists at all, says so in its name.

```go
// Good
db, err := sqldb.Open(ctx, url, drv) // one statement per call, always
c, err := secrets.New(addr, token)   // the token is never sent to another host

// Bad: risky behavior on by default, behind an innocent name.
db, err := sqldb.Open(ctx, url, drv, sqldb.WithFastMode()) // turns on multi-statement queries
c, err := secrets.New(addr, token)                         // follows any redirect with the token
```

### 22. State is visible and recoverable

When an operation can leave partial state, the library records it, refuses
to continue past it, and documents the repair.

```go
// Good
_, err := db.Migrate(ctx, migrations)
if errors.Is(err, sqldb.ErrMigrationDirty) {
	// Documented: repair the schema, then clear the history row.
}

// Bad: the next run carries on over a half-applied change.
_, err := db.Migrate(ctx, migrations) // err == nil, schema silently inconsistent
```

### 23. Concurrency is documented and safe

The handle is safe for concurrent use, or godoc says exactly what is not.
Work that several processes run at startup takes turns.

```go
// Good: "A Store is safe for concurrent use." Ten replicas run Migrate at
// once, and each migration runs exactly once.
go handle(store)
go handle(store)

// Bad: undocumented, and the caller finds out from a data race.
var mu sync.Mutex // the caller guards a client the library never said was unsafe
```

## Escape hatches

### 24. One named hatch to the layer below

When callers will need the underlying client, expose it once, with godoc
that says what they give up. The hatch is the same on every backend.

```go
// Good
raw := db.SQL() // *sql.DB: no placeholder rewriting, no error classification

// Bad: per-backend accessors, so caller code depends on the backend.
pg := db.PostgresPool()
my := db.MySQLConn()
```

### 25. Per-call opt-out over global switches

Skip a behavior for one call, so one special call keeps the safety on for
the rest.

```go
// Good: the jsonb ? operator for one query, rewriting stays on elsewhere.
_, err = db.Raw().Exec(ctx, "UPDATE docs SET tagged = true WHERE data ? 'tag'")

// Bad: one query forces rewriting off for the whole application.
db, err := sqldb.Open(ctx, url, drv, sqldb.WithoutRebind())
```

## Caller testing

### 26. Callers can test without infrastructure

An in-memory backend, a memory URL, or an interface the caller's code
accepts lets application tests run with no server. Show it in an example.

```go
// Good
store, err := kv.Open(ctx, "memory:", memory.Driver())

// Bad: tests need a running server, or a hand-written mock of a huge interface.
store, err := kv.Open(ctx, "redis://localhost:6379", redis.Driver())
```

### 27. No global state

No package-level registries, singletons, or `init()` side effects. Two
handles in one process are independent, so parallel tests are safe.

```go
// Good: the drivers are values the caller passes.
db, err := sqldb.Open(ctx, url, postgres.Driver())

// Bad: a blank import registers a driver in a global map.
import _ "example.com/sqldb/postgres"
db, err := sqldb.Open(ctx, url)
sqldb.SetDefaultTimeout(5 * time.Second) // changes every handle in the process
```

## Documentation

### 28. Docs are call sites

README sections and godoc lead with code the caller writes, then state
each behavior as a fact the caller can observe. Every documented behavior
is implemented and tested.

```text
Good: a README that opens with the five-line golden path, then "Errors"
      with a table of sentinels and an errors.Is example.
Bad:  a README that opens with the internal architecture diagram and the
      package layout, and never shows a complete call.
```

### 29. Defaults, limits, and differences are tables

Options with their defaults, sentinels with their causes, backends with how
they differ: tables a caller scans to answer one question.

```text
Good:
| Option             | Effect                      | Default   |
| WithMaxOpenConns(n)| Most connections open       | Unlimited |

Bad: "You can also configure the maximum number of open connections, which
otherwise has no limit, as well as ..." buried in a paragraph.
```
