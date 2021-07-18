defmodule AngotiaResourcesApi.Repo.Migrations.CreateMobs do
  use Ecto.Migration

  def change do
    create table(:mobs) do
      add :name, :string
      add :level, :integer

      timestamps()
    end

  end
end
