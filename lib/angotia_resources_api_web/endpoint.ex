defmodule AngotiaResourcesApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :angotia_resources_api

  socket "/socket", AngotiaResourcesApiWeb.UserSocket

  plug Plug.Static,
    at: "/", from: :angotia_resources_api, gzip: false

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_angotia_resources_api_key",
    signing_salt: "UUzpRLZt"

  plug AngotiaResourcesApiWeb.Router

  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
