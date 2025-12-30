# https://github.com/AnalogJ/scrutiny/blob/master/example.scrutiny.yaml

version: 1

web:
  listen:
    port: 8080
    host: 0.0.0.0

    # if you're using a reverse proxy like apache/nginx, you can override this value to serve scrutiny on a subpath.
    # eg. http://example.com/scrutiny/* vs http://example.com:8080
    # see docs/TROUBLESHOOTING_REVERSE_PROXY.md
    # basepath: `/scrutiny`
    # leave empty unless behind a path prefixed proxy
    basepath: ''
  database:
    # can also set absolute path here
    location: /opt/scrutiny/config/scrutiny.db
  src:
    # the location on the filesystem where scrutiny javascript + css is located
    frontend:
      path: /opt/scrutiny/web

  # if you're running influxdb on a different host (or using a cloud-provider) you'll need to update the host & port below.
  # token, org, bucket are unnecessary for a new InfluxDB installation, as Scrutiny will automatically run the InfluxDB setup,
  # and store the information in the config file. If you 're re-using an existing influxdb installation, you'll need to provide
  # the `token`
  influxdb:
#    scheme: 'http'
    host: scrutiny-influxdb
    port: 8086
#    token: 'my-token'
#    org: 'my-org'
#    bucket: 'bucket'
    retention_policy: true
    # if you wish to disable TLS certificate verification,
    # when using self-signed certificates for example,
    # then uncomment the lines below and set `insecure_skip_verify: true`
    # tls:
    #   insecure_skip_verify: false

log:
  file: '' #absolute or relative paths allowed, eg. web.log
  level: INFO

notify:
  urls:
    - "op://Dev - Home Lab/Scrutiny/discord notify URL"