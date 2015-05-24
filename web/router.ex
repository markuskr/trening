defmodule ElixirTrening.Router do
  use ElixirTrening.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", ElixirTrening do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :login
    get "/logout", LoginController, :logout
    post "/authenticate", LoginController, :authenticate
    #get "/weight", WeightController, :weight

    get "/training", TrainingController, :index
    post "/training/create", TrainingController, :create

    get "/weight", WeightController, :index
    post "/weight/create", WeightController, :create

    #resources "/weight", WeightController
    #resources "/training", TrainingController 
  end
end
