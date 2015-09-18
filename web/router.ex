defmodule ElixirTraining.Router do
  use ElixirTraining.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", ElixirTraining do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :login
    get "/countdown", CountdownController, :countdown
    get "/logout", LoginController, :logout
    post "/authenticate", LoginController, :authenticate

    post "/workout/create", TrainingController, :create

    get "/weight", WeightController, :index
    post "/weight/create", WeightController, :create

    get "/auth/callback", LoginController, :callback

    resources "/motivations", MotivationController
  end
end
