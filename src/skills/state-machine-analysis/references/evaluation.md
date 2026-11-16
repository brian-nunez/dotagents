# Behavioral evaluation when maintaining this skill

Use the bounded Go fixtures in [evals/fixtures](../evals/fixtures). They are analysis
inputs, not deployable applications. Their independently specified oracle is in
[expectations](../evals/expectations.md). Keep the oracle out of an evaluator's input
until it has produced a report.

1. Give an independent evaluator `SKILL.md`, its referenced analysis guidance, and the
   fixture source. Ask it to document all discovered machines and handoffs with the full
   report contract, using source-only evidence and a separate temporary output directory.
2. Withhold expectations and prior conclusions. No execution, installation, live data, or
   external writes are needed. The evaluator should state that semantic tooling and runtime
   evidence were not used if unavailable, and must not infer unknown provider internals.
3. Compare the report against the oracle. Score factual assertions and important omissions,
   not exact prose, state names, machine counts, or headings. Equivalent decompositions
   are acceptable when predicates, authority, obligations, and handoffs remain intact.
4. Inspect every required report area and diagram/table consistency. Require evidence for
   guards, effects, terminal claims, and recovery, with explicit inference/gap labels.
5. Fix demonstrated skill defects, then rerun affected scenarios. Preserve evaluation
   notes outside application reports; do not claim fixture success proves arbitrary-code recall.

Critical acceptance criteria: recover all oracle behaviors, reject the stateless decoy,
retain intent/runtime unknowns, preserve partial/unknown outcomes, expose lookup/scope gaps,
and perform no unauthorized side effects. Unsupported critical claims or missing critical
behavior fail evaluation regardless of average coverage.

For broader evaluation later, add independent cases for aliases, nested modules, generated
SQL/protocol code, interface wiring, build variants, manual recovery, censored histories,
sampled/missing events, duplicate/reordered messages, and server/parse failures. Vary names
and input ordering and rerun to detect brittle keyword dependence. Define the oracle first.

The checked-in fixture packages use the standard library only. If Go is available, compile
them with `GOWORK=off GOTOOLCHAIN=local go test ./...` from `evals/fixtures`; this checks
fixture compilation, not the skill's discovery behavior. Validate skill frontmatter and
relative links separately using available skill tooling. No new runtime dependency or
application execution is required.
