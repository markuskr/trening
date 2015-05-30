defmodule ElixirTraining.LoginController do
  use ElixirTraining.Web, :controller

  require Logger

  plug :action

  def callback(conn, %{"code" => code}) do
    token = Google.get_token!(code: code)
    Logger.debug inspect token
    userinfo = OAuth2.AccessToken.get!(token, "/userinfo")
   
    participant1 = Application.get_env(:elixir_training, ElixirTraining.Participant1)[:email] 
    participant2 = Application.get_env(:elixir_training, ElixirTraining.Participant2)[:email] 

    case userinfo do 
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
