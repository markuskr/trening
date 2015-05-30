defmodule ElixirTrening.MotivationController do
  use ElixirTrening.Web, :controller

  alias ElixirTrening.Motivation
  import ElixirTrening.Authenticator

  require Logger

  plug :scrub_params, "motivation" when action in [:create, :update]

  plug :authenticate
  plug :action

  defp authenticate(conn, params) do
     case is_authenticated?(conn) do
       {:ok, user} ->
         conn
       _ ->
         Logger.debug "unauthorized"
         conn |> redirect(to: "/training/") |> halt
     end
  end

  def index(conn, _params) do
    motivations = Repo.all(Motivation)
    render(conn, "index.html", motivations: motivations)
  end

  def new(conn, _params) do
    changeset = Motivation.changeset(%Motivation{})
    render(conn, "new.html", changeset: changeset)
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
    render(conn, "show.html", motivation: motivation)
  end

  def edit(conn, %{"id" => id}) do
    motivation = Repo.get(Motivation, id)
    changeset = Motivation.changeset(motivation)
    render(conn, "edit.html", motivation: motivation, changeset: changeset)
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
      render(conn, "edit.html", motivation: motivation, changeset: changeset)
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
