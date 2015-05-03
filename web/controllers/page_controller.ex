defmodule ElixirTrening.PageController do
  use ElixirTrening.Web, :controller

  plug :action

  
  def index(conn, params) do
    render conn, "index.html", current_user: get_session(conn, :email)
  end
end
