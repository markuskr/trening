defmodule ElixirTrening.WeightControllerTest do
  use ElixirTrening.ConnCase

  alias ElixirTrening.Weight
  @valid_params weight: %{user: "some content", weight: "120.5", weight_date: %{day: 17, month: 4, year: 2010}}
  @invalid_params weight: %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /weight", %{conn: conn} do
    conn = get conn, weight_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing weight"
  end

  test "GET /weight/new", %{conn: conn} do
    conn = get conn, weight_path(conn, :new)
    assert html_response(conn, 200) =~ "New weight"
  end

  test "POST /weight with valid data", %{conn: conn} do
    conn = post conn, weight_path(conn, :create), @valid_params
    assert redirected_to(conn) == weight_path(conn, :index)
  end

  test "POST /weight with invalid data", %{conn: conn} do
    conn = post conn, weight_path(conn, :create), @invalid_params
    assert html_response(conn, 200) =~ "New weight"
  end

  test "GET /weight/:id", %{conn: conn} do
    weight = Repo.insert %Weight{}
    conn = get conn, weight_path(conn, :show, weight)
    assert html_response(conn, 200) =~ "Show weight"
  end

  test "GET /weight/:id/edit", %{conn: conn} do
    weight = Repo.insert %Weight{}
    conn = get conn, weight_path(conn, :edit, weight)
    assert html_response(conn, 200) =~ "Edit weight"
  end

  test "PUT /weight/:id with valid data", %{conn: conn} do
    weight = Repo.insert %Weight{}
    conn = put conn, weight_path(conn, :update, weight), @valid_params
    assert redirected_to(conn) == weight_path(conn, :index)
  end

  test "PUT /weight/:id with invalid data", %{conn: conn} do
    weight = Repo.insert %Weight{}
    conn = put conn, weight_path(conn, :update, weight), @invalid_params
    assert html_response(conn, 200) =~ "Edit weight"
  end

  test "DELETE /weight/:id", %{conn: conn} do
    weight = Repo.insert %Weight{}
    conn = delete conn, weight_path(conn, :delete, weight)
    assert redirected_to(conn) == weight_path(conn, :index)
    refute Repo.get(Weight, weight.id)
  end
end
