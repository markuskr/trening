defmodule ElixirTraining.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_training,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixirTraining, []},
     applications: [:phoenix, :cowboy, :logger,
                    :phoenix_ecto, :phoenix_html, :postgrex, :oauth2]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.2"},
     {:phoenix_ecto, "~> 1.2"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.2.0"},
     {:phoenix_live_reload, "~> 1.0"},
     {:oauth2, "~> 0.3"},
     {:cowboy, "~> 1.0"}]
  end
end
