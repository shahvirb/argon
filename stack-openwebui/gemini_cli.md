# Gemini CLI Documentation

This project sets up a local environment for running Open-WebUI with LiteLLM, using a PostgreSQL database. The entire stack is managed by Docker Compose.

## Project Structure

- `docker-compose.yaml`: Defines the services for the application stack.
  - `db`: A PostgreSQL database for storing data.
  - `litellm`: A proxy for Large Language Models (LLMs), configured to use a Gemini model.
  - `open-webui`: A web interface for interacting with LLMs.
- `litellm-config.yaml`: Configuration file for LiteLLM.
- `app.env`: An environment file to store secrets and other configuration variables for the services.

## How to run

If the user asks you to apply changes you will first need to `../../utils/op-unpack.sh`, then run `docker compose up -d --force-recreate`.

- The Open-WebUI will be available at `http://argon:3001`.
- The LiteLLM API will be available at `http://argon:4000`.