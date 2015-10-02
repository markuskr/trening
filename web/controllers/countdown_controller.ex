defmodule ElixirTraining.CountdownController do
  @moduledoc """
  Shows countdown view, users must be logged in 
  """
  use ElixirTraining.Web, :controller

  import ElixirTraining.Authenticator
  alias ElixirTraining.PageController

  require Logger
  require Calendar

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
    today = Calendar.DateTime.to_date(Calendar.DateTime.now! "Europe/Oslo")
    target_date = Calendar.Date.from_erl! {2015,12,15}
    current_user = current_user(conn)
    user_info = PageController.info_per_email(current_user)
    {:ok, target_date_string} =  Calendar.Strftime.strftime(target_date, "%d.%m.%Y")
    render(conn, "index.html", 
        authenticated: :true, 
        current_user: current_user,
        name: user_info.name, 
        current_amount: user_info.goal - user_info.current,
        message: user_info.message,
        goal: user_info.goal,
        target_date: target_date_string,
        difference: Calendar.Date.diff(target_date, today))
  end
end
