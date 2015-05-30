defmodule ElixirTrening.Repo.Migrations.CreateWeight do
  use Ecto.Migration

  def change do
    create table(:weight) do
      add :user, :string
      add :weight, :float

      timestamps
    end
  end
end
