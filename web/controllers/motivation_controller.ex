defmodule ElixirTraining.MotivationController do
  @moduledoc """
  Generated controller to manipulate motivational sentences, users must be logged in 
  """
  use ElixirTraining.Web, :controller

  alias ElixirTraining.Motivation
  import ElixirTraining.Authenticator

  require Logger

  plug :scrub_params, "motivation" when action in [:create, :update]

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

  def index(conn, _params) do
    motivations = Repo.all(Motivation)
    render(conn, "index.html", 
        authenticated: :true, 
        current_user: current_user(conn),
        motivations: motivations)
  end

  def new(conn, _params) do
    changeset = Motivation.changeset(%Motivation{})
    render(conn, "new.html", 
        authenticated: :true, 
        current_user: current_user(conn),
        changeset: changeset)
  end

  def create(conn, %{"motivation" => motivation_params}) do
    changeset = Motivation.changeset(%Motivation{}, motivation_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Motivation created successfully.")
      |> redirect(to: motivation_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    motivation = Repo.get(Motivation, id)
    render(conn, "show.html", 
        authenticated: :true, 
        current_user: current_user(conn),
        motivation: motivation)
  end

  def edit(conn, %{"id" => id}) do
    motivation = Repo.get(Motivation, id)
    changeset = Motivation.changeset(motivation)
    render(conn, "edit.html", 
        authenticated: :true, 
        current_user: current_user(conn),
        motivation: motivation, 
        changeset: changeset)
  end

  def update(conn, %{"id" => id, "motivation" => motivation_params}) do
    motivation = Repo.get(Motivation, id)
    changeset = Motivation.changeset(motivation, motivation_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Motivation updated successfully.")
      |> redirect(to: motivation_path(conn, :index))
    else
      render(conn, "edit.html", 
          authenticated: :true, 
          current_user: current_user(conn),
          motivation: motivation, 
          changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    motivation = Repo.get(Motivation, id)
    Repo.delete(motivation)

    conn
    |> put_flash(:info, "Motivation deleted successfully.")
    |> redirect(to: motivation_path(conn, :index))
  end
end
