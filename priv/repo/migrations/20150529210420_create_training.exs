defmodule ElixirTrening.Repo.Migrations.CreateTraining do
  use Ecto.Migration

  def change do
    create table(:training) do
      add :user, :string
      add :description, :string
      add :version, :integer

      timestamps
    end
  end
end
