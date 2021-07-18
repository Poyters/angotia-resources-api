defmodule AngotiaResourcesApi.Chars do
  import Ecto.Query, warn: false
  alias AngotiaResourcesApi.Repo

  alias AngotiaResourcesApi.Chars.Char

  def list_chars do
    Repo.all(Char)
  end

  def get_char(id) do
    char = Repo.get(Char, id)

    if char, do: {:ok, char}, else: {:error, "Cannot find Char by id #{id}"}
  end

  # Available char types: npc, mob, se
  def get_chars_by_type(type) do
    query = from char in Char,
      where: ilike(char.type, ^type)

    Repo.all(query)
  end

  def create_char(attrs \\ %{}) do
    %Char{}
    |> Char.changeset(attrs)
    |> Repo.insert()
  end

  def update_char(%Char{} = char, attrs) do
    char
    |> Char.changeset(attrs)
    |> Repo.update()
  end

  def delete_char(id) do
    char = get_char(id)

    case char do
      {:error, _mess} -> char
      _ -> Repo.delete(elem(char, 1))
    end
  end

  def change_char(%Char{} = char) do
    Char.changeset(char, %{})
  end
end
