# Independent oracle for bounded Go fixtures

Use after reconstruction, not as input to it. Naming and decomposition can vary; require
the following behavior and evidence. These fixtures intentionally leave some mechanisms
absent. Report absence within the fixture scope, not an estate-wide production conclusion.

## Lease predicates

- Zero-value unfinished record is acquirable with nonempty token and positive duration.
  Active means `expiresAt.After(now)`; equality is expired. Time comes from the caller.
- Acquire on expired records replaces the token/expiry, and a finished record rejects it.
- Renewal/completion require matching nonempty token and strictly active lease; renewal
  additionally requires positive duration. All three methods use a mutex.
- Expiration changes eligibility without a write. No automatic reclaimer, timer, scheduler,
  background renewal, or progress guarantee exists in this scope.
- Finished is terminal for these methods even though stale token/expiry remain. Tokens
  are accepted from callers; uniqueness/freshness is not enforced, so fencing safety cannot
  be inferred merely from token equality.

## Independent dimensions and attempts

- Order payment, hold, and shipping are separate predicates. Dispatch requires payment,
  absence of hold, and not already shipped. Repeated dispatch rejects; confirmation and hold
  updates can still occur after shipping, so shipping is not whole-order terminality.
- Fields are exported: method guards do not establish invariants against arbitrary callers
  writing fields. Concurrency, storage durability, external fulfillment, and configured
  initial values beyond Go zero values are not supplied.
- Job Run rejects Done or Attempts >= Limit. Zero/default Limit permits no attempt.
  Accepted Run increments Attempts before outcome. Failure returns a failed attempt while
  the parent stays unfinished, retryable only if below its limit. Exhaustion blocks further
  runs without setting Done or a failed parent status. Success sets Done and returns a
  succeeded attempt. No scheduled retry/backoff or reset mechanism is shown.
- Attempt result may be modeled as a per-invocation outcome rather than an invented
  persisted multi-step machine. Preserve its distinction from Job state.
- NormalizeStatus is a stateless transformation, not a machine despite its name.

## Handoff and partial effects

- Request.Sent short-circuits repeated Send calls. Otherwise Publish is called before the
  local marker; publish error returns directly. Provider behavior after an error is unknown.
- Publish success followed by FailPersist returns an error with Sent still false. A later
  call can republish the same ID; there is no atomic outbox or durable storage implementation.
  The error text alone does not establish real database persistence.
- Receiver deduplicates by Message.ID and marks Seen before Apply. Assuming an initialized
  map and serialized calls, failed Apply still leaves Seen true; replay then returns nil
  without another Apply. This is a demonstrated suppression path within those assumptions.
- Nil Seen panics at assignment; concurrent access has no shown synchronization. Seen
  durability and initialization/wiring are unknown. Apply effects on error are unknown.
- Message.ID and OrderID have different roles. Shared message type does not prove actual
  routing or connection: no concrete Publisher wires sender to receiver. Document this
  as a candidate handoff with matching type, unresolved transport/routing/ack semantics,
  external callback behavior, and missing retry/reconciliation ownership.

## Full-report and scope checks

Require state/transition predicates, legal and rejected/no-op behavior, inputs/outputs,
failure/recovery/progress, tables and diagrams, evidence references, scope/coverage,
candidate dispositions, and unresolved details. Source-only analysis must not claim runtime
witnesses, real gopls queries, formal verification, or known business intent. Missing
telemetry is unavailable evidence, not an excuse to omit full dossiers.

Critical failures include invented routing or atomicity, guaranteed unique tokens,
automatic expiry/retry progress, whole-order terminality at shipping, failed attempt
equated with permanently failed Job, a machine invented for NormalizeStatus, or claiming
all machines in arbitrary applications were found.
