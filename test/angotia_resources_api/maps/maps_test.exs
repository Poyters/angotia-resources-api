defmodule AngotiaResourcesApi.MapsTest do
  use AngotiaResourcesApi.DataCase

  alias AngotiaResourcesApi.Maps

  describe "maps" do
    alias AngotiaResourcesApi.Maps.Map

    @valid_attrs %{description: "some description", level: 42, title: "some title"}
    @update_attrs %{description: "some updated description", level: 43, title: "some updated title"}
    @invalid_attrs %{description: nil, level: nil, title: nil}

    def map_fixture(attrs \\ %{}) do
      {:ok, map} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Maps.create_map()

      map
    end

    test "list_maps/0 returns all maps" do
      map = map_fixture()
      assert Maps.list_maps() == [map]
    end

    test "get_map!/1 returns the map with given id" do
      map = map_fixture()
      assert Maps.get_map!(map.id) == map
    end

    test "create_map/1 with valid data creates a map" do
      assert {:ok, %Map{} = map} = Maps.create_map(@valid_attrs)
      assert map.description == "some description"
      assert map.level == 42
      assert map.title == "some title"
    end

    test "create_map/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Maps.create_map(@invalid_attrs)
    end

    test "update_map/2 with valid data updates the map" do
      map = map_fixture()
      assert {:ok, map} = Maps.update_map(map, @update_attrs)
      assert %Map{} = map
      assert map.description == "some updated description"
      assert map.level == 43
      assert map.title == "some updated title"
    end

    test "update_map/2 with invalid data returns error changeset" do
      map = map_fixture()
      assert {:error, %Ecto.Changeset{}} = Maps.update_map(map, @invalid_attrs)
      assert map == Maps.get_map!(map.id)
    end

    test "delete_map/1 deletes the map" do
      map = map_fixture()
      assert {:ok, %Map{}} = Maps.delete_map(map)
      assert_raise Ecto.NoResultsError, fn -> Maps.get_map!(map.id) end
    end

    test "change_map/1 returns a map changeset" do
      map = map_fixture()
      assert %Ecto.Changeset{} = Maps.change_map(map)
    end
  end
end
