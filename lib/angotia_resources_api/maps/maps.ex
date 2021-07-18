defmodule AngotiaResourcesApi.Maps do
  import Ecto.Query, warn: false
  alias AngotiaResourcesApi.Repo

  alias AngotiaResourcesApi.Maps.Map

  def list_maps do
    Repo.all(Map)
  end

  def get_map(id) do
    map = Repo.get(Map, id) 

    if map, do: {:ok, map}, else: {:error, "Cannot find Map by id #{id}"}
  end

  def create_map(attrs \\ %{}) do
    %Map{}
    |> Map.changeset(attrs)
    |> Repo.insert()
  end

  def update_map(%Map{} = map, attrs) do
    map
    |> Map.changeset(attrs)
    |> Repo.update()
  end

  def delete_map(id) do
    map = get_map(id)

    case map do
      {:error, _mess} -> map
      _ -> Repo.delete(elem(map, 1))
    end
  end

  def change_map(%Map{} = map) do
    Map.changeset(map, %{})
  end
end
