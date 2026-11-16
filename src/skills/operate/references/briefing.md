# Briefing templates

Fill every section. Delete a section only when it truly does not apply.

## Work brief

```markdown
You are the <role> for <deliverable>. Workspace: <absolute path>.

## Goal
<What to produce and why it matters, in two or three sentences.>

## Source of truth
<Absolute path or ref, e.g. "latest origin/main, snapshot at <path>". Name anything stale to avoid.>

## Authority and boundaries
- Brian and the operator are unavailable mid-task. Decide, log each decision and its reason in <decisions file>, and continue.
- Any interview or confirmation step in a skill you run is satisfied by this brief.
- Hand back to the operator for commits, pushes, PRs, deploys, and dependency changes. Leave git state as you found it.
- <Scope fence, e.g. "fix only these findings".>

## Inputs
<Files to read first, skills to follow by absolute path.>

## Hard rules
<Every rule that applies to the output, stated inline.>

## Done when
- <Runnable check with the exact command.>
- <Measurable target.>
- <Named outputs at named paths, e.g. a screenshot shortlist.>

## Reply
At most <N> lines: what changed, check results, and anything left unverified.
```

## Review brief

```markdown
You are an independent reviewer of <deliverable>. Workspace: <absolute path>.
Your only write is <review file>. Leave everything else untouched.

## Under review
<Paths.>

## Bar
<Acceptance checklist path or inline criteria.>

## Review
1. Freshness and completeness against an external reference: <remote HEAD, inventory, upstream docs>.
2. Facts: verify every claim against <source of truth>.
3. Hard rules: <inline>.
4. Quality, judged as <named expert> against <Brian's stated goal>.
5. Technical: <links, accessibility, config, tests>.
<On a re-review: verify each earlier finding as resolved, partial, or open. Treat the builder's claims as unverified.>

Evidence (file:line, screenshot, measurement) and a concrete fix for every finding.
Severity: blocker, major (a user or maintainer would notice), minor (worth fixing, not blocking).
PASS = zero blockers and zero majors. At most 3 optional improvements, outside the count.

## Reply
Verdict, counts per severity, one line per blocker or major.
```
