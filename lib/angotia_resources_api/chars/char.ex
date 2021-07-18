defmodule AngotiaResourcesApi.Chars.Char do
  use Ecto.Schema
  import Ecto.Changeset
  alias AngotiaResourcesApi.Chars.Statistics
  alias AngotiaResourcesApi.Chars.Settings
  alias AngotiaResourcesApi.Chars.Monolog
  alias AngotiaResourcesApi.Chars.Dialog


  schema "chars" do
    field :name, :string
    field :_id, :string
    field :field_diameter, :integer
    field :move_type, :string, default: "static"
    field :type, :string
    field :has_visible_level, :boolean, default: true
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    embeds_one :statistics, Statistics, on_replace: :update
    embeds_one :settings, Settings, on_replace: :update
    embeds_many :monologs, Monolog, on_replace: :delete
    embeds_many :dialogs, Dialog, on_replace: :delete

    timestamps()
  end

  def changeset(char, attrs) do
    char
    |> cast(attrs, [:name, :_id, :field_diameter, :move_type, :type, :has_visible_level, :char_pic, :mob_range, :is_mob_aggressive])
    |> validate_required([:name, :_id, :field_diameter, :type, :has_visible_level, :char_pic])
    |> cast_embed(:statistics, with: &Statistics.changeset/2)
    |> cast_embed(:settings, with: &Settings.changeset/2)
    |> cast_embed(:monologs, with: &Monolog.changeset/2)
    |> cast_embed(:dialogs, with: &Dialog.changeset/2)
  end
end
