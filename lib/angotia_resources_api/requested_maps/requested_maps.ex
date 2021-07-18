defmodule AngotiaResourcesApi.RequestedMaps do
  import Ecto.Query, warn: false
  alias AngotiaResourcesApi.Repo

  alias AngotiaResourcesApi.RequestedMaps.Map, as: RMap
  alias AngotiaResourcesApi.Maps.Map, as: PMap

  def list_maps do
    Repo.all(RMap)
  end

  def get_map(id) do
    map = Repo.get(RMap, id) 

    if map, do: {:ok, map}, else: {:error, "Cannot find Requested Map by id #{id}"}
  end

  def get_maps_by_author(author_id) do
    query = from map in RMap,
      where: ilike(map.author, ^author_id)

    Repo.all(query)
  end

  def accept_map(id) do
    map = get_map(id)

    case map do
      {:error, _mess} -> map
      _ -> push_to_prod(map, id)
    end
  end

  defp push_to_prod(map, id) do
    req_map = elem(map, 1)
    prod_map = req_map
      |> Map.delete(:__meta__)
      |> Map.delete(:author)
      |> Map.delete(:id)
      |> Struct.to_map
      |> Map.from_struct

    delete_map id

    %PMap{}
      |> PMap.changeset(prod_map)
      |> Repo.insert()
  end

  def create_map(attrs \\ %{}) do
    %RMap{}
    |> RMap.changeset(attrs)
    |> Repo.insert()
  end

  def update_map(%RMap{} = map, attrs) do
    map
    |> RMap.changeset(attrs)
    |> Repo.update()
  end

  def delete_map(id) do
    map = get_map(id)

    case map do
      {:error, _mess} -> map
      _ -> Repo.delete(elem(map, 1))
    end
  end

  def change_map(%RMap{} = map) do
    RMap.changeset(map, %{})
  end
end
