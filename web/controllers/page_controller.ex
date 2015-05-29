defmodule ElixirTrening.PageController do
  use ElixirTrening.Web, :controller

  require Logger
  import ElixirTrening.Authenticator
  alias ElixirTrening.Training
  plug :action
  
  def index(conn, params) do
    case is_authenticated?(conn) do
      {:ok, user} -> 
        trainings = Repo.all(from t in Training, where: t.user == ^user, select: t)
        render conn, "index.html", authenticated: :true, current_user: user, trainings: trainings
      {:error, reason} ->
        render conn, "index.html", authenticated: :false
    end 
  end
end
