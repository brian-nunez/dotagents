---
name: infrastructure-and-networking
description: Architectural guidelines and tech stack rules for deploying, managing, and securing servers, networks, and services. Trigger for any sysadmin, DevOps, routing, or IaC task.
---
# Infrastructure & Networking Standards

## 1. Core Philosophy
*   **Self-Documenting Configurations:** Every deployment method must be self-documenting. Docker Compose files, Kubernetes manifests, systemd unit files, and Ansible playbooks ARE the documentation. If a configuration cannot explain itself by reading it, it is wrong.
*   **Self-Hosting Default:** Self-host for control and learning. Use managed cloud services pragmatically when they save significant time or provide capabilities impractical to replicate.
*   **Avoid Hardcoded IPs:** Always lean towards service discovery over hardcoded IPs. Hardcoding is acceptable as a last resort, but dynamic resolution is always preferred.

## 2. Infrastructure as Code
*   **Engine:** Prefer OpenTofu (`tofu`). Standard HashiCorp `terraform` is acceptable but not preferred.
*   **Config Management:** Ansible (push-based only, never pull-based).
*   **Execution Model:** Run playbooks from the laptop for manual operations. GitHub Actions / Gitea Runners for CI/CD-triggered runs. Both must be valid paths.
*   **Inventory:** Currently static (`hosts.ini`). Open to migrating to dynamic inventory (cloud API or Terraform state) when the need arises.

## 3. Compute
*   **Approach:** Hybrid. Private/on-prem compute for internal backends, public cloud instances for the edge.
*   **Cloud Philosophy:** Keep it simple and cheap. Choose providers based on cost-effectiveness.
*   **Containerization:** Docker Compose is required for all projects. Kubernetes only where horizontal scaling genuinely demands it. Bare metal only if Docker is not an option.

## 4. VPN & Mesh Networking
*   **Primary:** Tailscale (always). May consider raw WireGuard in the future, but Tailscale is the current standard.
*   **Topology:** Subnet Router pattern. One dedicated internal router node advertises the private backend subnet to the Tailscale mesh.
*   **Critical Rule:** Do NOT install Tailscale on every individual backend node. Application containers remain completely ignorant of the VPN, retaining standard local IPs with zero encryption overhead.

## 5. Reverse Proxy / Edge Routing
*   **Primary:** Traefik for dynamic L7 edge routing.
*   **Philosophy:** Context-dependent. Use the best tool for the job. Traefik excels at dynamic container routing. NGINX excels at static file serving. Both can coexist (Strangler Fig pattern: Traefik on 80/443, NGINX demoted to a backend port for static fallback).
*   **Caddy:** Rarely used. HAProxy: Open to exploring, but no current experience.

## 6. Service Discovery
*   **Primary:** HashiCorp Consul.
*   **Integration Pattern:** Docker Compose sidecar. A lightweight `hashicorp/consul` client container runs alongside every application in the same `docker-compose.yml`. The sidecar registers the app and passes routing tags (e.g., `traefik.enable=true`) to the central Consul server. No host-level agents. No app-level SDK modifications.

## 7. DNS
*   **Provider:** Cloudflare (always). Managed via OpenTofu.
*   **Internal Access (Split-Horizon DNS):** For internal administrative services, Cloudflare DNS `A` records point directly to non-routable Tailscale CGNAT IPs. Cloudflare proxying MUST be disabled (`proxied = false`) on these records so Tailscale handles the P2P connection directly.

## 8. TLS / Certificates
*   **Current:** Cloudflare Origin Certificates.
*   **Future:** Open to migrating to Let's Encrypt with automatic cert creation (e.g., Traefik ACME with Cloudflare DNS challenge).

## 9. Security

### SSH
*   **Key Strategy:** One SSH key pair per machine. No grouping. Each server gets its own isolated key.
*   **Hardening:** `PasswordAuthentication no` must be strictly enforced in `/etc/ssh/sshd_config` across all infrastructure.

### Secrets Management
*   **Current:** Ansible Vault with `vault_identity_list` (multiple password files) for deployment-time secret injection.
*   **Future:** Open to a runtime secrets solution (e.g., HashiCorp Vault) for applications to pull secrets at runtime. No solution currently in place for this.

### Firewalls
*   No strong preference on tooling (UFW, iptables, Tailscale ACLs, cloud provider firewalls).
*   Current approach: Basic cloud provider firewall rules (HTTP, HTTPS, block SSH from public) on the edge entry point.

## 10. Observability
*   **Hard Requirement:** Full OpenTelemetry support — logs, metrics, AND traces. All three are mandatory.
*   **Pipeline:** OpenTelemetry Collector as the aggregation layer.
*   **Backends:** Context-dependent. Prometheus for metrics, Grafana for dashboards, Loki for logs, Tempo for traces, Jaeger if applicable. The specific backend can vary, but the OTel Collector pipeline is non-negotiable.
*   **Uptime:** Uptime Kuma (or similar) for public-facing health check dashboards. This is separate from the OTel pipeline.

## 11. Backups
*   **Current:** Container/VM snapshots saved to a local hard drive on a schedule.
*   **Future:** Open to hardening this with off-site backups (e.g., Restic/Borg to S3-compatible storage). No strong tool preference yet.

## 12. The Ultimate Goal: Cloud-Agnostic Infrastructure
*   **Vision:** Total infrastructure portability. Destroy the stack, move to any provider, spin it back up by providing raw compute.
*   **Path:** Eliminate hardcoded IPs. OpenTofu provisions raw compute, Ansible dynamic inventory discovers ephemeral IPs. Servers are cattle, not pets.
