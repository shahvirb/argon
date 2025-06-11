- Health:
    - Uptime Kuma:
        icon: uptime-kuma.png
        href: http://monitor:3001
        widget:
            type: uptimekuma
            url: http://monitor.fdatxvault.win:3001 
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
    - pmx3:
        icon: proxmox.png
        href: https://pmx3:8006
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
        href: http://mkspi:10088
        # widget:
        #     type: moonraker
        #     url: http://mkspi:10088

- Media:
    - Audiobookshelf:
        icon: audiobookshelf.png
        href: http://mediaserver2:13378
        description: My Podcast Server
        widget:
            type: audiobookshelf
            url: http://mediaserver2.fdatxvault.win:13378
            key: op://Dev - Home Lab/audiobookshelf/homepage api key
    - JDownloader2:
        icon: jdownloader2.png
        href: http://mediaserver2:5800
        description: File Downloader
    - Olive Tin:
        icon: olivetin.png
        href: http://mediaserver:1337
        description: Command Runner
    - Plex:
        icon: plex.png
        href: http://mediaserver2:32400
        description: Media Streaming Service
        widget:
            type: plex
            url: http://mediaserver2.fdatxvault.win:32400
            key: op://Dev - Home Lab/Plex/plex token
            # see https://www.plexopedia.com/plex-media-server/general/plex-token/ 
    - Prowlarr:
        icon: prowlarr.png
        href: http://mediaserver2:9696
        description: Torrent Indexer
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
    - qBittorrent:
        icon: qbittorrent.png
        href: http://mediaserver:8080
        description: Torrent Client
        widget:
            type: qbittorrent
            url: http://mediaserver.fdatxvault.win:8080
            username: op://Dev - Home Lab/qbittorrentvpn/username
            password: op://Dev - Home Lab/qbittorrentvpn/password
    - qBittorrent VPN:
        icon: qbittorrent.png
        href: http://mediaserver:8081
        description: Torrent Client with VPN
        widget:
            type: qbittorrent
            url: http://mediaserver.fdatxvault.win:8081
            username: op://Dev - Home Lab/qbittorrentvpn/username
            password: op://Dev - Home Lab/qbittorrentvpn/password

- Monitoring:
    - Glances (helium):
        href: http://helium:61208
        widget:
          type: glances
          url: http://helium.fdatxvault.win:61208
          version: 4 # required only if running glances v4 or higher, defaults to 3
          metric: info
          diskUnits: bytes # optional, bytes (default) or bbytes. Only applies to disk
          refreshInterval: 5000 # optional - in milliseconds, defaults to 1000 or more, depending on the metric
          pointsLimit: 15 # optional, defaults to 15
    - Glances (mediaserver):
        href: http://mediaserver:61208
        widget:
            type: glances
            url: http://mediaserver.fdatxvault.win:61208
            version: 4 # required only if running glances v4 or higher, defaults to 3
            metric: info
            diskUnits: bytes # optional, bytes (default) or bbytes. Only applies to disk
            refreshInterval: 5000 # optional - in milliseconds, defaults to 1000 or more, depending on the metric
            pointsLimit: 15 # optional, defaults to 15
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
    - Grafana:
        icon: grafana.png
        href: http://helium:3000
        description: Analytics & Monitoring
    - InfluxDB:
        icon: influxdb.png
        href: http://helium:8086
        description: Time Series Database
    - NetAlertX:
        icon: netalertx.png
        href: http://argon:20211
        description: Network Device Monitoring
    - Portainer:
        icon: portainer.png
        href: http://monitor:9000
        description: Container Management
    - Prometheus (helium):
        icon: prometheus.png
        href: http://helium:9090
        description: Monitoring System & Time Series Database
    - Prometheus (monitor):
        icon: prometheus.png
        href: http://monitor:9090
        description: Monitoring System & Time Series Database
    - Prometheus Pushgateway (helium):
        icon: prometheus.png
        href: http://helium:9091
        description: Intermediate Service for Prometheus
    - Scrutiny:
        icon: scrutiny.png
        href: http://helium:8100
        description: WebUI for S.M.A.R.T monitoring
    - Smokeping:
        icon: smokeping.png
        href: http://helium:8996
        description: Network Latency Measurements

- Other:
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
        href: http://helium:8000
        description: Document Management
        widget:
            type: paperlessngx
            url: http://helium.fdatxvault.win:8000
            key: op://Dev - Home Lab/Paperless/homepage api key

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