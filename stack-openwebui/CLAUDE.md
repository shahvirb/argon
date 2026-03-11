# Open-WebUI Stack

Docker Compose stack for running Open-WebUI with LiteLLM, PostgreSQL, and SearXNG.

## Project Structure

- `docker-compose.yaml` - Main stack definition with 4 services:
  - `db`: PostgreSQL database (port 5432)
  - `litellm`: LLM proxy (port 4000)
  - `open-webui`: Web UI (port 3001)
  - `searxng`: Meta search engine (port 8888)
- `litellm-config.yaml` - LiteLLM configuration
- `app.env.tpl` - Template for environment variables (contains 1Password references)
- `app.env` - Generated environment file (do not commit)
- `searxng/` - SearXNG configuration directory

## Commands

- `docker compose up -d` - Start the stack
- `docker compose up -d --force-recreate` - Recreate containers with new config
- `docker compose down` - Stop the stack
- `docker compose logs -f [service]` - View logs
- `../../utils/op-unpack.sh` - Unpack secrets from 1Password into app.env

## Important Notes

- Before applying changes, always run `../../utils/op-unpack.sh` first, then `docker compose up -d --force-recreate`
- `app.env` contains secrets and should never be committed
- The `.env` file in parent directory links to `../.env`
- Services are available at:
  - Open-WebUI: http://argon:3001
  - LiteLLM: http://argon:4000
  - SearXNG: http://argon:8888
