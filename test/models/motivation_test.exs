defmodule ElixirTraining.MotivationTest do
  use ElixirTraining.ModelCase

  alias ElixirTraining.Motivation

  @valid_attrs %{content: "some content", priority: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Motivation.changeset(%Motivation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Motivation.changeset(%Motivation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
