defmodule ElixirTrening.WeightController do
  use ElixirTrening.Web, :controller

  require Logger
  import ElixirTrening.Authenticator
  alias ElixirTrening.Weight

  plug :scrub_params, "weight" when action in [:create]
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
    weight = Repo.all(from w in Weight, where: w.user == ^current_user(conn), select: w)
    render(conn, "index.html", weight: weight, current_user: current_user(conn))
  end

  def create(conn, %{"weight" => weight}) do
    weight_params = %{:weight => weight, :user => current_user(conn)}

    changeset = Weight.changeset(%Weight{}, weight_params)
    Logger.debug (inspect changeset.params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Weight created successfully.")
      |> redirect(to: weight_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end
end
