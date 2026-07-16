- Health:
    - Uptime Kuma:
        icon: uptime-kuma.png
        href: http://argon:3002
        widget:
            type: uptimekuma
            url: http://argon.fdatxvault.win:3002
            slug: all
    - OpenMediaVault:
        icon: openmediavault.png
        href: http://openmediavault/
        widget:
            type: openmediavault
            url: http://openmediavault.fdatxvault.win/
            username: admin
            password: op://Dev - Home Lab/openmediavault login/password
            method: services.getStatus # required
    - Home Assistant:
        icon: home-assistant.png
        href: http://homeassistant:8123
        custom:
        widget:
            type: homeassistant
            key: op://Dev - Home Lab/Home Assistant/homepage access token
            url: http://homeassistant.fdatxvault.win:8123

- Devices:
    - Router:
        icon: router.png
        href: http://192.168.1.1
    - Unifi Controller:
        icon: unifi.png
        href: https://argon:8443
        description: WiFi Controller
        widget:
            type: unifi
            url: https://argon.fdatxvault.win:8443
            username: op://Dev - Home Lab/ubiquiti unifi argon/username
            password: op://Dev - Home Lab/ubiquiti unifi argon/password
            # site: Site Name # optional
    - 3D Printer:
        icon: mdi-printer-3d-nozzle
        href: http://192.168.1.217:10088
        # widget:
        #     type: moonraker
        #     url: http://192.168.1.217:10088

- Proxmox:
    - pmx3:
        icon: proxmox.png
        href: https://pmx3.fdatxvault.win:8006
        widget:
            type: proxmox
            url: https://pmx3.fdatxvault.win:8006
            username: op://Dev - Home Lab/pmx3/homepage api username
            password: op://Dev - Home Lab/pmx3/homepage api token
    - pmx4:
        icon: proxmox.png
        href: https://pmx4:8006
    - pmx-yoga:
        icon: proxmox.png
        href: https://pmx-yoga:8006
        widget:
            type: proxmox
            url: https://pmx-yoga.fdatxvault.win:8006
            username: op://Dev - Home Lab/pmx-yoga/homepage api username
            password: op://Dev - Home Lab/pmx-yoga/homepage api token
    - pbs-bravo:
        icon: proxmox.png
        href: https://pbs-bravo:8007
        widget:
            type: proxmoxbackupserver
            url: https://pbs-bravo.fdatxvault.win:8007
            username: op://Dev - Home Lab/pbs-bravo/homepage api username
            password: op://Dev - Home Lab/pbs-bravo/homepage api token

- Media:
    - Audiobookshelf:
        icon: audiobookshelf.png
        href: http://mediaserver2:13378
        description: My Podcast Server
        widget:
            type: audiobookshelf
            url: http://mediaserver2.fdatxvault.win:13378
            key: op://Dev - Home Lab/audiobookshelf/homepage api key
    - Frigate:
        icon: frigate.png
        href: https://frigate.fdatxvault.win
        description: NVR
        widget:
            type: frigate
            url: https://frigate.fdatxvault.win
            enableRecentEvents: true # Optional, defaults to false
            username: op://Dev - Home Lab/Frigate mediaserver2/username
            password: op://Dev - Home Lab/Frigate mediaserver2/password
    - Dispatcharr:
        icon: dispatcharr.png
        href: http://mediaserver2:9191
        description: IPTV
    - Teamarr:
        # icon: teamarr.png
        href: http://mediaserver2:9196
        description: Arr for sports
    - JDownloader2:
        icon: jdownloader2.png
        href: http://mediaserver2:5800
        description: File Downloader

- Torrenting:
    - Gluetun:
        icon: gluetun.png
        href: http://mediaserver2:8000
        widget:
            type: gluetun
            url: http://mediaserver2.fdatxvault.win:8000
            key: op://Dev - Home Lab/Gluetun mediaserver2/apikey
    - Prowlarr:
        icon: prowlarr.png
        href: http://mediaserver2:9696
        description: Torrent Indexer
    - qBittorrent:
        icon: qbittorrent.png
        href: http://mediaserver2:8099
        description: Torrent Client with VPN
        widget:
            type: qbittorrent
            url: http://mediaserver2.fdatxvault.win:8099
            username: op://Dev - Home Lab/qbittorrentvpn/username
            password: op://Dev - Home Lab/qbittorrentvpn/password

