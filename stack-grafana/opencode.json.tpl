{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "grafana": {
      "type": "local",
      "command": ["uvx", "mcp-grafana"],
      "enabled": true,
      "environment": {
        "GRAFANA_URL": "http://localhost:3000",
        "GRAFANA_SERVICE_ACCOUNT_TOKEN": "op://Dev - Home Lab/grafana argon/mcp token"
      }
    }
  }
}
