defmodule AngotiaResourcesApiWeb.Resolvers.RequestedMapsResolver do
  alias AngotiaResourcesApi.RequestedMaps
  alias AngotiaResourcesApi.Repo

  def all_requested_maps(_parent, _args, _info) do
    {:ok, RequestedMaps.list_maps()}
  end

  def get_requested_map(_parent, %{id: id}, _info) do
    RequestedMaps.get_map(id)
  end

  def get_requested_maps_by_author(_parent, %{author_id: author_id}, _info) do
    {:ok, RequestedMaps.get_maps_by_author(author_id)}
  end

  def create_requested_map(_parent, %{map: map_args}, _resolutions) do
    RequestedMaps.create_map(map_args)
  end

  def update_requested_map(_parent, %{id: id, map: map_args}, _context) do
    map = Repo.get(RequestedMaps.Map, id)

    if map, do: RequestedMaps.update_map(map, map_args), else: {:error, "Cannot find Requested Map by id: #{id}"}
  end

  def delete_requested_map(_parent, %{id: id}, _info) do
    RequestedMaps.delete_map(id)
  end

  def accept_requested_map(_parent, %{id: id}, _info) do
    RequestedMaps.accept_map(id)
  end
end