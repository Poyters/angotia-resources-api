defmodule AngotiaResourcesApi.CharsTest do
  use AngotiaResourcesApi.DataCase

  alias AngotiaResourcesApi.Chars

  describe "chars" do
    alias AngotiaResourcesApi.Chars.Char

    @valid_attrs %{level: 42, name: "some name"}
    @update_attrs %{level: 43, name: "some updated name"}
    @invalid_attrs %{level: nil, name: nil}

    def char_fixture(attrs \\ %{}) do
      {:ok, char} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chars.create_char()

      char
    end

    test "list_chars/0 returns all chars" do
      char = char_fixture()
      assert Chars.list_chars() == [char]
    end

    test "get_char!/1 returns the char with given id" do
      char = char_fixture()
      assert Chars.get_char!(char.id) == char
    end

    test "create_char/1 with valid data creates a char" do
      assert {:ok, %Char{} = char} = Chars.create_char(@valid_attrs)
      assert char.level == 42
      assert char.name == "some name"
    end

    test "create_char/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chars.create_char(@invalid_attrs)
    end

    test "update_char/2 with valid data updates the char" do
      char = char_fixture()
      assert {:ok, char} = Chars.update_char(char, @update_attrs)
      assert %Char{} = char
      assert char.level == 43
      assert char.name == "some updated name"
    end

    test "update_char/2 with invalid data returns error changeset" do
      char = char_fixture()
      assert {:error, %Ecto.Changeset{}} = Chars.update_char(char, @invalid_attrs)
      assert char == Chars.get_char!(char.id)
    end

    test "delete_char/1 deletes the char" do
      char = char_fixture()
      assert {:ok, %Chars{}} = Chars.delete_char(char)
      assert_raise Ecto.NoResultsError, fn -> Chars.get_char!(char.id) end
    end

    test "change_char/1 returns a char changeset" do
      char = char_fixture()
      assert %Ecto.Changeset{} = Chars.change_char(char)
    end
  end
end
