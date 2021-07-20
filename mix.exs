defmodule AngotiaResourcesApi.Mixfile do
  use Mix.Project

  def project do
    [
      app: :angotia_resources_api,
      version: "1.0.0",
      elixir: "~> 1.12.0",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {AngotiaResourcesApi.Application, []},
      extra_applications: [:logger, :runtime_tools, :elixir_uuid]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.9"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_ecto, "~> 4.3"},
      {:postgrex, ">= 0.15.9"},
      {:gettext, "~> 0.18"},
      {:plug_cowboy, "~> 2.5"},
      {:ecto_sql, "~> 3.6.2"},
      {:absinthe, "~> 1.6.4"},
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_phoenix, "~> 2.0"},
      {:absinthe_relay, "~> 1.5"},
      {:poison, "~> 4.0"},
      {:jason, "~> 1.2"},
      {:elixir_uuid, "~> 1.2"},
      {:cors_plug, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
