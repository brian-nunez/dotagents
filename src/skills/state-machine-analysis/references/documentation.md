# Full documentation contract

The report is the primary deliverable. Full documentation means every applicable field
is accounted for, with evidence, labeled inference, an explained non-applicability, or an
explicit gap and next step. It does not mean all fields are known or all behavior verified.
Use stable IDs for machines (`M-...`), states (`S-...`), transitions (`T-...`), handoffs
(`H-...`), evidence (`E-...`), and findings/questions (`F-...`). Preserve IDs across updates.

## Artifact layout

Match existing documentation conventions. A suitable default is:

```text
docs/state-machines/
  index.md                 Scope, machine/journey index, summary, limitations
  machines/<subject>.md    One full dossier per machine or tightly related family
  handoffs.md              Boundary tables and cross-application sequence diagrams
  evidence.md              Assertion provenance and conflicts
  coverage.md              Inspection, candidate dispositions, remaining frontier
  findings.md              Risks, contradictions, unanswered questions, next steps
```

Small reports can combine files while preserving the same information. Do not create
empty placeholder files. Link all artifacts from the index and use repository-relative
source links with line anchors where the renderer supports them, plus revision and
symbol identity. Diagrams are required views, not substitutes for detailed tables.

## Index and scope manifest

Record request/purpose, repositories/applications, revisions/snapshots, environments,
modules/packages, configurations/build constraints, owners, external actors, sources
available/unavailable/excluded, analysis methods, and remaining frontier. For runtime
evidence include interval, deployment version, population, retention, sampling, and gaps.

List every accepted machine with subject/identity, purpose, owner, application/journey,
related machines, evidence status, and dossier link. Include rejected/merged/unresolved
candidates in coverage rather than silently dropping them.

## Per-machine dossier

Use these sections; expand tables when rows need detailed explanations.

1. **Identity and purpose:** stable ID, subject/key, abstraction level, owner, business
   meaning, boundaries, applicable versions/configurations, authoritative storage and projections.
2. **State representation:** fields and data domains, predicates, literal statuses/aliases,
   defaults/nulls/legacy values, persistence, creation/import/restart/resume conditions.
3. **Stages and composition:** business stages, nested/orthogonal dimensions, parent/child
   machines, invariants and forbidden combinations with evidence status.
4. **Inputs and outputs:** APIs/UI/commands/events, timers/startup/admin/human inputs;
   payload shape, validation/authorization, producer/consumer, identity, response/event/data
   outputs, side effects, timing and commit meaning. Reference contracts instead of copying
   entire large schemas; include the fields relevant to lifecycle behavior.
5. **States:** state table and Mermaid state diagram. Show initial/terminal semantics only
   where supported; retain unknown exits and external waits visibly.
6. **Transitions:** complete transition rows, including rejection, internal/no-op behavior
   where relevant. Separate error outcomes when their outstanding obligations differ.
7. **Failure and recovery:** partial/unknown outcomes, retry/backoff/exhaustion, replay,
   crash/restart, cancellation races, compensation, reconciliation, and manual repair.
8. **Time and progress:** deadlines, clock authority, scheduler, state classifications,
   exit predicates, safety/liveness obligations, assumptions, monitoring/escalation and ownership.
9. **Handoffs and histories:** link boundary records and participating machines; representative
   source-supported or observed paths, failure/recovery paths, contradictory histories and gaps.
10. **Evidence and maintenance:** assertion links, limitations, checks actually performed,
    open questions, revision/window, stale evidence, and revalidation triggers/owner.

### State table

| State ID/name | Literal status/stage | Predicate and authority | Entry/defaults | Legal inputs and exits | Open-ended class/obligations | Evidence/gaps |
| --- | --- | --- | --- | --- | --- | --- |

### Transition table

Each row or linked detail must account for all these fields:

| ID | Source configuration | Trigger/input contract | Preconditions/guards | Handler and mutations | Destination predicate | Outputs/effects | Failure/recovery | Evidence/status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |

