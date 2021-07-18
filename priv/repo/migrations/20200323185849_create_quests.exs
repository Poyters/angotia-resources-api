defmodule AngotiaResourcesApi.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add :description, :string
      add :title, :string
      add :level, :integer

      timestamps()
    end

  end
end
