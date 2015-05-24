defmodule ElixirTrening.Training do
  use ElixirTrening.Web, :model

  schema "training" do
    field :user, :string
    field :description, :string
    field :version, :integer

    timestamps
  end

  @required_fields ~w(user description version)
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
