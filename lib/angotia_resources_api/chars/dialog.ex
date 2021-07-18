defmodule AngotiaResourcesApi.Chars.Dialog do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :_id, :string
    field :npc, :string
    embeds_many :player, Player, on_replace: :delete do
      field :_id, :string
      field :dialog, :string
      field :action, :string
      field :next, :string
      field :condition, :string
    end
  end

  def changeset(dialog, attrs) do
    dialog
    |> cast(attrs, [:_id, :npc])
    |> cast_embed(:player, with: &player_changeset/2)
  end

  defp player_changeset(player, attrs) do
    player
    |> cast(attrs, [:_id, :dialog, :action, :next, :condition])
  end
end