Include evaluation order when material, unchanged dimensions, identity/configuration,
rejection/no-op semantics, transaction and acknowledgment boundaries, concurrency/locking,
duplicates/idempotency, retries, and timeout/cancellation interaction. Large details belong
under the transition ID instead of unreadable table cells. A hypothesized edge stays labeled
as inference; its appearance in a diagram cannot upgrade it to implemented behavior.

### Diagram rules

- Use Mermaid `stateDiagram-v2` for each machine. Preserve independent regions/submachines
  instead of flattening all combinations. Label triggers and material guards; key edges to
  transition IDs, with detailed behavior in the table.
- Use Mermaid `sequenceDiagram` for cross-application journeys, including acknowledgment,
  commit, asynchronous processing, and failure/unknown intervals where relevant.
- Describe an edge as inferred/unknown directly in its label or adjacent legend. A final
  marker requires termination evidence. Check every diagram state/edge against the tables.
- Render with an existing renderer when available; otherwise report that only source-level
  consistency was checked. Do not install rendering tools solely to satisfy an unstated check.

## Handoff table

| ID/journey | Producer machine/transition | Contract/version and routing | Transport/shared store | Sender commit | Receipt/ack | Consumer guard/commit | Identity/causation | Failure and recovery ownership | Evidence/gaps |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

Include split/merge identities, delivery/order/loss policy, duplicate handling, retry and
timeout owners, reconciliation authority, compensation, and manual escalation. Document
an unavailable receiver by observable contract, with its internals explicitly uninspected.

## Evidence register

| ID | Kind | Revision/snapshot and location | Claim IDs supported | Applicability/window | Limits/conflicts |
| --- | --- | --- | --- | --- | --- |

Kinds include implementation, schema, contract, requirement, owner statement, runtime
witness, experiment, formal result, and analyst inference. Assertion labels may coexist:
**declared**, **statically supported**, **observed**, **experimentally exercised**,
**model-checked within bounds**, **inferred**, **unresolved**, **contradicted**.
An owner statement needs authority/date; an unknown owner is explicitly unassigned.

Keep per-assertion provenance: one source for a dossier does not substantiate every guard.
Distinguish static feasibility from presence of code. Preserve raw evidence references
and interpretation assumptions. Redact sensitive data; avoid embedding unnecessary payloads.

## Coverage ledger and findings

| Scope item/candidate | Discovery route | Inspection/disposition | Evidence and machine IDs | Gap/remaining frontier | Owner/next action | Closure rationale |
| --- | --- | --- | --- | --- | --- | --- |

Inspection states: queued, inspected, partially inspected, unavailable, excluded-with-reason.
Candidate outcomes: accepted, merged, rejected-with-reason, unresolved. Keep inspection,
documentation, and validation status separate.

Report denominators: inspected/enumerated sources, disposed/discovered candidates,
paired/discovered in-scope handoffs, documented/discovered transitions, and evidence-backed
versus inferred/unresolved assertions. Mark provisional inventories. These are bounded
coverage measures, not estimates of undiscovered-machine recall. Avoid a combined confidence
percentage. Runtime and test/model coverage are relative to their evidence/model scope.

Findings need evidence, violated intent/invariant or unresolved question, impact, affected
machines/handoffs, proposed next step, and owner/unassigned owner. Separate demonstrated
defects from risk hypotheses and unavailable evidence. Report intentional persistent states
without treating their lack of a terminal state as a defect.

## Final consistency and completion checks

- Every enumerated surface/candidate has a disposition; unsupported scope remains visible.
- Every accepted machine has the dossier fields and a diagram; every diagram edge maps
  to a table row; every material state/transition assertion has evidence or a gap label.
- Every discovered in-scope handoff is paired or explicitly unresolved. Non-Go/unavailable
  internals remain boundaries. Rejected/no-op behavior, startup, failure, and recovery are accounted for.
- Every state has wait/termination semantics; unbounded data and incomplete observations
  are distinguished from indefinite execution. Progress claims list assumptions.
- Static/runtime/intent disagreements, proposed checks, actual results, and remaining
  frontier are separate. No planned test is reported as passing.
- State discovery, documentation, and validation completion independently. Give artifact
  links, scope/revision/window, material findings, limitations, and next decisions.
