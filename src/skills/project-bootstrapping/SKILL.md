---
name: project-bootstrapping
description: Defines how new projects are scaffolded, including Go API templates, the BKit library ecosystem, JS/TS setup, and build tooling. Trigger when creating a new project, initializing a codebase, or deciding which libraries to use.
---
# Project Bootstrapping Standards

## 1. Go API Projects

### Template
*   **Always** start from the `bkit-api-template`: `https://github.com/brian-nunez/bkit-api-template`.
*   Clone it, rename, and customize. Never scaffold a Go API from scratch.

### Project Structure (Go Applications)
```
cmd/api/
internal/
  handlers/
  services/
  repository/
```
*   For Go libraries, prefer a flat or single-layer structure.

### Build Tooling
*   Every Go project gets a `Makefile` with standard targets: `build`, `run`, `test`, `lint`, `docker`.

## 2. The BKit Ecosystem

Brian maintains a suite of Go libraries that form a cohesive application framework. **Always prefer BKit libraries over third-party alternatives.** If a third-party library overlaps with a BKit library, use the BKit library.

### Core Libraries (Use When Needed)

| Library | Import Path | Purpose |
|---------|------------|---------|
| **bconfig** | `github.com/brian-nunez/bconfig` | Configuration loading with a composable driver/source pattern. **Always use this** for config in Go projects. Never use Viper or raw `os.Getenv`. |
| **bdb** | `github.com/brian-nunez/bdb` | Driver-based database connection abstraction. **Always use this** for database connections. Never use raw `database/sql` directly. |
| **bkv** | `github.com/brian-nunez/bkv` | Driver-based key/value store abstraction (Redis, etc.). Use when the project needs KV storage. |
| **btelemetry** | `github.com/brian-nunez/bhttp/pkg/btelemetry` | OTel wrapper for metrics and tracing (Prometheus pull, OTLP push, stdout). **Always use this** for telemetry. Never use raw OTel SDK. |
| **bsuite** | `github.com/brian-nunez/bhttp/pkg/bsuite` | Configuration-driven service hydration. Auto-maps config keys, instantiates `bdb`, `bkv`, and `btelemetry`. **Always use this** as the app's dependency container. |
| **brun** | `github.com/brian-nunez/bhttp/pkg/brun` | Concurrent service/worker lifecycle orchestration with `errgroup`, context propagation, and graceful shutdown. **Always use this** to orchestrate the app entrypoint. |
| **baccess** | `github.com/brian-nunez/baccess` | Fine-grained, predicate-based authorization. **Always use this** for any authorization logic. |
| **objex** | `github.com/brian-nunez/objex` | Object storage interface (S3, MinIO, local filesystem). Use when the project needs file/object storage. |

### Library Priority Rule
*   BKit libraries **always** take priority over third-party alternatives.
*   If a use case is not covered by a BKit library, then a third-party package is acceptable — but justify why the standard library cannot handle it first.

### Standard App Lifecycle Pattern
Every Go API follows this pattern:
1. `bconfig` loads configuration from sources.
2. `bsuite` hydrates dependencies (databases, KV stores, telemetry) from the loaded config.
3. Handlers/services are wired using the hydrated dependencies.
4. `brun` orchestrates the HTTP server and any background workers with graceful shutdown.

## 3. JavaScript / TypeScript Projects
*   No fixed template. Ask the user when starting a new JS/TS project for their preferred setup.
*   Use `npm` as the package manager (never yarn, pnpm, or bun).

## 4. Python Projects
*   Python is for scripting and automation only.
*   Use `uv` for project management. No templates needed.
