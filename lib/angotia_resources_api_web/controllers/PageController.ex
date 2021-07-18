defmodule AngotiaResourcesApiWeb.RootController do
  use AngotiaResourcesApiWeb, :controller

  def show(conn, _params) do
    text conn, "API version: #{Application.spec(:angotia_resources_api, :vsn)}, Elixir: #{System.version}"
  end
end