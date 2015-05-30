defmodule ElixirTraining.Authenticator do
  import Plug.Conn 
  require Logger

  def is_authenticated?(conn) do
    user = get_session(conn, :user)
    if user do 
      {:ok, user}
    else 
    #{:ok, "mkrallinger@gmail.com"}
      {:error, "not logged in"}
    end 
  end

  def current_user(conn) do
    case is_authenticated?(conn) do
      {:ok, user} -> user
      _           -> nil  
    end
  end
end
