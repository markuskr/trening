defmodule ElixirTraining.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :string
      add :word_count, :integer

      timestamps
    end

  end
end
