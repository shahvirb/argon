# MCPO + Joplin MCP Server Integration Plan

## Overview
Add MCPO (MCP-to-OpenAPI proxy) with Joplin MCP Server to the Open-WebUI stack, enabling Open-WebUI to interact with Joplin notes via OpenAPI.

## Architecture

```
┌─────────────────┐      ┌──────────────────┐      ┌───────────────────┐      ┌─────────────────┐
│   Open-WebUI    │◄────►│       MCPO       │◄────►│  joplin-mcp-srv   │◄────►│  joplin-server  │
│   (port 3001)   │      │   (port 8001)    │      │   (port 3000)     │      │  (port 22300)   │
└─────────────────┘      └──────────────────┘      └───────────────────┘      └─────────────────┘
      OpenAPI                   MCP HTTP               MCP stdio/HTTP              Sync Target
```

**Flow:**
- Open-WebUI calls MCPO at `http://argon:8001/joplin` (OpenAPI)
- MCPO proxies to joplin-mcp-server at `http://joplin-mcp-server:3000/mcp` (MCP HTTP)
- joplin-mcp-server syncs with existing joplin-server at `http://joplin-server:22300`

## Port Selection

**MCPO Port:** `8001` (internal 8000, external 8001)
- Port 8000 is taken by paperless-webserver
- Port 8001 is available

## Files to Create

### 1. `joplin-mcp/Dockerfile`
Custom Node.js image with joplin-mcp-server pre-installed, configured for HTTP transport.

### 2. `mcpo-config.json`
MCPO configuration file in Claude Desktop format, defining the joplin MCP server endpoint.

## Files to Modify

### 1. `docker-compose.yaml`
Add two new services:
- **mcpo**: OpenAPI proxy server (ghcr.io/open-webui/mcpo:main)
- **joplin-mcp-server**: Custom build, runs joplin-mcp-server in HTTP mode

### 2. `app.env.tpl`
Add three new 1Password references:
- `JOPLIN_TOKEN`: Web Clipper API token
- `JOPLIN_SYNC_USERNAME`: joplin-server login email
- `JOPLIN_SYNC_PASSWORD`: joplin-server password

## 1Password Setup Required

Create or verify these vault items exist:

### Item: "joplin mcp" (in "Dev - Home Lab" vault)
- **token**: Joplin Web Clipper API token
  - Generate in any Joplin app: Tools > Options > Web Clipper > Show Advanced Settings > Copy token

### Item: "joplin server" (in "Dev - Home Lab" vault)
- **username**: Your joplin-server login email
- **password**: Your joplin-server password

## Implementation Steps

1. **Create directory and files:**
   ```bash
   mkdir -p joplin-mcp
   # Create Dockerfile
   # Create mcpo-config.json
   ```

2. **Modify docker-compose.yaml:**
   - Add mcpo service (port 8001:8000)
   - Add joplin-mcp-server service (build from ./joplin-mcp)
   - Link services with depends_on

3. **Update app.env.tpl:**
   - Add JOPLIN_TOKEN reference
   - Add JOPLIN_SYNC_USERNAME reference
   - Add JOPLIN_SYNC_PASSWORD reference

4. **Generate environment file:**
   ```bash
   ../../utils/op-unpack.sh
   ```

5. **Build and deploy:**
   ```bash
   docker compose up -d --build
   ```

6. **Verify:**
   - Check MCPO docs: `http://argon:8001/docs`
   - Check joplin tools endpoint: `http://argon:8001/joplin`
   - Integrate with Open-WebUI

## Post-Deployment

### Integrate with Open-WebUI
1. Go to Open-WebUI Admin Panel > Tools > OpenAPI Servers
2. Add server URL: `http://argon:8001/joplin`
3. No API key required initially (MCPO_API_KEY can be added later)

### Available Joplin Tools (via MCPO/OpenAPI)
- `list_notebooks` - Retrieve complete notebook hierarchy
- `search_notes` - Search notes by query
- `read_notebook` - Read notebook contents
- `read_note` - Read full note content
- `read_multinote` - Read multiple notes
- `create_note` - Create new note
- `create_folder` - Create new notebook
- `edit_note` - Edit existing note
- `edit_folder` - Edit notebook
- `delete_note` - Delete note
- `delete_folder` - Delete notebook
- `sync` - Trigger sync (auto-syncs every 5 min)

### Security (Future)
When ready to add API key authentication:
1. Uncomment `MCPO_API_KEY` in app.env.tpl
2. Add to 1Password vault
3. Regenerate app.env
4. Restart MCPO service

## Troubleshooting

- If MCP HTTP doesn't work, switch mcpo-config.json to use `sse` type with `/sse` endpoint
- Check joplin-mcp-server logs for sync issues: `docker compose logs -f joplin-mcp-server`
- Verify joplin-server is accessible from the stack network
- Ensure Joplin token is valid and not expired

## Notes

- MCPO uses config file approach (not command line args) to support hot-reload capability
- joplin-mcp-server data persists in `${DOCKERDATADIR}/joplin-mcp`
- Sync happens automatically every 5 minutes, or manually via `sync` tool
- The sidecar runs independently but syncs to the same joplin-server backend
