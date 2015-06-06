defmodule ElixirTraining.LoginController do
  @moduledoc """
  Module to authenticate against google using oauth2
  """
  use ElixirTraining.Web, :controller
  require Logger

  plug :action

  def callback(conn, %{"code" => code}) do
    token = Google.get_token!(code: code)
    userinfo = OAuth2.AccessToken.get!(token, "/userinfo")
   
    Logger.debug inspect userinfo
    
    participant1 = Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant1][:email] 
    participant2 = Application.get_env(:elixir_training, ElixirTraining.Participants)[:participant2][:email] 

    case userinfo do 
      # Check if user is allowed to use this app
      %{"email" => email} when 
          email == participant1 
       or email == participant2 ->  
              
        conn 
          |> put_session(:user, email) 
          |> put_session(:access_token, token.access_token)
          |> put_flash(:info, "Successfully logged in") 
          |> redirect(to: page_path(conn, :index))  
      _ -> 
        conn |> put_flash(:error, "Could not be logged in") |> redirect(to: page_path(conn, :index))  

    end 
  end

  def logout(conn, _param) do 
    delete_session(conn, :user) |> redirect(to: page_path(conn, :index))
  end

  def login(conn, _params) do
    redirect conn, external: Google.authorize_url!
  end
end
