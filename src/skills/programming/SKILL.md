---
name: programming
description: Enforces Brian's tech stack, package managers, and coding standards. Trigger this for any software engineering, web development, or coding task.
---
# Programming & Development Standards

## Languages
*   **Primary:** TypeScript, JavaScript, Go.
*   **Secondary:** Python (scripting & automation only, not web apps).

## JavaScript / TypeScript

### Frameworks
*   **Frontend:** React (via Next.js for full-stack, Vite for client-only). Vanilla JS when a framework is unnecessary.
*   **Backend:** Next.js API Routes / Server Actions for TypeScript backends.

### Package Manager
*   **Always use `npm`.** Never yarn, pnpm, or bun.

### Code Style
*   **Indentation:** 2 spaces.
*   **Quotes:** Single quotes.
*   **Semicolons:** Always.
*   **Linting:** ESLint + Prettier.

### Project Structure (JS/TS)
*   Use a `src/` root directory.
*   Organize by type: `src/components/`, `src/hooks/`, `src/utils/`, `src/lib/`.

## Go

### Philosophy
*   **Standard Library First:** Always prefer Go's standard library. A third-party package requires justification for why `net/http`, `encoding/json`, `os`, `io`, etc. are insufficient. Acceptable exceptions: database drivers, Redis clients, cloud SDKs, LDAP.

### HTTP Framework
*   Default to `net/http`. Use `Echo` only when routing complexity warrants it (e.g., middleware chains, route groups, parameter binding).

### Project Structure (Go Applications)
```
cmd/api/
internal/
  handlers/
  services/
  repository/
```
*   For libraries, prefer a flat or single-layer structure.

### Code Style
*   **Formatting:** `gofmt` / `goimports` (non-negotiable).
*   **Error Handling:** Explicit, using sentinel errors and `errors.Is` / `errors.As`. No panic-driven flows.

## Python

### Usage
*   Python is strictly for scripting and automation. Not for web applications.

### Package Manager
*   Use `uv` for project management. Fallback to `pip` + `venv` for running apps.

## CSS / Styling
*   **Framework:** Tailwind CSS.
*   **Theme:** Light mode by default. Dark mode only when explicitly requested.

## UI/UX Principles
*   **Responsive:** Mobile-first, then scale to desktop.
*   **Design Philosophy:** Functional first, then style. Modern and polished with subtle animations. Never sacrifice usability for aesthetics.

## Databases
*   **SQL:** PostgreSQL (preferred). SQLite for lightweight/embedded use cases.
*   **NoSQL:** MongoDB when document storage is genuinely needed.
*   **Cache/Streams:** Redis for key/value caching and event streams.
*   **ORM:** NEVER use an ORM. Use raw SQL. SQL code generators (e.g., `sqlc` for Go) are acceptable. ORMs like Prisma, TypeORM, Sequelize, and SQLAlchemy are explicitly banned.

## Authentication
*   **Self-Hosted:** Keycloak (OAuth2/OIDC) behind Traefik proxy.
*   **Simple Apps:** Username/email + password with proper hashing (bcrypt/argon2).

## Containerization
*   **Required:** Docker Compose for all projects.
*   **Kubernetes:** Only where horizontal scaling genuinely demands it. Never as a default.
*   **Bare Metal:** Only if Docker is not an option.

## Observability
*   **Standard:** Full OpenTelemetry (metrics, traces, logs).
*   **Format:** Structured logging (JSON).
*   **Pipeline:** OpenTelemetry Collector, pushed to whatever backend the project context dictates.

## Testing
*   **JS/TS:** Vitest for unit + integration. Playwright for E2E.
*   **Timing:** Tests are written AFTER feature completion, not during. Ask the user before writing them.
*   **Enforcement:** Testing is mandatory on all PRs.

## Version Control
*   **Commit Style:** Conventional Commits in the format `<type>(<subject>): <body>` (e.g., `feat(auth): add OAuth2 login flow`).
*   **Branching:** GitHub Flow (feature branches + PRs to main).

## Documentation & Comments
*   **Code:** Self-documenting. Comments explain the WHY for complex sections, never the WHAT.
*   **Docs:** Thorough, explicit, and comprehensive. Documentation is a first-class citizen.
*   **Language:** English only.

## Self-Hosting Philosophy
*   Default to self-hosting for control and learning.
*   Use managed cloud services pragmatically when they save significant time or provide capabilities that are impractical to self-host.

## CI/CD
*   **Platforms:** GitHub Actions and Gitea Actions/Runners.

## Monorepo vs Polyrepo
*   No strong preference. Choose based on project context.
