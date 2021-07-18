defmodule AngotiaResourcesApi.RequestedChars do
  import Ecto.Query, warn: false
  alias AngotiaResourcesApi.Repo

  alias AngotiaResourcesApi.RequestedChars.Char, as: RChar
  alias AngotiaResourcesApi.Chars.Char

  def list_chars do
    Repo.all(RChar)
  end

  def get_char(id) do
    char = Repo.get(RChar, id)

    if char, do: {:ok, char}, else: {:error, "Cannot find Requested Char by id #{id}"}
  end

  def accept_char(id) do
    char = get_char(id)

    case char do
      {:error, _mess} -> char
      _ -> push_to_prod(char, id)
    end
  end

  defp push_to_prod(char, id) do
    req_char = elem(char, 1)
    prod_char = req_char
      |> Map.delete(:__meta__)
      |> Map.delete(:author)
      |> Map.delete(:id)
      |> Struct.to_map
      |> Map.from_struct

    delete_char id

    %Char{}
      |> Char.changeset(prod_char)
      |> Repo.insert()
  end

  # Available char types: npc, mob, se
  def get_chars_by_type(type) do
    query = from char in RChar,
      where: ilike(char.type, ^type)

    Repo.all(query)
  end

  def get_chars_by_author(author_id) do
    query = from char in RChar,
      where: ilike(char.author, ^author_id)

    Repo.all(query)
  end

  def create_char(attrs \\ %{}) do
    %RChar{}
    |> RChar.changeset(attrs)
    |> Repo.insert()
  end

  def update_char(%RChar{} = char, attrs) do
    char
    |> RChar.changeset(attrs)
    |> Repo.update()
  end

  def delete_char(id) do
    char = get_char(id)

    case char do
      {:error, _mess} -> char
      _ -> Repo.delete(elem(char, 1))
    end
  end

  def change_char(%RChar{} = char) do
    RChar.changeset(char, %{})
  end
end
