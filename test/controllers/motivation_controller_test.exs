defmodule ElixirTraining.MotivationControllerTest do
  use ElixirTraining.ConnCase

  alias ElixirTraining.Motivation
  @valid_params motivation: %{content: "some content", priority: 42}
  @invalid_params motivation: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /motivations", %{conn: conn} do
    conn = get conn, motivation_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing motivations"
  end

  test "GET /motivations/new", %{conn: conn} do
    conn = get conn, motivation_path(conn, :new)
    assert html_response(conn, 200) =~ "New motivation"
  end

  test "POST /motivations with valid data", %{conn: conn} do
    conn = post conn, motivation_path(conn, :create), @valid_params
    assert redirected_to(conn) == motivation_path(conn, :index)
  end

  test "POST /motivations with invalid data", %{conn: conn} do
    conn = post conn, motivation_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New motivation"
  end

  test "GET /motivations/:id", %{conn: conn} do
    motivation = Repo.insert %Motivation{}
    conn = get conn, motivation_path(conn, :show, motivation)
    assert html_response(conn, 200) =~ "Show motivation"
  end

  test "GET /motivations/:id/edit", %{conn: conn} do
    motivation = Repo.insert %Motivation{}
    conn = get conn, motivation_path(conn, :edit, motivation)
    assert html_response(conn, 200) =~ "Edit motivation"
  end

  test "PUT /motivations/:id with valid data", %{conn: conn} do
    motivation = Repo.insert %Motivation{}
    conn = put conn, motivation_path(conn, :update, motivation), @valid_params
    assert redirected_to(conn) == motivation_path(conn, :index)
  end

  test "PUT /motivations/:id with invalid data", %{conn: conn} do
    motivation = Repo.insert %Motivation{}
    conn = put conn, motivation_path(conn, :update, motivation), @invalid_params
    assert html_response(conn, 200) =~ "Edit motivation"
  end

  test "DELETE /motivations/:id", %{conn: conn} do
    motivation = Repo.insert %Motivation{}
    conn = delete conn, motivation_path(conn, :delete, motivation)
    assert redirected_to(conn) == motivation_path(conn, :index)
    refute Repo.get(Motivation, motivation.id)
  end
end
