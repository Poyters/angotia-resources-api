defmodule AngotiaResourcesApi.Maps.Size do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do 
    field :x, :integer
    field :y, :integer
  end

  def changeset(size, attrs) do
    size
    |> cast(attrs, [:x, :y])
  end
end