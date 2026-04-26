# To see all available options, please visit the docs:
# https://docs.pangolin.net/

gerbil:
    start_port: 51820
    base_endpoint: "fdatxvault.win"

app:
    dashboard_url: "http://argon:3003"
    log_level: "info"
    telemetry:
        anonymous_usage: true

domains:
    domain1:
        base_domain: "fdatxvault.win"
        cert_resolver: "letsencrypt"

server:
    secret: "op://Dev - Home Lab/pangolin argon/secret"
    cors:
        origins: ["http://argon:3003", "https://fdatxvault.win"]
        methods: ["GET", "POST", "PUT", "DELETE", "PATCH"]
        allowed_headers: ["X-CSRF-Token", "Content-Type"]
        credentials: false

flags:
    require_email_verification: false
    disable_signup_without_invite: true
    disable_user_create_org: false
    allow_raw_resources: true