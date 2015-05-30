defmodule ElixirTraining.TrainingTest do
  use ElixirTraining.ModelCase

  alias ElixirTraining.Training

  @valid_attrs %{description: "some content", training_date: %{day: 17, month: 4, year: 2010}, user: "some content", version: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Training.changeset(%Training{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Training.changeset(%Training{}, @invalid_attrs)
    refute changeset.valid?
  end
end
