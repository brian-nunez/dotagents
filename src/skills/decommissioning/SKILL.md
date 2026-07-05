---
name: decommissioning
description: Standard operating procedures and rules for decommissioning infrastructure, services, databases, and networks. Trigger for any removal or teardown task.
---
# Decommissioning Standards

## 1. Triggering & Initiation
*   **Approach:** Decommissioning tasks can be initiated via a mix of IaC and manual terminal commands, depending on the environment and urgency.

## 2. Grace Periods (Scream Test)
*   **Policy:** A "scream test" (turning the service off but not destroying it) is required ONLY for critical or heavily used services before final deletion.

## 3. Data & Backups
*   **Data Retention:** Rely on the regular backup schedule. No special final manual snapshot or dump is required before destroying a service.

## 4. DNS & Edge Routing
*   **Process:** Do not delete DNS records immediately. Setup a temporary redirect (HTTP 301/302) or a "Service Offline" page (e.g., via Traefik or Cloudflare) before deleting DNS.

## 5. Service Discovery (Consul)
*   **Removal:** Services must gracefully deregister from Consul via the sidecar/API *before* the application container is stopped.

## 6. VPN & Networking (Tailscale)
*   **Removal:** Manually remove nodes from the Tailscale Admin console only *after* the node is completely offline.

## 7. Compute & Servers
*   **Destruction:** Use `tofu destroy` for VMs/servers and assume all state is cleanly removed by the IaC.

## 8. Secrets & Credentials (Ansible Vault)
*   **Handling:** Do not delete secrets immediately. Leave them in Ansible Vault but move them to a designated "deprecated" section or file.

## 9. Observability (OTel, Prometheus, Grafana)
*   **Cleanup:** Delete all historical dashboards and alerts immediately upon decommissioning. Purge associated logs if the platform allows it.

## 10. Documentation & Code
*   **Repository Cleanup:** Do not delete code/configs. Move the relevant configs and code to an "archive" folder within the repository.
