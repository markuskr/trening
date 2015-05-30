defmodule ElixirTraining.Repo.Migrations.CreateMotivation do
  use Ecto.Migration

  def change do
    create table(:motivations) do
      add :content, :string
      add :priority, :integer

      timestamps
    end
  end
end
