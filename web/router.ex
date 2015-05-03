defmodule ElixirTrening.Router do
  use ElixirTrening.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug Plug.Session, store: :cookie, signing_salt: "12345",  key: "_my_app_session", secure: true, table: :session

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  def current_user(conn) do
    get_session(conn, :email)
  end


  scope "/", ElixirTrening do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", LoginController, :login
    get "/logout", LoginController, :logout
    post "/authenticate", LoginController, :authenticate
    get "/hello", HelloController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirTrening do
  #   pipe_through :api
  # end
end
