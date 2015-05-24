defmodule ElixirTrening.TrainingController do
  use ElixirTrening.Web, :controller
  require Logger

  import ElixirTrening.Authenticator
  alias ElixirTrening.Training
  
  plug :scrub_params, "description" when action in [:create]
  plug :authenticate
  plug :action

  defp authenticate(conn, params) do
     case is_authenticated?(conn) do
       {:ok, user} ->
         conn
       _ ->
         Logger.debug "unauthorized"
         conn |> redirect(to: "/") |> halt
     end
  end
  
  def index(conn, _params) do
    training = Repo.all(from t in Training, where: t.user == "t@t.at", select: t)
    render(conn, "index.html", training: training)
  end

  def create(conn, %{"description" => description}) do
    training_params = %{:description => description, :user => "t@t.at", :version => 1}

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
