defmodule ElixirTraining.CountdownController do
  @moduledoc """
  Shows countdown view, users must be logged in 
  """
  use ElixirTraining.Web, :controller

  import ElixirTraining.Authenticator
  alias ElixirTraining.PageController

  require Logger


  # The order of plugs is important here, first authenticate, then call action handler
  plug :authenticate
  plug :action

  defp authenticate(conn, _params) do
     case is_authenticated?(conn) do
       {:ok, _user} ->
         conn
       _ ->
         Logger.debug "unauthorized"
         conn |> redirect(to: page_path(conn, :index)) |> halt
     end
  end


  def countdown(conn, _params) do
    current_user = current_user(conn)
    user_info = PageController.info_per_email(current_user)
    render(conn, "index.html", 
        authenticated: :true, 
        current_user: current_user,
        name: user_info.name, 
        current_amount: user_info.goal - user_info.current,
        message: user_info.message,
        goal: user_info.goal)
  end
end
