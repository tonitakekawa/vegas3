# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :vegas3,
  ecto_repos: [Vegas3.Repo]

# Configures the endpoint
config :vegas3, Vegas3Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fOd+cYV/KWdLqFOCi9r7/cOSqtSmvnkStwr40NsgZE5FCiytHg07f8RpnHAhy3V1",
  render_errors: [view: Vegas3Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vegas3.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :plug_session_redis, :config,
  name:  :redis_sessions,
  pool:  [size: 2, max_overflow: 5],
  redis: [host: '192.168.3.5', port: 6379]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# $ mix deps.get --only prod
# $ MIX_ENV=prod mix compile
