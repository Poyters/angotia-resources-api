defmodule AngotiaResourcesApi.Chars.Settings do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    embeds_one :time_of_occurance, TimeOfOccurance, on_replace: :update do
      field :min, :integer
      field :max, :integer
    end

    embeds_one :resp_time, RespTime, on_replace: :update do
      field :min, :integer
      field :max, :integer
    end
  end

  def changeset(settings, attrs) do
    settings
    |> cast(attrs, [])
    |> cast_embed(:time_of_occurance, with: &time_of_occurance_changeset/2)
    |> cast_embed(:resp_time, with: &resp_time_changeset/2)
  end

  defp time_of_occurance_changeset(occurance, attrs) do
    occurance
    |> cast(attrs, [:min, :max])
  end

  defp resp_time_changeset(resp, attrs) do
    resp
    |> cast(attrs, [:min, :max])
  end
end
