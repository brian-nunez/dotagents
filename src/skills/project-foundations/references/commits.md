# Commit Conventions

Copy the block below into the project's `AGENTS.md` under `## Commits`, replacing the example scopes with the project's real areas.

---

Every commit follows [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).

```text
<type>(<scope>): <summary>

<body>

<footers>
```

*   **Type**: `feat` (new behavior), `fix` (corrected behavior), `docs`, `refactor` (no behavior change), `perf`, `test`, `build`, `ci`, `style` (formatting only), `chore`, `revert`.
*   **Scope**: the area changed, from this project's areas: `<scope-a>`, `<scope-b>`. Omit it only when the change spans the whole repository.
*   **Summary**: imperative mood, lowercase, no trailing period, 72 characters or fewer. It names the change in behavior: `fix(auth): reject expired refresh tokens`, not `fix(auth): update token.go`.
*   **Body**: required unless the summary alone tells a reviewer everything. Wrap at 72 columns. State:
    *   **Why**: the problem, bug or need that prompted the change.
    *   **What**: the approach, and what now behaves differently.
    *   **Impact**: anything a reader must know: migrations, config changes, follow-ups, trade-offs taken.

    Every sentence carries information a reviewer cannot get from the diff. A body with nothing to add is left out.
*   **Footers**: `BREAKING CHANGE: <what breaks and how to migrate>` for incompatible changes (and `!` after the type or scope); `Refs: #<issue>` or `Closes: #<issue>` for tracked work.
*   One logical change per commit.

Example:

```text
fix(auth): reject expired refresh tokens

Refresh tokens were validated by signature only, so a token past its
expiry still minted new access tokens until the signing key rotated.

Validation now checks the exp claim and returns 401 with
error=token_expired. Clients already handle 401 by sending the user to
sign in, so no client change is needed.

Closes: #142
```
