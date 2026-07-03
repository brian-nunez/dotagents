---
name: docker-patterns
description: Enforces Brian's Docker and Docker Compose conventions, including image selection, multi-stage builds, health checks, resource limits, and file organization. Trigger for any Docker, Dockerfile, or docker-compose task.
---
# Docker & Docker Compose Patterns

## 1. Core Philosophy
*   **One Compose File Per Project:** Every project gets a single `docker-compose.yml` (or environment-specific variants) that spins up the entire stack locally.
*   **Self-Documenting:** The Compose file IS the documentation. Anyone should be able to read it and understand the full architecture.
*   **Health Checks Are Mandatory:** Every single service MUST have a health check. No exceptions.

## 2. Dockerfile Standards

### Multi-Stage Builds
*   **Always** use multi-stage builds for custom application images.
*   Development stages can use heavier base images for tooling.
*   Production / final stages must use the lightest possible image.

### Base Images
*   **Production:** Always use the smallest viable image (Alpine, slim, distroless).
*   **Development:** Flexibility is fine. Use whatever works for hot-reloading, debugging, etc.

### Image Version Pinning
*   **Always pin to the exact version** (e.g., `node:22.15.0-alpine`, `golang:1.23.1-alpine`).
*   Never use `latest`. Never use major-only tags. Ambiguity in versions is not acceptable.

### Container User
*   **Production:** Always run as a non-root user (`USER appuser` or equivalent).
*   **Development:** Prefer non-root, but root is acceptable if it simplifies the dev workflow.

### Dockerfile Strategy
*   Use official images directly when possible (e.g., `postgres`, `redis`, `consul`).
*   Only write a custom Dockerfile for applications you are building yourself.

## 3. Docker Compose Standards

### Environment Variables
*   Set environment variables explicitly within the `docker-compose.yml` file.
*   `.env` files are acceptable as a secondary option, but explicit inline variables are preferred.

### Volumes
*   **Bind mounts** (`.:/app`) for development when you need live code syncing.
*   **Named volumes** for data persistence (databases, uploads). Acceptable if they are destroyed with the container when persistence is not needed.

### Networking
*   Ephemeral / default bridge networks are fine. No need to define custom named networks unless there is a specific isolation requirement.

### Restart Policy
*   Always use `restart: unless-stopped`.

### Service Dependencies (`depends_on`)
*   Always specify `depends_on` with the correct startup sequence.
*   If the dependency has a health check (and it should — see rule above), always use `condition: service_healthy`.

### Resource Limits
*   Always set `mem_limit` and `cpus` on every service.
*   This serves as a local benchmark: too high means you can reduce; too low and you hit bottlenecks reveals capacity planning data.

### Logging
*   Containers emit plain text logs to stdout/stderr.
*   Let the Docker logging driver or an external OTel collector handle aggregation.

### Labels
*   Include basic metadata labels on custom images:
    - `maintainer` (name + email)
    - `version`
    - `description`
    - `platform`
*   Routing labels (Traefik, Consul) go on the service definition in the Compose file, not baked into the Dockerfile.

### Running Compose
*   Always run detached: `docker compose up -d`.

## 4. Compose File Organization
*   Use separate files per environment:
    - `docker-compose.yml` — Base/shared configuration.
    - `docker-compose.dev.yml` — Development overrides (bind mounts, debug ports, hot-reload).
    - `docker-compose.staging.yml` — Staging-specific config.
    - `docker-compose.prod.yml` — Production hardening (non-root user, resource limits, no bind mounts).
*   Run with: `docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d`.

## 5. Consul Sidecar Pattern
*   When integrating with Consul for service discovery, deploy a lightweight `hashicorp/consul` client container as a sidecar in the same `docker-compose.yml`.
*   The sidecar registers the application and passes routing tags (e.g., `traefik.enable=true`) to the central Consul server.
*   No host-level Consul agents. No application SDK modifications.
