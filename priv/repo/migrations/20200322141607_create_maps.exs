defmodule AngotiaResourcesApi.Repo.Migrations.CreateMaps do
  use Ecto.Migration

  def change do
    create table(:maps) do
      add :title, :string
      add :description, :string
      add :level, :integer

      timestamps()
    end

  end
end
