defmodule AngotiaResourcesApi.Maps.Mob do
  use Ecto.Schema
  import Ecto.Changeset
  alias AngotiaResourcesApi.Maps.Item
  alias AngotiaResourcesApi.Maps.Picture

  embedded_schema do
    embeds_many :items, Item, on_replace: :delete
    embeds_many :pics, Picture, on_replace: :delete
  end

  def changeset(mob, attrs) do
    mob
    |> cast(attrs, [])
    |> cast_embed(:items, with: &Item.changeset/2)
    |> cast_embed(:pics, with: &Picture.changeset/2)
  end
end
