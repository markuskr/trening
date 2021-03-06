defmodule ElixirTraining.Weight do
  use Ecto.Schema
  import Ecto.Changeset

  schema "weight" do
    field :user, :string
    field :weight, :float
    timestamps
  end

  @required_fields ~w(user weight)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
