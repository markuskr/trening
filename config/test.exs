use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_training, ElixirTraining.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_training, ElixirTraining.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixir_training_test",
  hostname: "192.168.59.104", 
  size: 1,
  max_overflow: 0


# Finally import the config/prod.secret.exs
# which should be versioned separately.
import_config "test.secret.exs"
