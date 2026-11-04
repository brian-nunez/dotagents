# APM

[APM](https://github.com/microsoft/apm) (Agent Package Manager) declares the external skills, agent primitives and MCP servers a project depends on. Manifest reference: <https://microsoft.github.io/apm/reference/manifest-schema/>.

## Setup

1.  Confirm the CLI exists: `apm --version`. When missing, report it with the install options from the APM README and continue without APM.
2.  `apm init --yes`, then set `name` in `apm.yml` to the project name.
3.  Add each external dependency Brian names:
    *   Skill or package: `apm install <owner>/<repo>[/<path>][#<ref>]`; one skill from a bundle: `apm install <owner>/<repo> --skill <name>`.
    *   MCP server: `apm install --mcp <server-name> --transport <transport>`.

    Pin a ref (`#v1.2.0`) wherever the source publishes tags.
4.  Read the `.gitignore` entries APM added and keep them. Commit `apm.yml` and `apm.lock.yaml`.

## AGENTS.md ownership

`AGENTS.md` stays hand-written. `apm compile` generates root context files and would overwrite it, so it is not run in these projects. Note this under `## Skills` in `AGENTS.md`.

## Shared skill directory

`apm install` deploys skills into `.agents/skills/`, the same directory as hand-written project skills. Before writing a project skill, check its name against the installed ones to avoid a collision.
