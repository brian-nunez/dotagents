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

## Approved models

### Claude Opus 5.5, medium effort

- **Dispatch:** native subagent (`Agent`), provider `claudeAgent`, model `claude-opus-5-5`, effort `medium`.
- **Use for:** implementation, integration, repo-wide changes, work that needs this harness's tools or Claude-side skills. The default whenever no reason points elsewhere.
- **Fallback:** Claude Sonnet 5.5 natively. Cross-family review still needs a non-Claude reviewer.
- **Observed:** not yet dispatched as a subagent. Record behaviour after the first run.

### GPT-6.1 Sol, low effort

- **Dispatch:** provider `codex`, model `gpt-6.1-sol`, `reasoningEffort: low` by default. Raise to `high` for design or complex builds, or `medium` for a fix round that needs judgement.
- **Use for:** building from a written spec, design implementation, mechanical fixes with a tight fence, independent review of Claude or Gemini work.
- **Fallback:** Claude Opus 5.5 for builds. Gemini 3.8 Flash for reviews.
- **Observed:**
  - Follows a detailed brief closely, including skills' multi-step workflows, once told the brief satisfies their interview gates.
  - Reports unverified items honestly. Reports a gate failure it did not cause instead of working around it.
  - Stays inside a scope fence.
  - Its self-critique catches rule violations (axe, overflow, greps) and misses taste problems, redundancy, and regressions its own fix introduced.
  - Produces exhaustive artifacts (62 screenshots) unless the brief names a shortlist.

### Gemini 4 Argon, high thinking

- **Dispatch:** provider `antigravity`, model `gemini-4-argon`, `thinking_level: high`. Limited quota.
- **Use for:** research that needs reasoning, brainstorming with a recommendation, independent review of high-stakes builds.
- **Fallback:** Gemini 3.8 Flash, then GPT-6.1 Sol for reviews, then Claude Opus or Sonnet on `antigravity`.
- **Observed:**
  - Grounds output in source and cites evidence. Across five reviews it never invented an API.
  - As an unanchored reviewer it found redundancy, broken wrapping, regressions, and contrast failures the builder's checks passed. It quantified problems (contrast ratios) rather than restating hunches.
  - Discovers repo conventions from docs without being told (SHA-pinned actions).
  - Optimises for completeness. Prune its output for audience.
  - Can miss a UI defect that looks intentional (a cut-off scroll strip).
  - Its sandbox cannot write outside the workspace.

### Gemini 3.8 Flash, high thinking

- **Dispatch:** provider `antigravity`, model `gemini-3.8-flash`, `thinking_level: high`. Generous quota.
- **Use for:** sweeps and triage, link and fact checks, inventories, completeness audits, first-pass and document review, summarising long material into a file.
- **Fallback:** `gpt-oss-120b-medium` on `antigravity` for mechanical work, GPT-6.1 Sol for reviews.
- **Observed:**
  - As the reviewer of this skill it read the writing standard and sibling skills unprompted and returned 12 quoted findings with replacement text. Most were sound: missing loop breaker, quota fallbacks, completion criteria, repo layout.
  - Applies style rules literally and lacks the judgement to see past them. It proposed cutting Brian's own framing words, and it labels taste preferences as "major". Re-rank its severities yourself.
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
