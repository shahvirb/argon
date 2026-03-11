{
  "mcpServers": {
    "time": {
      "command": "uvx",
      "args": ["mcp-server-time", "--local-timezone=America/Chicago"],
      "disabledTools": ["convert_time"]
    },
    "joplin": {
      "command": "npx",
      "args": ["joplin-mcp-server"],
      "env": {
        "JOPLIN_SYNC_TARGET": "joplin-server",
        "JOPLIN_SYNC_PATH": "http://localhost:22300",
        "JOPLIN_SYNC_USERNAME": "op://Dev - Home Lab/joplinserver.fdatxvault.win/username",
        "JOPLIN_SYNC_PASSWORD": "op://Dev - Home Lab/joplinserver.fdatxvault.win/password",
        "JOPLIN_TOKEN": "op://Dev - Home Lab/joplinserver.fdatxvault.win/webclipper token",
      }
    }
  }
}
