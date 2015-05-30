use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :elixir_training, ElixirTraining.Endpoint,
  http: [port: 4000],
  url: [host: "localhost"],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch"]]

config :elixir_training, ElixirTraining.Router,
  session: [store: :cookie,
            key: "_your_app_key"]
  
# Watch static and templates for browser reloading.
config :elixir_training, ElixirTraining.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :elixir_training, ElixirTraining.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_training_dev",
  hostname: "192.168.59.104"

import_config "dev.secret.exs"
