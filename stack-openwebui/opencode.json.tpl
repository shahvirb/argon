{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "joplin-mcp-server": {
      "type": "local",
      "command": ["npx", "-y", "joplin-mcp-server"],
      "environment": {
        "JOPLIN_SYNC_TARGET": "joplin-server",
        "JOPLIN_SYNC_PATH": "http://joplinserver.fdatxvault.win",
        "JOPLIN_SYNC_USERNAME": "op://Dev - Home Lab/joplinserver.fdatxvault.win/username",
        "JOPLIN_SYNC_PASSWORD": "op://Dev - Home Lab/joplinserver.fdatxvault.win/password",
        "JOPLIN_TOKEN": "op://Dev - Home Lab/joplinserver.fdatxvault.win/webclipper token",
        "JOPLIN_PROFILE": "~/.config/joplin-mcp",
        "LOG_LEVEL": "debug"
      }
    }
  }
}
