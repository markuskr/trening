defmodule ElixirTrening.Router do
  use ElixirTrening.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/training/", ElixirTrening do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :login
    get "/logout", LoginController, :logout
    post "/authenticate", LoginController, :authenticate
    #get "/weight", WeightController, :weight

    get "/workout", TrainingController, :index
    post "/workout/create", TrainingController, :create

    get "/weight", WeightController, :index
    post "/weight/create", WeightController, :create

    get "/auth/callback", LoginController, :callback

    #resources "/weight", WeightController
    #resources "/training", TrainingController 
  end
end
