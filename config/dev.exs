use Mix.Config

config :vegas3, Vegas3Web.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../assets", __DIR__)]]

config :vegas3, Vegas3Web.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/vegas3_web/views/.*(ex)$},
      ~r{lib/vegas3_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :vegas3, Vegas3.Repo,
adapter: Ecto.Adapters.Postgres,
username: "dev",
password: "secret",
database: "ap_test",
hostname: "192.168.3.6",
pool_size: 10

config :exredis,
  host:      "192.168.3.5",
  port:      6379,
  password:  "",
  db:        0,
  reconnect: :no_reconnect,
  max_queue: :infinity

config :plug_session_redis, :config,
  name:  :redis_sessions,
  pool:  [size: 2, max_overflow: 5],
  redis: [host: '192.168.3.5', port: 6379]
