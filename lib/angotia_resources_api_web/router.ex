defmodule AngotiaResourcesApiWeb.Router do
  use AngotiaResourcesApiWeb, :router
  alias AngotiaResourcesApiWeb.RootController

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AngotiaResourcesApiWeb.Schema,
      interface: :simple,
      context: %{pubsub: AngotiaResourcesApiWeb.Endpoint}

    get "/", RootController, :show
  end

end