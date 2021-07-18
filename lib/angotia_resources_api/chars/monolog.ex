defmodule AngotiaResourcesApi.Chars.Monolog do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do 
    field :_id, :string
    field :content, :string
  end

  def changeset(monolog, attrs) do
    monolog
    |> cast(attrs, [:_id, :content])
  end
end