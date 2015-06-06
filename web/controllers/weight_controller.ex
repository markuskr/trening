defmodule ElixirTraining.WeightController do
  @moduledoc """
  Displays all the weights a user has stored in the app and allows to add the current weight, user must be logged in.
  """
  use ElixirTraining.Web, :controller

  require Logger
  import ElixirTraining.Authenticator
  alias ElixirTraining.Weight

  plug :scrub_params, "weight" when action in [:create]
  
  # The order of plugs is important here, first authenticate, then call action handler
  plug :authenticate
  plug :action

  defp authenticate(conn, _params) do
     case is_authenticated?(conn) do
       {:ok, _user} ->
         conn
       _ ->
         Logger.debug "unauthorized"
         conn 
          |> redirect(to: page_path(conn, :index)) 
          |> halt
     end
  end

  def index(conn, _params) do
    weight = Repo.all(
      from w in Weight, 
      where: w.user == ^current_user(conn), 
      order_by: [desc: w.inserted_at], 
      select: w)
    render(conn, "index.html", weight: weight, authenticated: :true, current_user: current_user(conn))
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
