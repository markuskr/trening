defmodule ElixirTrening.Router do
  use ElixirTrening.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirTrening do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :login
    get "/logout", LoginController, :logout
    post "/authenticate", LoginController, :authenticate
    get "/weight", WeightController, :weight
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirTrening do
  #   pipe_through :api
  # end
end
