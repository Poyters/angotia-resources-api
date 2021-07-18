defmodule AngotiaResourcesApiWeb.Resolvers.MapsResolver do
  alias AngotiaResourcesApi.Maps
  alias AngotiaResourcesApi.Repo

  def all_maps(_parent, _args, _info) do
    {:ok, Maps.list_maps()}
  end

  def get_map(_parent, %{id: id}, _info) do
    Maps.get_map(id)
  end

  def create_map(_parent, %{map: map_args}, _resolutions) do
    Maps.create_map(map_args)
  end

  def update_map(_parent, %{id: id, map: map_args}, _context) do
    map = Repo.get(Maps.Map, id)

    if map, do:  Maps.update_map(map, map_args), else: {:error, "Cannot find Requested Map by id: #{id}"}
  end

  def delete_map(_parent, %{id: id}, _info) do
    Maps.delete_map(id)
  end
end