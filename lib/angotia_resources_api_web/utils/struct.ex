defmodule Struct do
  def to_map(map), do: :maps.map(&do_sample/2, map)

  def do_sample(_key, value), do: ensure_nested_map(value)

  defp ensure_nested_map(list) when is_list(list), do: Enum.map(list, &ensure_nested_map/1)

  defp ensure_nested_map(%{__struct__: _} = struct) do
    map = Map.from_struct(struct)
    :maps.map(&do_sample/2, map)
  end

  defp ensure_nested_map(data), do: data
end