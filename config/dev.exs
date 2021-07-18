use Mix.Config

config :angotia_resources_api, AngotiaResourcesApiWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"


config :phoenix, :stacktrace_depth, 20

config :angotia_resources_api, AngotiaResourcesApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "test123",
  database: "angotia_resources_api_dev",
  hostname: "localhost",
  pool_size: 10
