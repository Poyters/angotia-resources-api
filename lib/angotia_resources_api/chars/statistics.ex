defmodule AngotiaResourcesApi.Chars.Statistics do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do 
    field :level, :integer
    field :health, :integer
    field :attack, :integer
    field :defence, :integer
    field :strength, :integer
    field :dexterity, :integer
    field :inteligence, :integer
    field :jink, :integer
    field :speed, :integer
    field :attack_range, :integer
    field :attack_speed, :integer
  end

  def changeset(statistics, attrs) do
    statistics
    |> cast(attrs, [:level, :health, :attack, :defence, :strength, :dexterity, :inteligence, :jink, :speed, :attack_range, :attack_speed])
  end
end
