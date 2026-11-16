# Modeling, progress, and cross-application handoffs

## State and abstraction

Describe each state as a predicate over remembered data and relevant external conditions.
Preserve code/status names and map them to descriptive state names. Include null, unknown,
legacy, imported, restart/resume, and exceptional initial conditions when supported.

State configuration can contain independent dimensions and nested states. Keep payment,
shipment, review, and resource ownership separate when they evolve independently. Record
synchronization predicates and forbidden combinations instead of drawing every Cartesian
product. Group nested states where shared entry/exit or resume semantics justify it.

Identify whether a model describes an entity, job, attempt, worker, transport delivery,
session, or overall journey. Connect these models explicitly. A terminal attempt can
leave a parent retrying; a completed request can leave downstream work outstanding.

A transition can keep a visible status unchanged, update relevant data only, reenter a
state, or be a rejected/no-op command. Capture which inputs are legal, ignored, rejected,
or unresolved. Actions and emitted events need not each become states.

Document invariants as observed implementation rules, intended obligations, or hypotheses.
Do not silently impose preferred architecture or database conventions on existing behavior.
Unbounded counters, dynamic children, identifiers, and time belong in data domains. Any
finite abstraction must explain its mapping and lost distinctions.

## Atomicity and failure

For each transition, identify ordering and atomic commit boundaries across state writes,
external calls, message emission, acknowledgments, and replies. Distinguish request,
acceptance, execution, commit, and confirmation. Inspect rollback and error handling.

Document success, rejection, no-op, failure before effects, partial effects, and **unknown
outcome** separately when they leave different obligations. A provider timeout after an
effect may require reconciliation rather than a blind retry. Record deduplication keys,
locking/version/fencing guards, their scope, and behavior after crashes or replay.

For recovery, establish who retries, when, with which identifier, what exhaustion means,
which state remains, whether compensation exists, and how manual intervention is possible.
Avoid claiming exactly-once business effects from a transport label. Missing recovery is
a supported finding only after scoped searches; otherwise identify missing evidence.

## Cross-application tracing

Keep a local machine per authority and connect them through handoffs. Record:

- Producer transition, payload/version, recipient/routing, transport/shared store, and
  send-side commit boundary.
- Receipt, acknowledgment, consumer guard, processing/commit, and later confirmation.
- Entity IDs, attempt/message/delivery IDs, correlation/causation IDs, and identity
  split/merge relationships. These identifiers are not interchangeable.
- Delivery loss/duplication/reordering policy, retry ownership, timeouts, reconciliation
  authority, compensation, and escalation ownership.
- External contract limits and unknown receiver internals. An unavailable or non-Go
  application is a boundary, not permission to invent its states.

A common type, similar route name, shared correlation ID, or nearby timestamp is a lead.
Substantiate identity, routing, and causal linkage. Preserve concurrent or unknown order
where evidence cannot establish precedence. Distributed steps are not atomic merely
because they appear in one diagram.

## Open-ended states and progress

Classify every known state at the declared abstraction. Categories can overlap:

| Class | Required explanation |
| --- | --- |
| Terminal | Why the lifecycle ends here; reopening, retention/deletion exceptions; remaining parent obligations |
| Intentionally persistent | Continuing inputs, maintenance, suspension, cancellation, and teardown conditions |
| External/manual wait | Expected input/actor, owner, timeout policy or explicit absence, escalation |
| Time-bound wait | Deadline/clock authority, scheduler, exit action, missed-timer and cancellation races |
| Retry/recurrent loop | Enabling predicate, backoff, limits or absence, exhaustion, cancellation, exit |
| Potentially stuck/orphaned | Required progress, searched exits, missing mechanism/owner, competing explanations |
| Observation-censored | Start/end outside evidence window; no inferred termination from last event |
| Unknown semantics | Specific missing evidence, consequence, next step and owner or unassigned owner |

Separately classify the data state space as finite, abstracted, unbounded, dynamically
extensible, or unknown. Infinite data values and indefinite residence are different issues.

For each progress obligation, record start predicate, required target, responsible actor,
timer/escalation, environmental assumptions, and evidence. Separate safety (forbidden
conditions never happen) from liveness (required progress eventually happens). A graph exit
does not guarantee its guard will enable, its action will run, or an external actor will act.

Use **deadlock** for no modeled progress action; **livelock** for activity without required
progress; **starvation** for work perpetually bypassed while other work progresses. Label
these as candidates unless evidence/checking substantiates the claim. Ordinary waiting or
a truncated history does not prove a progress defect.

For optional formal checking, state the abstraction, implementation mapping, channel/crash
behavior, bounds, safety/liveness properties, and delivery/scheduling/fairness assumptions.
Report which properties actually ran and whether exploration completed. A checked model
under assumptions is not an automatically verified implementation; timeout is inconclusive.

Semantic reference: [W3C SCXML](https://www.w3.org/TR/scxml/) defines events, guards,
transitions, nested/parallel states, history, and final states. Use this vocabulary where
helpful; no SCXML runtime or file format is required.
