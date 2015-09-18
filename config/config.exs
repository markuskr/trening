# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_training, ElixirTraining.Endpoint,
  url: [host: "localhost"],
  root: Path.expand("..", __DIR__),
  secret_key_base: "0/knuxm97Cjq894dyIt6lblRLGP3uo6YTZ9Su4iFkdOGj2jjpYlHXETvPhrWJiVP",
  debug_errors: false,
  pubsub: [name: ElixirTraining.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# TODO: Add your google oauth2 credentials
config :oauth2,  ElixirTraining.Google, 
  client_id: "GOOGLE_CLIENT_ID",
  client_secret: "GOOGLE_CLIENT_SECRET",
  callback_url: "<mydomain>/auth/callback"

config :elixir_training, ElixirTraining.Round,
  current: 2

# TODO: Set name of participants, email field is used to authenticate users 
config :elixir_training, ElixirTraining.Participants,
  participant1: [ 
    email: "EMAIL_1",
    name: "NAME_1",
    goal: 30
  ],
  participant2: [
    email: "EMAIL_1",
    name: "NAME_2",
    goal: 30
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
