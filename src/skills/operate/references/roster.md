# Roster

The models Brian has approved for dispatch, with their budget tier and observed behaviour. Confirm ids and options with the harness's capability listing once per session. In T3 Code that is `orchestrator_capabilities`, and the call is `delegate_task` with a `target`.

## Budget tiers

| Subscription | Tier | What it covers |
| --- | --- | --- |
| Claude, $100/month | Plentiful | Opus 5.5 as the operator and as native subagents |
| OpenAI, $20/month | Scarce | GPT-6.1 Sol |
| Google, $20/month | Scarce, uneven | Gemini 4 Argon (limited), Gemini 3.8 Flash (generous), plus Opus, Sonnet, and GPT-OSS 120B through the Google provider |

## Capability ranking

Capability gaps between these models are wide. Opus 5.5 at max effort is in a different class from Gemini 3.8 Flash at high. Match the model to the judgement a task needs, and weigh every result by who produced it.

1. **Claude Opus 5.5** (the operator, and native subagents at medium). Strongest reasoning and judgement.
2. **GPT-6.1 Sol** and **Gemini 4 Argon**. Strong. Their findings are usually sound and still get checked against Brian's intent.
3. **Gemini 3.8 Flash**. Fast and cheap, with shallow judgement. Good for mechanical sweeps and catching gaps. Its findings are leads that you verify one by one before acting.

## Observations

Observations record what each model can and cannot do, so any operator on any project dispatches and briefs it well. Every entry is **portable**: it would change how you dispatch or brief that model on an unrelated repository. Project lessons (the feature built, the defects found, file names, repo tooling quirks) go in the run's report or the project's own docs.

Write each entry in one slot, naming the task class and effort generically ("security review of a backend service, high effort", "multi-file build from a spec"):

- **Reliable at:** task class, effort: behaviour you can count on.
- **Weak at:** task class, effort: the failure mode. Compensate: the briefing or verification move that covers it.
- **Brief it with:** a briefing move that changed this model's result.

End each entry with its evidence, `(seen once)` or `(repeated)`. Reconcile before adding: mark an entry `(repeated)` when a run confirms it, rewrite or prune it when a run contradicts it, and add a line only for a capability no entry covers. Moves that hold for every model go in [Briefing moves](#briefing-moves-that-changed-results).

Portability test, applied to every new or changed entry: it names no project, phase, feature, file, package, or specific defect, and it would still hold on an unrelated repository.

## Approved models

### Claude Opus 5.5, medium effort

- **Dispatch:** native subagent (`Agent`), provider `claudeAgent`, model `claude-opus-5-5`, effort `medium`.
- **Use for:** implementation, integration, repo-wide changes, work that needs this harness's tools or Claude-side skills. The default whenever no reason points elsewhere.
- **Fallback:** Claude Sonnet 5.5 natively. Cross-family review still needs a non-Claude reviewer.
- **Observed:** not yet dispatched as a subagent.

### GPT-6.1 Sol, low effort

- **Dispatch:** provider `codex`, model `gpt-6.1-sol`, `reasoningEffort: low` by default. Raise to `high` for design or complex builds, or `medium` for a fix round that needs judgement.
- **Use for:** building from a written spec, design implementation, mechanical fixes with a tight fence, independent review of Claude or Gemini work.
- **Fallback:** Claude Opus 5.5 for builds. Gemini 3.8 Flash for reviews.
- **Observed:**
  - **Reliable at:** builds from a detailed brief: follows it closely, including a skill's multi-step workflow once the brief satisfies its interview gates, and stays inside a scope fence. (seen once)
  - **Reliable at:** reporting: lists unverified items honestly, and reports a gate failure it did not cause instead of working around it. (seen once)
  - **Weak at:** self-critique of its own build: catches rule violations (accessibility checks, overflow, greps) and misses taste problems, redundancy, and regressions its own fix introduced. Compensate: an independent review after every round. (seen once)
  - **Brief it with:** a named shortlist of artifacts. Without one it produces exhaustive output. (seen once)

### Gemini 4 Argon, medium thinking

- **Dispatch:** provider `antigravity`, model `gemini-4-argon`, `thinking_level: medium` by default, `low` for lighter passes. Limited and expensive quota, so every Argon dispatch needs a reason. Use `high` only when Brian asks for it or the reasoning clearly demands it.
- **Use for:** research that needs reasoning, brainstorming with a recommendation, independent review of high-stakes builds.
- **Fallback:** Gemini 3.8 Flash, then GPT-6.1 Sol for reviews, then Claude Opus or Sonnet on `antigravity`.
- **Constraint:** its sandbox cannot write outside the workspace.
- **Observed** (all at `high`; recalibrate as medium-effort runs come in):
  - **Reliable at:** grounded review: cites source evidence and has not invented an API. (repeated)
  - **Reliable at:** unanchored UI review: finds redundancy, layout breakage, regressions, and contrast failures that builder checks pass, and quantifies them instead of restating hunches. (seen once)
  - **Reliable at:** discovering repo conventions from docs without being told. (seen once)
  - **Weak at:** UI review: misses a defect that looks intentional. Compensate: name suspect categories in the review brief. (seen once)
  - **Brief it with:** the audience for the output. It optimises for completeness, so prune what it returns. (seen once)

### Gemini 3.8 Flash, high thinking

- **Dispatch:** provider `antigravity`, model `gemini-3.8-flash`, `thinking_level: high`. Generous quota.
- **Use for:** sweeps and triage, link and fact checks, inventories, completeness audits, first-pass and document review, summarising long material into a file.
- **Fallback:** `gpt-oss-120b-medium` on `antigravity` for mechanical work, GPT-6.1 Sol for reviews.
- **Observed:**
  - **Reliable at:** document review against a writing standard: reads the standard and related documents unprompted and returns quoted findings with replacement text, most of them structurally sound. (seen once)
  - **Weak at:** judgement in review: applies style rules literally, proposes cutting deliberate framing, and labels taste preferences as major. Compensate: re-rank its severities and check every finding yourself. (seen once)
  - Brian's assessment: not very intelligent at high thinking. Use it where breadth matters more than judgement, and treat every finding as unconfirmed until you check it.

## Also available through the Google subscription

Use these when an approved model is out of quota or a task specifically suits them. They draw on the scarce Google budget.

- `claude-opus-5-5` and `claude-sonnet-5-5` on `antigravity`: Claude work while the Claude subscription is constrained.
- `gpt-oss-120b-medium` on `antigravity`: bulk mechanical text work.

## Briefing moves that changed results

- Inline hard rules held through four handoffs. Rules left behind a pointer get skimmed.
- "Decide and log, the brief is confirmed" let interview-gated skills run autonomously.
- A runnable "Done when" made agents run checks instead of claiming them.
- A measurable target came back measured. A vague one came back as an adjective.
- "Don't trust the builder's claim" made reviewers mark a fix as partially resolved when it had introduced a regression.
- A category-level hint in a review prompt, plus required evidence, got the reviewer to quantify a suspected problem instead of echoing it.
