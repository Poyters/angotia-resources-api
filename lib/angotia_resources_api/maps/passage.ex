defmodule AngotiaResourcesApi.Maps.Passage do
  use Ecto.Schema
  import Ecto.Changeset
  alias AngotiaResourcesApi.Maps.Location
  alias AngotiaResourcesApi.Maps.Size

  embedded_schema do
    embeds_many :locations, Location, on_replace: :delete
  end

  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [])
    |> cast_embed(:locations, with: &Location.changeset/2)
  end
end
