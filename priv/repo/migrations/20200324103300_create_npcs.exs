defmodule AngotiaResourcesApi.Repo.Migrations.CreateChars do
  use Ecto.Migration

  def change do
    create table(:chars) do
      add :name, :string
      add :_id, :string
      add :field_diameter, :integer
      add :move_type, :string
      add :type, :string
      add :has_visible_level, :boolean
      add :char_pic, :string

      timestamps()
    end

  end
end
