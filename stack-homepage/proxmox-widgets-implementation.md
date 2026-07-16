# Proxmox Widgets Implementation Plan

## Overview

Add homepage widgets for 4 Proxmox entries in the `Proxmox` service group to display live stats (VMs, LXCs, CPU, memory, datastore usage, etc.).

## Current State

The `Proxmox` group in `services.yaml.tpl` has 4 entries with only `icon` + `href`:

| Entry | Type | URL |
|---|---|---|
| pmx3 | Proxmox VE | `https://pmx3:8006` |
| pmx4 | Proxmox VE | `https://pmx4:8006` |
| Proxmox Backup Server | Proxmox Backup Server | `https://proxmox-backup-server:8007/` |
| pbs-bravo | Proxmox Backup Server | `https://pbs-bravo:8007` |

## Target State

Each entry gets a widget block with 1Password-backed API credentials.

---

## Sequence

### Step 1 — Human: Create API Tokens in Proxmox

For each of the 4 Proxmox instances, create an API token. The token format is `username@pam!token_id`. Store the **token ID** and **secret** in 1Password.

#### pmx3 (Proxmox VE)
1. Navigate to `https://pmx3:8006` → Datacenter
2. Permissions → API Tokens → Add
   - User: select an existing user (or create `api` user with `PVEAuditor` group)
   - Token ID: `homepage`
   - Privilege Separation: Checked
3. Copy the Token ID (e.g. `api@pam!homepage`) and Secret
4. Save in 1Password:
   ```
   op://Dev - Home Lab/pmx3/homepage api token id      = api@pam!homepage
   op://Dev - Home Lab/pmx3/homepage api token secret   = <the-secret>
   ```

#### pmx4 (Proxmox VE)
Same procedure as pmx3, but at `https://pmx4:8006`.
```
op://Dev - Home Lab/pmx4/homepage api token id
op://Dev - Home Lab/pmx4/homepage api token secret
```

#### Proxmox Backup Server (original)
1. Navigate to `https://proxmox-backup-server:8007`
2. Create user + API token with **Audit** role (required for PBS, not PVE Auditor)
3. Save in 1Password:
```
op://Dev - Home Lab/Proxmox Backup Server/homepage api token id
op://Dev - Home Lab/Proxmox Backup Server/homepage api token secret
```

#### pbs-bravo
Same PBS procedure at `https://pbs-bravo:8007`.
```
op://Dev - Home Lab/pbs-bravo/homepage api token id
op://Dev - Home Lab/pbs-bravo/homepage api token secret
```

---

### Step 2 — LLM: Update services.yaml.tpl

File: `/home/shahvirb/gitsource/argon/stack-homepage/homepage/services.yaml.tpl`

Replace the entire `Proxmox` group block with the widget-enabled version below.

**Current block** (lines ~48-60):
```yaml
- Proxmox:
    - pmx3:
        icon: proxmox.png
        href: https://pmx3:8006
    - pmx4:
        icon: proxmox.png
        href: https://pmx4:8006
    - Proxmox Backup Server:
        icon: proxmox.png
        href: https://proxmox-backup-server:8007/
    - pbs-bravo:
        icon: proxmox.png
        href: https://pbs-bravo:8007
```

**Replace with:**
```yaml
- Proxmox:
    - pmx3:
        icon: proxmox.png
        href: https://pmx3:8006
        widget:
          type: proxmox
          url: https://pmx3:8006
          username: op://Dev - Home Lab/pmx3/homepage api token id
          password: op://Dev - Home Lab/pmx3/homepage api token secret
    - pmx4:
        icon: proxmox.png
        href: https://pmx4:8006
        widget:
          type: proxmox
          url: https://pmx4:8006
          username: op://Dev - Home Lab/pmx4/homepage api token id
          password: op://Dev - Home Lab/pmx4/homepage api token secret
    - Proxmox Backup Server:
        icon: proxmox.png
        href: https://proxmox-backup-server:8007/
        widget:
          type: proxmoxbackupserver
          url: https://proxmox-backup-server:8007
          username: op://Dev - Home Lab/Proxmox Backup Server/homepage api token id
          password: op://Dev - Home Lab/Proxmox Backup Server/homepage api token secret
    - pbs-bravo:
        icon: proxmox.png
        href: https://pbs-bravo:8007
        widget:
          type: proxmoxbackupserver
          url: https://pbs-bravo:8007
          username: op://Dev - Home Lab/pbs-bravo/homepage api token id
          password: op://Dev - Home Lab/pbs-bravo/homepage api token secret
```

### Step 3 — LLM: Run op-unpack.sh

```bash
/home/shahvirb/gitsource/utils/op-unpack.sh
```
Working directory: `/home/shahvirb/gitsource/argon/stack-homepage`

This runs `op inject` to substitute the 1Password references in `services.yaml.tpl` with real secrets, producing `homepage/services.yaml`.

**Prerequisite:** `op signin` must be active.

### Step 4 — LLM: Restart the homepage container

```bash
docker-compose restart
```
Working directory: `/home/shahvirb/gitsource/argon/stack-homepage`

(Or just wait — homepage auto-detects config changes, but a restart may be needed for the proxmox widget connections to take effect reliably.)

### Step 5 — Human: Verify

1. Open the homepage dashboard
2. Check the `Proxmox` column on the Default tab
3. Each of the 4 entries should now show live stats:
   - pmx3 / pmx4: VM count, LXC count, CPU %, memory %
   - Proxmox Backup Server / pbs-bravo: datastore usage, failed tasks, CPU %, memory %

---

## Files Modified

| File | Change |
|---|---|
| `homepage/services.yaml.tpl` | Add widget blocks to all 4 Proxmox entries |
| `homepage/services.yaml` | Regenerated by `op-unpack.sh` (not committed) |

## Files NOT Modified

| File | Reason |
|---|---|
| `homepage/settings.yaml` | Layout unchanged — Proxmox already on Default tab |
| `homepage/proxmox.yaml` | Not needed — Proxmox VE widgets use inline config, not `proxmox.yaml` connections |
| `homepage/widgets.yaml` | Not needed — these are service-level widgets |

## Rollback

To revert, simply remove the `widget:` blocks from each entry in `services.yaml.tpl` and re-run `op-unpack.sh`.

## Widget Field Reference

### Proxmox VE (`type: proxmox`)
| Field | Required | Description |
|---|---|---|
| `url` | Yes | Base URL of Proxmox VE (port 8006) |
| `username` | Yes | API token ID (`user@pam!token_id`) |
| `password` | Yes | API token secret |
| `node` | No | Specific node name; omit for cluster-wide stats |

Shows: `vms`, `lxc`, `resources.cpu`, `resources.mem`

### Proxmox Backup Server (`type: proxmoxbackupserver`)
| Field | Required | Description |
|---|---|---|
| `url` | Yes | Base URL of PBS (port 8007) |
| `username` | Yes | API token ID (`user@pbs!token_id`) |
| `password` | Yes | API token secret |
| `datastore` | No | Specific datastore name; omit for all datastores combined |

Shows: `datastore_usage`, `failed_tasks_24h`, `cpu_usage`, `memory_usage`
