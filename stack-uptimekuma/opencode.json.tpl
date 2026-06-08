{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "uptime-kuma": {
      "type": "local",
      "command": ["npx", "-y", "@davidfuchs/mcp-uptime-kuma"],
      "enabled": true,
      "environment": {
        "UPTIME_KUMA_URL": "http://localhost:3002",
        "UPTIME_KUMA_USERNAME": "op://Dev - Home Lab/uptime kuma/username",
        "UPTIME_KUMA_PASSWORD": "op://Dev - Home Lab/uptime kuma/password"
      }
    }
  }
}
