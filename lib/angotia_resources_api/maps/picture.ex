defmodule AngotiaResourcesApi.Maps.Picture do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :_id, :string
    field :blob, :string
  end

  def changeset(picture, attrs) do
    picture
    |> cast(attrs, [:_id, :blob])
  end
end
