# Backend rules

For libraries that put one API in front of several backends, drivers, or
providers. The goal is **parity**: the backend is a deployment choice, and
switching it changes one URL or one constructor, never the caller's code.
The examples use the illustrative `kv` and `sqldb` libraries from
[`usage-rules.md`](usage-rules.md).

## Parity

### 1. The parent owns the experience

The parent package exports the handle, the options, the errors, and every
behavior shared by the backends: validation, option resolution, input
translation, namespacing, typed values, error wrapping. A backend receives
validated, resolved input and does only what is specific to it.

```go
// Good: the parent validates and namespaces once; backends get final keys.
func (s *Store) Set(ctx context.Context, key string, v []byte, opts ...SetOption) error {
	if err := validKey(key); err != nil {
		return err
	}
	return s.backend.Set(ctx, s.prefix+key, v, resolve(opts))
}

// Bad: every driver validates and prefixes keys its own way, so the same
// key is accepted by one backend and rejected by another.
func (b *redisBackend) Set(ctx context.Context, key string, v []byte, ttl time.Duration) error
```

### 2. Every backend does everything

The parent defines one backend interface and every backend implements all
of it. A capability enters the library only when every backend provides
it, natively or emulated by the parent.

```go
// Good: Incr works everywhere, so callers just call it.
n, err := store.Incr(ctx, "hits", 1)

// Bad: optional capabilities the caller must probe for.
if inc, ok := store.Backend().(kv.Incrementer); ok {
	n, err = inc.Incr(ctx, "hits", 1)
} else {
	return kv.ErrUnsupported
}
```

### 3. Drivers expose construction only

A driver package exports `Driver()`, a typed `Open(ctx, Config, opts...)`,
and its `Config`, and returns the parent's handle. Every feature lives on
the parent's handle.

```go
// Good: the driver's whole exported surface.
func Driver() sqldb.Option
func Open(ctx context.Context, cfg Config, opts ...sqldb.Option) (*sqldb.DB, error)
type Config struct{ Host, Database, User, Password string }

// Bad: features that exist on one backend only, so caller code now
// depends on that backend.
func ListenNotify(ctx context.Context, db *sqldb.DB, channel string) (<-chan string, error)
func Open(ctx context.Context, cfg Config) (*postgres.DB, error) // its own handle type
```

### 4. A capability is designed for every backend at once

Adding one means designing how each backend provides it before writing any
of it. When only the parent can make backends behave the same, the work
lives in the parent.

```go
// Good: the parent splits a migration file into statements itself, so
// every database runs the same files and no driver changes.
applied, err := db.Migrate(ctx, migrations)

// Bad: the feature ships for the first backend, with a TODO for the rest.
applied, err := sqlite.Migrate(ctx, db, migrations) // postgres and mysql: later
```

### 5. Inherent differences keep one API

When a backend's nature forces a different outcome, the call stays the
same, the library picks the safest behavior that backend allows, and the
README states the difference in a table.

```go
// Good: one call. The README table says one database rolls a failed
// migration back and another records it as dirty, because it commits
// schema changes immediately.
applied, err := db.Migrate(ctx, migrations)

// Bad: the difference becomes API the caller must branch on.
if db.Dialect() == sqldb.MySQL {
	applied, err = db.MigrateNonTransactional(ctx, migrations)
} else {
	applied, err = db.MigrateTransactional(ctx, migrations)
}
```

## Construction

### 6. Two entry points

From a URL, the caller passes the drivers it supports and the scheme picks
one. Typed, the driver's `Open` takes a `Config`. Both return the same
handle and accept the same options.

```go
// Good: the same binary uses SQLite locally and Postgres in production.
db, err := sqldb.Open(ctx, os.Getenv("DATABASE_URL"),
	sqlite.Driver(), postgres.Driver(), sqldb.WithMaxOpenConns(25))
db, err := postgres.Open(ctx, postgres.Config{Host: "db.internal", Database: "app"},
	sqldb.WithMaxOpenConns(25))

// Bad: switching databases means editing code.
db, err := sqldb.OpenPostgres(ctx, host, dbname)
db, err := sqldb.OpenSQLite(ctx, path)
```

### 7. Drivers are passed explicitly

The parent never imports a driver and keeps no registry, so the binary
holds only the backends the caller passed.

```go
// Good
db, err := sqldb.Open(ctx, url, sqlite.Driver(), postgres.Driver())

// Bad: blank imports register drivers globally, and the parent's go.mod
// pulls in every database client.
import _ "example.com/sqldb/drivers/postgres"
db, err := sqldb.Open(ctx, url)
```

### 8. URL errors are sentinels without the URL

An unparsable URL or a missing scheme is `ErrInvalidURL`. A scheme no
passed driver handles is `ErrUnknownDriver`. Neither message contains the
URL or its credentials.

```go
// Good
_, err := sqldb.Open(ctx, "mysql://app:hunter2@db/app", postgres.Driver())
errors.Is(err, sqldb.ErrUnknownDriver) // true
// err.Error(): sqldb: open: unknown driver: scheme "mysql"

// Bad
// err.Error(): no driver for mysql://app:hunter2@db/app
```

## Dependencies

### 9. The parent stays light

The parent uses the standard library first and carries no backend client
library in its `go.mod`. Each driver is its own module, so importing the
parent pulls in no backend.

```text
Good:
example.com/sqldb                  go.mod: no requires
example.com/sqldb/drivers/postgres go.mod: requires sqldb, a Postgres client
example.com/sqldb/drivers/sqlite   go.mod: requires sqldb, a SQLite engine

Bad:
example.com/sqldb                  go.mod: requires every database client,
                                   so a Postgres-only app compiles SQLite too
```

## Enforcement

### 10. A conformance suite defines parity

The parent ships a `<package>test` package that runs the caller-visible
behavior against a backend. Every driver runs it, with unit tests against a
fake, and integration tests against the real backend behind an environment
variable. A behavior is part of the contract only when the suite tests it,
including every documented difference.

```go
// Good: each driver's test file runs the parent's suite.
func TestConformance(t *testing.T) {
	kvtest.Run(t, kvtest.Config{
		NewBackend: func(t *testing.T) kv.Backend { return newTestBackend(t) },
	})
}

// Bad: each driver writes its own tests, so behavior drifts unnoticed.
func TestRedisSetGet(t *testing.T) { /* checks what this author thought of */ }
```

### 11. Parity is verified on the real backends

Before a capability ships, the suite passes against every real backend the
library supports.

```text
Good: kvtest passes against memory, Redis, Valkey, and the SQL backend
      before the release that adds the capability.
Bad:  the capability ships after passing against the in-memory fake, and
      the first Redis user finds the difference.
```
