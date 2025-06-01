datasources:
  postgres:
    url: jdbc:postgresql://localhost:5432/kestra
    driverClassName: org.postgresql.Driver
    username: kestra
    password: "op://Dev - Home Lab/Kestra/pgpass"
kestra:
  server:
    basicAuth:
      enabled: false
      username: "shahvirb@gmail.com"
      password: "op://Dev - Home Lab/Kestra/pgpass"
  repository:
    type: postgres
  storage:
    type: local
    local:
      basePath: "/app/storage"
  queue:
    type: postgres
  tasks:
    tmpDir:
      path: /tmp/kestra-wd/tmp
  url: http://localhost:8990/