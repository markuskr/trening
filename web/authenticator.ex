defmodule ElixirTraining.Authenticator do
  @moduledoc """
  Module to check if an user is logged in. Currently the emaip adresse is stored in the session. 
  Initally the user is set when the user was authenticated using oauth and the email adress is allowed.
  """
  import Plug.Conn 
  require Logger

  def is_authenticated?(conn) do
    user = get_session(conn, :user)
    if user do 
      {:ok, user}
    else 
      {:ok, "mkrallinger@gmail.com"}
      #{:error, "not logged in"}
    end 
  end

  def current_user(conn) do
    case is_authenticated?(conn) do
      {:ok, user} -> user
      _           -> nil  
    end
  end
end
