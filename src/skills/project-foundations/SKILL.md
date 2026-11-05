---
name: project-foundations
description: Interview, then lay or complete the language-agnostic foundations of a repository: AGENTS.md, docs/ with MADR decision records, README, LICENSE, .gitignore, .gitattributes, CODEOWNERS, project skills and optional APM.
disable-model-invocation: true
---
# Project Foundations

Foundations are the files every serious repository carries regardless of language: the agent contract, the decision record, the legal and hygiene files, and the front door. This skill lays them in a new repository and fills the gaps in an existing one. Language templates, build tooling and CI are out of scope; they belong to the project.

Every file written here holds real, project-specific content. A section with nothing true to say is left out, never padded.

## 1. Survey

Inspect the working directory before asking anything:

*   Git state: `git rev-parse --is-inside-work-tree`, current branch, remotes, whether any commits exist.
*   Remote host and visibility: `gh repo view --json nameWithOwner,visibility` when a GitHub remote exists.
*   Stack signals: manifests, lockfiles, source extensions, generated or vendored directories.
*   Each foundation file from the inventory below: **present**, **missing**, or **weak** (present but thin, stale, or contradicted by the code).

Done when every inventory row has a status and every stack signal is listed.

### Inventory

| Item | Reference |
| ---- | --------- |
| Git repository on `main` | step 4 |
| `LICENSE` | [`references/hygiene.md`](references/hygiene.md) |
| `.gitignore` | [`references/hygiene.md`](references/hygiene.md) |
| `.gitattributes` | [`references/hygiene.md`](references/hygiene.md) |
| `.github/CODEOWNERS` | [`references/hygiene.md`](references/hygiene.md) |
| `.dockerignore` (optional) | [`references/hygiene.md`](references/hygiene.md) |
| `AGENTS.md` | [`references/agents-md.md`](references/agents-md.md), [`references/commits.md`](references/commits.md) |
| `docs/` layout and `docs/adr/` | [`references/adr.md`](references/adr.md) |
| `.agents/skills/` | step 5 |
| `apm.yml` | [`references/apm.md`](references/apm.md) |
| `README.md` | the `readme-writing` skill |

## 2. Interview

Ask in one round. For each question the survey already answered, state the detected answer and ask only for confirmation.

1.  **Name and purpose**: project name and a one-sentence statement of what it does and for whom.
2.  **Visibility**: public or private.
3.  **License**: MIT unless Brian names another. Copyright holder defaults to `Brian Nunez`.
4.  **Code owners**: defaults to `@brian-nunez` for `*`; ask for any path-specific owners.
5.  **Stack**: languages, frameworks and generated output, used only for `.gitignore`, `.gitattributes` and `.dockerignore`.
6.  **Docker**: add a `.dockerignore`? Default: yes when a `Dockerfile` or compose file exists, otherwise no.
7.  **APM**: manage external skills and MCP servers with APM (`apm.yml`)? Yes or no.
8.  **Project skills**: recurring project workflows an agent should follow (release, migration, data fix, deploy runbook). Each one named becomes a skill under `.agents/skills/`; none named means no directory.
9.  **Decisions already made**: architectural decisions that are costly to reverse and already settled (datastore, service boundaries, auth model, hosting). Each becomes an ADR.
10. **Extra docs**: `docs/CONTEXT.md` domain glossary, `docs/ROADMAP.md`. Default: neither.

Done when every question has an explicit answer or a confirmed default.

## 3. Propose

Present the change list, one line per file: **create**, **extend** (append missing parts to an existing file, quoting what is added), or **keep**. Existing content is preserved; replacing any existing file needs its own explicit approval. Wait for approval.

## 4. Lay the foundations

Work in this order; later files describe the earlier ones.

1.  **Git**: when no repository exists, `git init -b main`.
2.  **Hygiene files**: `LICENSE`, `.gitignore`, `.gitattributes`, `.github/CODEOWNERS`, and `.dockerignore` when chosen, per [`references/hygiene.md`](references/hygiene.md).
3.  **APM**, when chosen: per [`references/apm.md`](references/apm.md).
4.  **Docs**: `docs/adr/` with the template, the index and one MADR record per decision from the interview, per [`references/adr.md`](references/adr.md). Add `docs/CONTEXT.md` and `docs/ROADMAP.md` only when chosen.
5.  **Project skills**: see step 5.
6.  **`AGENTS.md`**: per [`references/agents-md.md`](references/agents-md.md), with the commit rules from [`references/commits.md`](references/commits.md).
7.  **`README.md`**: invoke the `readme-writing` skill and follow it to completion. It owns the README and `docs/brand/`.

## 5. Project skills

For each workflow named in the interview, write `.agents/skills/<kebab-name>/SKILL.md` following the `writing-for-agents` skill. Gather the real procedure first (scripts, commands, existing runbooks, Brian's description); a skill whose steps are guessed is not written. List each skill in `AGENTS.md`.

## 6. Verify

*   Every approved inventory row exists with project-specific content.
*   No template placeholders or comments remain: `grep -nE '\{|<!--' docs/adr/[0-9]*.md` returns only intentional content.
*   `git check-attr -a -- <a source file> <a binary file>` shows the expected attributes.
*   `git check-ignore -v .env` matches; `git status --short` lists no file that should be ignored.
*   With a `.dockerignore` and a `Dockerfile`: every `COPY` and `ADD` source in the `Dockerfile` is outside the ignore patterns.
*   Every link in `AGENTS.md` and `docs/adr/README.md` resolves to a file.

Done when every check passes, or a failure is reported with its output.

## 7. Report and commit

Report the files created and extended, and the verification results. Then offer one commit following [`references/commits.md`](references/commits.md), showing the full message. Commit only after Brian approves it.
