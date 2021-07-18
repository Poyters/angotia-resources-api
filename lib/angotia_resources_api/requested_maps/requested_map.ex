defmodule AngotiaResourcesApi.RequestedMaps.Map do
  use Ecto.Schema
  import Ecto.Changeset
  alias AngotiaResourcesApi.Maps.Size
  alias AngotiaResourcesApi.Maps.Passage
  alias AngotiaResourcesApi.Maps.Building
  alias AngotiaResourcesApi.Maps.Decoration
  alias AngotiaResourcesApi.Maps.Terrain
  alias AngotiaResourcesApi.Maps.Npc
  alias AngotiaResourcesApi.Maps.Mob
  alias AngotiaResourcesApi.Maps.Se
  alias AngotiaResourcesApi.Maps.Block
  alias AngotiaResourcesApi.Maps.Vertex

  schema "requested_maps" do
    field :description, :string
    field :min_entry_level, :integer
    field :_id, :string
    field :map_name, :string
    field :map_pic, :string
    field :visibility_range, :integer
    field :author, :string
    field :combined_layers_blob, :string
    embeds_one :size, Size, on_replace: :update
    embeds_one :passage, Passage, on_replace: :update
    embeds_one :building, Building, on_replace: :update
    embeds_one :decoration, Decoration, on_replace: :update
    embeds_one :terrain, Terrain, on_replace: :update
    embeds_one :npc, Npc, on_replace: :update
    embeds_one :mob, Mob, on_replace: :update
    embeds_one :se, Se, on_replace: :update
    embeds_one :block_matrix, Block, on_replace: :update
    embeds_one :vertex, Vertex, on_replace: :update

    timestamps()
  end

  def changeset(map, attrs) do
    map
    |> cast(attrs, [:_id, :min_entry_level, :description, :map_name, :map_pic, :visibility_range, :author, :combined_layers_blob])
    |> validate_required([:_id, :min_entry_level, :map_name, :visibility_range, :author, :combined_layers_blob])
    |> cast_embed(:size, with: &Size.changeset/2)
    |> cast_embed(:passage, with: &Passage.changeset/2)
    |> cast_embed(:building, with: &Building.changeset/2)
    |> cast_embed(:decoration, with: &Decoration.changeset/2)
    |> cast_embed(:terrain, with: &Terrain.changeset/2)
    |> cast_embed(:npc, with: &Npc.changeset/2)
    |> cast_embed(:mob, with: &Mob.changeset/2)
    |> cast_embed(:se, with: &Se.changeset/2)
    |> cast_embed(:block_matrix, with: &Block.changeset/2)
    |> cast_embed(:vertex, with: &Vertex.changeset/2)
  end
end
