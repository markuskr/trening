defmodule ElixirTraining.TrainingControllerTest do
  use ElixirTraining.ConnCase

  alias ElixirTraining.Training
  @valid_params training: %{description: "some content", training_date: %{day: 17, month: 4, year: 2010}, user: "some content", version: 42}
  @invalid_params training: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /training", %{conn: conn} do
    conn = get conn, training_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing training"
  end

  test "GET /training/new", %{conn: conn} do
    conn = get conn, training_path(conn, :new)
    assert html_response(conn, 200) =~ "New training"
  end

  test "POST /training with valid data", %{conn: conn} do
    conn = post conn, training_path(conn, :create), @valid_params
    assert redirected_to(conn) == training_path(conn, :index)
  end

  test "POST /training with invalid data", %{conn: conn} do
    conn = post conn, training_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New training"
  end

  test "GET /training/:id", %{conn: conn} do
    training = Repo.insert %Training{}
    conn = get conn, training_path(conn, :show, training)
    assert html_response(conn, 200) =~ "Show training"
  end

  test "GET /training/:id/edit", %{conn: conn} do
    training = Repo.insert %Training{}
    conn = get conn, training_path(conn, :edit, training)
    assert html_response(conn, 200) =~ "Edit training"
  end

  test "PUT /training/:id with valid data", %{conn: conn} do
    training = Repo.insert %Training{}
    conn = put conn, training_path(conn, :update, training), @valid_params
    assert redirected_to(conn) == training_path(conn, :index)
  end

  test "PUT /training/:id with invalid data", %{conn: conn} do
    training = Repo.insert %Training{}
    conn = put conn, training_path(conn, :update, training), @invalid_params
    assert html_response(conn, 200) =~ "Edit training"
  end

  test "DELETE /training/:id", %{conn: conn} do
    training = Repo.insert %Training{}
    conn = delete conn, training_path(conn, :delete, training)
    assert redirected_to(conn) == training_path(conn, :index)
    refute Repo.get(Training, training.id)
  end
end
