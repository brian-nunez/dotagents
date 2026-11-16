# Runtime reconciliation and optional assurance

Use existing authorized exports or approved access. This mode enriches documentation;
missing telemetry does not block a source-based report or authorize instrumentation changes.

## Qualify evidence first

Record environment, deployment revision/configuration, interval, retention, population,
sampling/drop metadata, event meanings, clock reliability, and known gaps. Keep versions
separate. A database snapshot gives current predicates, not necessarily their history.
Logs may contain sensitive values; use approved locations and redacted references.

Establish event identity, subject identity, attempt/delivery identity, causation/correlation,
and ordering. One event can affect several entities; one journey can span several traces.
Keep split/merge relationships rather than forcing everything into one case ID. Record
normalization rules, duplicates, occurrence/recording/ingestion times, and unknown order.

## Reconstruct and compare

- Build observed histories and variants with evidence references; associate predicates and
  commit results only when recorded semantics support them. Trace spans often describe
  technical operations rather than business state.
- Compare each observed transition with implementation and intent. Investigate runtime-only
  paths, missing writers, old versions, manual interventions, or incorrect event mapping.
- Retain source-supported unobserved paths. A rare branch absent from retained traces is
  not proven unreachable. A last activity is not proof of terminal business completion.
- Separate active/persistent cases from histories cut off at either end of the observation
  window. Finite observation cannot prove indefinite waiting or universal eventual progress.
- Timestamp adjacency or a process-mining directly-follows edge does not prove causality.
  Prefer explicit send/receive, transaction, causation, and compatible implementation evidence.

Report observed timing/frequency only for the qualified population. Sampling and missing
events can bias results. If evidence is unsuitable, deliver a specific gap list instead of
silently mining misleading sequences. Process-mining tools are optional; no dependency is
required to reconstruct a small history or compare it with transition tables.

## Targeted experiments

For an important gap, propose a bounded sequence in a resettable authorized environment:
inputs, starting predicates, controlled failures/time, independent expected effects,
observation points, reset/cleanup, limits, and side-effect containment. Cover relevant guard
boundaries, retry exhaustion, duplicate/reordered delivery, cancellation, restart, and lost
confirmation. Record actual execution separately from the plan.

Generated paths cover only the supplied model and chosen values/schedules. Testing each
edge once does not establish all combinations, guards, histories, or implementation behavior.
Formal assurance is likewise selective; use the bounds and correspondence requirements in
[modeling](modeling.md). Neither method is mandatory for ordinary documentation.

References: [OpenTelemetry traces](https://opentelemetry.io/docs/concepts/signals/traces/)
and [sampling](https://opentelemetry.io/docs/concepts/sampling/) describe telemetry structure
and selection; [PM4Py features](https://processintelligence.solutions/pm4py/features)
describe event-log discovery and conformance capabilities. These are reference capabilities,
not required tools or proof of complete lifecycle coverage.
