defmodule ElixirTrening.PageController do
  use ElixirTrening.Web, :controller

  import ElixirTrening.Authenticator
  plug :action
  
  
  def index(conn, params) do
    render conn, "index.html", current_user: current_user(conn)
  end
end