- Movies and TV Shows:
    - Plex:
        icon: plex.png
        href: http://mediaserver2:32400
        description: Media Streaming Service
        widget:
            type: plex
            url: http://mediaserver2.fdatxvault.win:32400
            key: op://Dev - Home Lab/Plex/plex token
            # see https://www.plexopedia.com/plex-media-server/general/plex-token/ 
    - Radarr:
        icon: radarr.png
        href: http://mediaserver2:7878
        description: Movie Download Manager
        widget:
            type: radarr
            url: http://mediaserver2.fdatxvault.win:7878
            key: op://Dev - Home Lab/Radarr/homepage api key
    - Sonarr:
        icon: sonarr.png
        href: http://mediaserver2:8989
        description: TV Series Manager
        widget:
            type: sonarr
            url: http://mediaserver2.fdatxvault.win:8989
            key: op://Dev - Home Lab/Sonarr/homepage api key
    - Tautulli:
        icon: tautulli.png
        href: http://mediaserver2:8181
        description: Plex monitoring, analytics, and notifications
        widget:
            type: tautulli
            url: http://mediaserver2.fdatxvault.win:8181
            key: op://Dev - Home Lab/Tautulli/homepage api key

- System Monitoring:
    - Glances (mediaserver2):
        href: http://mediaserver2:61208
        widget:
          type: glances
          url: http://mediaserver2.fdatxvault.win:61208
          version: 4 # required only if running glances v4 or higher, defaults to 3
          metric: info
          diskUnits: bytes # optional, bytes (default) or bbytes. Only applies to disk
          refreshInterval: 5000 # optional - in milliseconds, defaults to 1000 or more, depending on the metric
          pointsLimit: 15 # optional, defaults to 15

- Infrastructure Monitoring:
    - Komodo:
        icon: komodo.png
        href: http://argon:9120/
        description: Container Management Platform
    - NetAlertX:
        icon: netalertx.png
        href: http://argon:20211
        description: Network Device Monitoring
    - Scrutiny:
        icon: scrutiny.png
        href: http://argon:8100
        description: WebUI for S.M.A.R.T monitoring

- Other:
    - AdGuard Home:
        icon: adguard-home.png
        href: http://192.168.1.1:3000
    - Change Detection:
        icon: changedetection.png
        href: http://argon:5000
        description: Website Change Detection
    - Cronicle:
        icon: cronicle.png
        href: http://mediaserver2:3012
    - Forgejo:
        icon: forgejo.png
        href: http://argon:3000
    - Paperless:
        icon: paperless.png
        href: http://argon:8000
        description: Document Management
        widget:
            type: paperlessngx
            url: http://argon:8000
            key: op://Dev - Home Lab/Paperless/homepage api key
    - Restic Explorer:
        icon: restic.png
        href: http://argon:8822

- Web:
    - Audiobookshelf:
        icon: audiobookshelf.png
        href: http://audio.fdatxvault.win
        description: Podcast Server
    - Authentik:
        icon: authentik.png
        href: http://authentik.fdatxvault.win
    - Bitwarden:
        icon: bitwarden.png
        href: https://fdatxvault.win
        description: Password Manager
    - Immich:
        icon: immich.png
        href: https://photos.fdatxvault.win
    - Joplin Server:
        icon: joplin.png
        href: https://joplinserver.fdatxvault.win
        description: Notes
    - Kasm Workspaces:
        icon: kasm.png
        href: https://kw.fdatxvault.win
    - OpenProject:
        icon: openproject.png
        href: https://openproject.fdatxvault.win
    - Tandoor Recipes:
        icon: tandoor-recipes.png
        href: https://recipes.fdatxvault.win
    - Vikunja:
        icon: vikunja.png
        href: https://vikunja.fdatxvault.win
        description: To-do

- AI:
    - Open Web UI:
        icon: openai.png
        href: http://argon:3001
        description: ChatGPT UI with Ollama
    - LiteLLM:
        icon: mdi-brain
        href: http://argon:4000
        description: LLM Gateway
    - Codenomad (argon):
        icon: mdi-robot
        href: https://argon:9898
    - Codenomad (mediaserver2):
        icon: mdi-robot
        href: https://mediaserver2:9898
    - OpenCode Zen:
        icon: mdi-meditation
        href: http://opencode.ai/zen