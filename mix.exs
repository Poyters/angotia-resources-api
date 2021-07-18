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
      {:phoenix, "~> 1.5.7"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_ecto, "~> 4.1"},
      {:postgrex, ">= 0.15.0"},
      {:gettext, "~> 0.18"},
      {:plug_cowboy, "~> 2.3"},
      {:ecto_sql, "~> 3.4.4"},
      {:absinthe, "~> 1.5.1"},
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_phoenix, "~> 2.0"},
      {:absinthe_relay, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:jason, "~> 1.0"},
      {:elixir_uuid, "~> 1.2"},
      {:cors_plug, "~> 1.5"}
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
