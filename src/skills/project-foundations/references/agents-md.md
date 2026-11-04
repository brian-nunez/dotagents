# Project AGENTS.md

`AGENTS.md` at the repository root is the project's contract with every coding agent. Brian's universal guidelines are loaded globally; the project file holds only what is specific to this repository.

## Content rule

Cache only what an agent cannot find quickly by looking: unwritten conventions, the reason behind a choice, gotchas, boundaries. Point at the source of truth (a `Makefile` target, `package.json` scripts, a config file) instead of restating it. Every line must change agent behavior in this repository.

## Sections

Include a section only when the project gives it real content. Order:

1.  **`# <Project name>`** and one paragraph: what the project is, who uses it, and its current stage.
2.  **`## Layout`**: the top-level directories and what belongs in each, as a short list. Non-obvious placement rules go here (where new handlers go, what must stay dependency-free).
3.  **`## Commands`**: the commands to build, test, lint, format and run, each as the exact command. When a task runner exists, name its targets rather than the underlying commands.
4.  **`## Conventions`**: project-specific rules that differ from or add to the global guidelines and the `programming` skill.
5.  **`## Commits`**: the block from [`commits.md`](commits.md), with the project's real scopes.
6.  **`## Decisions`**: one line pointing at `docs/adr/` and the rule: decisions costly to reverse get a MADR record before implementation, per `docs/adr/README.md`.
7.  **`## Skills`**: one line per project skill in `.agents/skills/`: the skill name and the condition for using it. With APM, one line saying external skills and MCP servers are declared in `apm.yml` and installed with `apm install`.
8.  **`## Boundaries`**: files and areas agents must not edit (generated code, vendored code, migrations already applied), and actions that need Brian's approval in this project beyond the global set.

## Extending an existing AGENTS.md

Keep its content. Add missing sections in the order above, correct statements the survey proved wrong, and report each correction in the change list.
