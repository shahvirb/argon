# This is a litellm configuration file (litellm-config.yaml) with a .tpl extension
# It contains API keys and sensitive credentials managed through 1Password CLI
# 
# Usage:
#   - Ensure 1Password CLI is installed and authenticated
#   - LiteLLM will resolve 1Password secret references at runtime
#   - Keep this file in a secure location and never commit secrets to version control

general_settings:
  database_url: "postgresql://llmproxy:op://Dev - Home Lab/openwebui argon/postgres@db:5432/litellm"

model_list:
  - model_name: gemini-2.5-flash-lite
    litellm_params:
      model: gemini/gemini-2.5-flash-lite
      api_key: op://Dev - Home Lab/openwebui argon/gemini API key
  - model_name: gemini-2.5-flash
    litellm_params:
      model: gemini/gemini-2.5-flash
      api_key: op://Dev - Home Lab/openwebui argon/gemini API key
  - model_name: gemini-2.5-pro
    litellm_params:
      model: gemini/gemini-2.5-pro
      api_key: op://Dev - Home Lab/openwebui argon/gemini API key
  - model_name: gemini-3-pro-preview
    litellm_params:
      model: gemini/gemini-3-pro-preview
      api_key: op://Dev - Home Lab/openwebui argon/gemini API key
