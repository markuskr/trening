defmodule ElixirTrening.HelloController do
  use ElixirTrening.Web, :controller
  
  plug :action

  require Logger

  def show(conn, _params) do
    email = get_session(conn, :email)
    Logger.debug email
    render conn, "show.html", %{:email => email, :current_user => get_session(conn, :email)}
  end 
end
