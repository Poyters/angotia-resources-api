defmodule AngotiaResourcesApi.QuestsTest do
  use AngotiaResourcesApi.DataCase

  alias AngotiaResourcesApi.Quests

  describe "quests" do
    alias AngotiaResourcesApi.Quests.Quest

    @valid_attrs %{description: "some description", level: 42, title: "some title"}
    @update_attrs %{description: "some updated description", level: 43, title: "some updated title"}
    @invalid_attrs %{description: nil, level: nil, title: nil}

    def quest_fixture(attrs \\ %{}) do
      {:ok, quest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Quests.create_quest()

      quest
    end

    test "list_quests/0 returns all quests" do
      quest = quest_fixture()
      assert Quests.list_quests() == [quest]
    end

    test "get_quest!/1 returns the quest with given id" do
      quest = quest_fixture()
      assert Quests.get_quest!(quest.id) == quest
    end

    test "create_quest/1 with valid data creates a quest" do
      assert {:ok, %Quest{} = quest} = Quests.create_quest(@valid_attrs)
      assert quest.description == "some description"
      assert quest.level == 42
      assert quest.title == "some title"
    end

    test "create_quest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quests.create_quest(@invalid_attrs)
    end

    test "update_quest/2 with valid data updates the quest" do
      quest = quest_fixture()
      assert {:ok, quest} = Quests.update_quest(quest, @update_attrs)
      assert %Quest{} = quest
      assert quest.description == "some updated description"
      assert quest.level == 43
      assert quest.title == "some updated title"
    end

    test "update_quest/2 with invalid data returns error changeset" do
      quest = quest_fixture()
      assert {:error, %Ecto.Changeset{}} = Quests.update_quest(quest, @invalid_attrs)
      assert quest == Quests.get_quest!(quest.id)
    end

    test "delete_quest/1 deletes the quest" do
      quest = quest_fixture()
      assert {:ok, %Quest{}} = Quests.delete_quest(quest)
      assert_raise Ecto.NoResultsError, fn -> Quests.get_quest!(quest.id) end
    end

    test "change_quest/1 returns a quest changeset" do
      quest = quest_fixture()
      assert %Ecto.Changeset{} = Quests.change_quest(quest)
    end
  end
end
