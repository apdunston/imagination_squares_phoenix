defmodule ImaginationSquaresPhoenix.Repo.Migrations.CreateDrawings do
  use Ecto.Migration

  def change do
    create table(:drawings) do
      add :user_id, :integer
      add :name, :string
      add :content, :text, null: true

      timestamps()
    end

  end
end
