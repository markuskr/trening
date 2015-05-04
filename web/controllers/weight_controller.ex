defmodule ElixirTrening.WeightController do
  use ElixirTrening.Web, :controller

  import ElixirTrening.Authenticator
  require Logger

  # The ordering here determines the call-order
  plug :authenticate
  plug :action

  def weight(conn, _params) do
    render conn, "weight.html", current_user: get_session(conn, :user)
  end
  
  defp authenticate(conn, params) do
    case is_authenticated?(conn) do 
      {:ok, user} -> 
        Logger.debug inspect(user)
        conn
      _ ->  
        Logger.debug "unauthorized"
        conn |> redirect(to: "/") |> halt
    end
  end

end
