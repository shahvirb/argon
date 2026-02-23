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

1. First, unpack the files using `../../utils/op-unpack.sh`.
2.  Create a `.env` file with the required environment variables (you can use `app.env` as a template).
3.  Run `docker-compose up -d` to start the services in detached mode.

- The Open-WebUI will be available at `http://argon:3001`.
- The LiteLLM API will be available at `http://argon:4000`.