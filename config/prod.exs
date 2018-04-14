use Mix.Config

config :vegas3, Vegas3Web.Endpoint,
  load_from_system_env: true,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :exredis,
  host:      "localhost",
  port:      6379,
  password:  "",
  db:        0,
  reconnect: :no_reconnect,
  max_queue: :infinity

config :plug_session_redis, :config,
  name:  :redis_sessions,
  pool:  [size: 2, max_overflow: 5],
  redis: [host: 'localhost', port: 6379]

import_config "prod.secret.exs"
