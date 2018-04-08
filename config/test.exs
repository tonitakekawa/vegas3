use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :vegas3, Vegas3Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :vegas3, Vegas3.Repo,
adapter: Ecto.Adapters.Postgres,
username: "dev",
password: "secret",
database: "ap_test",
hostname: "192.168.3.6",
pool: Ecto.Adapters.SQL.Sandbox
