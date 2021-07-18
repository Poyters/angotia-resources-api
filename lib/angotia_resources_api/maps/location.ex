defmodule AngotiaResourcesApi.Maps.Location do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :_id, :string
    embeds_one :destination, Destination, on_replace: :delete do
      field :map_target_id, :integer
      field :map_target_cords, :integer
    end
  end

  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:x, :y, :x_shift, :y_shift, :_id])
    |> cast_embed(:destination, with: &destination_changeset/2)
  end

  defp destination_changeset(destination, attrs) do
    destination
    |> cast(attrs, [:map_target_id, :map_target_cords])
  end

end
