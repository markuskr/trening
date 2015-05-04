defmodule ElixirTrening.LoginController do
  use ElixirTrening.Web, :controller

  require Logger

  plug :action

  def authenticate(conn, %{"email" => email, "password" => password}) do
    Logger.debug(email <> " " <> password)
    case {email, password} do
      {"t@t.at", "test"} -> 
        put_session(conn, :user, email) |> redirect(to: "/")
      _ -> raise "unauthoried" 
    end
  end

  def logout(conn, _param) do 
    delete_session(conn, :user) |> redirect(to: "/")
  end

  def login(conn, _params) do
    render conn, "login.html", current_user: get_session(conn, :email)
  end
end
