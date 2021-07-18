defmodule AngotiaResourcesApi.Maps.Vertex do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    embeds_many :weights, Destination, on_replace: :delete do
      field :x, :integer
      field :y, :integer
      field :x_shift, :integer
      field :y_shift, :integer
      field :_id, :string
      field :weight, :integer
    end
  end

  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [])
    |> cast_embed(:weights, with: &weight_changeset/2)
  end

  defp weight_changeset(weight, attrs) do
    weight
    |> cast(attrs, [:x, :y, :x_shift, :y_shift, :_id, :weight])
  end

end
