defmodule AngotiaResourcesApi.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "quests" do
    field :description, :string
    field :level, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:description, :title, :level])
    |> validate_required([:description, :title, :level])
  end
end
