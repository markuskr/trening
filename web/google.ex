defmodule Google do
  @moduledoc """
  An OAuth2 strategy for Google.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode
  
  # Public API
  def new do

    OAuth2.new([
      strategy: __MODULE__,
      client_id: Application.get_env(:oauth2,ElixirTrening.Google)[:client_id],
      client_secret: Application.get_env(:oauth2,ElixirTrening.Google)[:client_secret],
      redirect_uri: "https://alpenfjord.ddns.net/training/auth/callback",
      # Lazy: should call 
      # https://accounts.google.com/.well-known/openid-configuration first
      site: "https://www.googleapis.com/oauth2/v3", 
      authorize_url: "https://accounts.google.com/o/oauth2/auth",
      token_url: "https://accounts.google.com/o/oauth2/token"
    ])
  end

  def authorize_url!(params \\ []) do
    new() 
      |> put_param(:scope, "https://www.googleapis.com/auth/userinfo.email") 
      |> OAuth2.Client.authorize_url!(params)
  end

  def get_token!(params \\ [], _headers \\ []) do
    OAuth2.Client.get_token!(new(), params)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params )
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end
