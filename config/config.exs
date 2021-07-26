# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :event_lens,
  ecto_repos: [EventLens.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :event_lens, EventLensWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Cdyp6WH7L2/yJ3TMu8dVkzythMFN8IOo3WFhDZizkqXOac9eE1UtKIXWTbMQFpxB",
  render_errors: [view: EventLensWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: EventLens.PubSub,
  live_view: [signing_salt: "1ZYz4VPZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
