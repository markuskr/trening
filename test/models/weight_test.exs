defmodule ElixirTraining.WeightTest do
  use ElixirTraining.ModelCase

  alias ElixirTraining.Weight

  @valid_attrs %{user: "some content", weight: "120.5", weight_date: %{day: 17, month: 4, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Weight.changeset(%Weight{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Weight.changeset(%Weight{}, @invalid_attrs)
    refute changeset.valid?
  end
end
