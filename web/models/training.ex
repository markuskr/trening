defmodule ElixirTraining.Training do
  use Ecto.Schema
  import Ecto.Changeset

  schema "training" do
    field :user, :string
    field :description, :string
    field :version, :integer

    timestamps
  end

  @required_fields ~w(user description version)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields)
  end
end
