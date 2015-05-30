defmodule ElixirTrening.Motivation do
  use ElixirTrening.Web, :model

  schema "motivations" do
    field :content, :string
    field :priority, :integer

    timestamps
  end

  @required_fields ~w(content priority)
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
