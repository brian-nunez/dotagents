# Go discovery

Use these independent seed families, then trace their relationships. Searches supply
candidates, not machine boundaries or proof. Adapt queries to repository vocabulary.

## Inventory execution surfaces

- Enumerate `go.mod`, `go.work`, `cmd/`, package roots, build tags, generated files,
  platform variants, SQL/migrations, schemas, API/event definitions, and non-Go boundaries.
- Find HTTP/RPC handlers, route and middleware registration, CLI/admin commands, service
  construction, worker pools, subscribers, scheduled jobs, polling loops, startup/restart,
  shutdown, and cleanup. Follow wiring to determine applicable concrete implementations.
- Include human queues, support scripts, import/backfill paths, and direct storage writers
  when in scope. Mark unavailable code or operational intervention explicitly.

Example starting searches:

```sh
rg --files -g '*.go' -g '*.sql' -g 'go.mod' -g 'go.work' -g '*.proto' -g '*api*.yaml'
rg -n -g '*.go' 'Status|State|Phase|Stage|Pending|Complete|Cancel|Retry|Expire'
rg -n -g '*.go' 'time\.(After|NewTimer|NewTicker)|context\.(WithCancel|WithTimeout)|select[[:space:]]*\{'
rg -n -g '*.go' -g '*.sql' 'UPDATE|INSERT|DELETE|RowsAffected|CompareAndSwap|Subscribe|Publish'
```

Also enumerate files omitted by these globs and default ignore rules before claiming
scope coverage. Inspect relevant generated code rather than excluding it by marker;
document vendor/external ownership and any exclusions. Secrets remain outside routine
discovery. Avoid bulk dumping configuration values or environment variables.

## Find state without status names

Inspect:

- Struct fields, typed constants/`iota`, booleans, nullable pointers/`sql.Null*`, timestamps,
  counters/limits, version numbers, tokens, map membership, child records, and file markers.
- Locals retained by closures, goroutine/channel lifecycle, `select`, context cancellation,
  locks/atomics, `sync.Once`, connection/session pools, and resource open/close obligations.
- SQL `WHERE` predicates, constraints/defaults, `CASE`, `RETURNING`, affected-row checks,
  trigger definitions, transaction isolation, compare-and-set, and claim/lease queries.
- Derived state: expiration can enable reclamation without a write; record absence can
  permit creation; a stale token can reject completion even when a displayed status agrees.
- Configuration/feature flags, permissions, scheduler registration, and process lifetime
  that change which transitions are enabled.

State variables can encode several dimensions. `Failed` may finish one attempt while its
parent remains retryable; `Paid` need not mean shipped. Reject analytics/display labels
without evidence of remembered behavior or obligations, retaining the rejection rationale.

## Trace a candidate

1. Establish the subject and identity keys, creation/defaults, persistence, and authority.
2. Locate field/type references and inspect each use as read, guard, write, serialization,
   display, or unrelated. Follow aliases, pointers, helper calls, interfaces, and SQL bindings.
3. For each writer, inspect callers, entry points, prior-state guards, rejected branches,
   mutations, returned results, deferred work, errors, transaction boundaries, and effects.
4. Follow outputs into downstream consumers and recovery handlers. A successful HTTP
   response, queued message, or goroutine launch may only acknowledge acceptance.
5. Inspect all relevant exits: early returns, panic/recover, context cancellation, `defer`,
   timer expiry, restart, loss of ownership, exhausted counters, and manual operations.
6. Record alternative implementations/build configurations and unresolved dispatch. A
   possible implementation is not evidence that runtime wiring selects it.

Use a work queue with stable candidate IDs and a visited set keyed by revision,
package/symbol or storage identity, and configuration. Retain the reason each frontier
item was added. Stop recursion at a documented boundary, resolved item, or explicit run
limit; report everything left. No fixed depth establishes semantic completeness.

## Go-specific distinctions

- An error return may follow a committed database or provider effect. Trace ordering.
- `defer` runs on return/panic unwinding, but abrupt process exit and crashes differ.
- Context cancellation is a signal; verify that each callee observes it and how effects
  already in flight resolve. An expired context does not imply an external effect failed.
- Channel closure, sender completion, receiver drain, and worker shutdown are separate
  conditions. Synchronization must come from actual code, not diagram order.
- Database enum values are a domain, not a transition table. Tests assert selected behavior;
  examples and missing test cases do not establish universal guards.
- Two services importing the same Go type may have independent lifecycle authority.

Complete this pass with candidates and a disposition for every discovered relevant use,
including non-machines, merged candidates, unsupported paths, and missing evidence.
