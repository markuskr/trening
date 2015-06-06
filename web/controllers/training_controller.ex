defmodule ElixirTraining.TrainingController do
  @moduledoc """
  Stores an added training, user needs to be authenticated to add a training
  """
  use ElixirTraining.Web, :controller
  require Logger

  import ElixirTraining.Authenticator
  alias ElixirTraining.Training
  
  plug :scrub_params, "description" when action in [:create]

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
  
  def create(conn, %{"description" => description}) do
    current_round = Application.get_env(:elixir_training, ElixirTraining.Round)[:current]
    training_params = %{:description => description, :user => current_user(conn), :version => current_round}

    changeset = Training.changeset(%Training{}, training_params)
    Logger.debug (inspect changeset.params) 
    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Training created successfully.")
      |> redirect(to: page_path(conn, :index))
    else
      conn 
      |> put_flash(:error, "Training "<> inspect training_params <> " could not be saved")
      |> redirect(to: page_path(conn, :index))
    end
  end
end
