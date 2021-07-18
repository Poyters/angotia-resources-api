# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :angotia_resources_api,
  ecto_repos: [AngotiaResourcesApi.Repo]

# Configures the endpoint
config :angotia_resources_api, AngotiaResourcesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mxpWzMMPutAKZl3GUD47Qu4CCXtACfaw2OVvsWL0Y+UMQH8QIE42CCLVoTEehVaj",
  render_errors: [view: AngotiaResourcesApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: AngotiaResourcesApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures JSON library
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
