defmodule AngotiaResourcesApi.Maps.Item do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :value, :string
  end

  def changeset(item, attrs) do
    item
    |> cast(attrs, [:x, :y, :x_shift, :y_shift, :value])
  end
end
