# Task skills

Brian's proven skills for recurring kinds of work. Reach for the matching skill before you brief from scratch. Every skill lives at `~/.agents/skills/<name>/SKILL.md` once `install.sh` has run. Give subagents that absolute path, since other providers may not auto-load them.

Two skills are manual (`disable-model-invocation: true`), so the harness will not surface them. Load them by reading their `SKILL.md` directly.

| Skill | Use for | Who runs it |
| --- | --- | --- |
| `go-library-dx` | Designing or reviewing a Go library's public API by its call sites | **Operator only.** API shape is judgement work that stays with you |
| `messaging-architecture` (manual) | Shaping the full message of an idea or an entire project before slides, docs, or a talk | **Operator only.** It interviews Brian and sets the narrative |
| `project-foundations` (manual) | A repository's small details: AGENTS.md, ADRs, LICENSE, ignore files, CODEOWNERS, README | Operator or subagent |
| `readme-writing` | A README in Brian's house style, rendered and checked visually | Operator or subagent |
| `state-machine-analysis` | Rare, deep work: documenting explicit and implicit state machines in Go systems | Operator or subagent |
| `ux-design` then `ui-design` | `ux-design` creates the UX design in Figcraft files. `ui-design` turns it into the implemented visual design | Operator or subagent, in that order |

## Running a skill through a subagent

- Name the skill's absolute path in the brief's Inputs, and say which steps to run.
- Interview and confirmation gates count as satisfied by the brief. Supply the answers the skill would ask Brian for, taken from your brief-back with him.
- Put the skill's artifacts in the handoff directory unless the skill's output belongs in the repo.
