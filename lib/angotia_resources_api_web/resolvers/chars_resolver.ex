defmodule AngotiaResourcesApiWeb.Resolvers.CharsResolver do
  alias AngotiaResourcesApi.Chars
  alias AngotiaResourcesApi.Repo

  def all_chars(_parent, _args, _info) do
    {:ok, Chars.list_chars()}
  end

  def get_char(_parent, %{id: id}, _info) do
    Chars.get_char(id)
  end

  def get_chars_by_type(_parent, %{type: type}, _info) do
    {:ok, Chars.get_chars_by_type(type)}
  end

  def create_char(_parent, %{char: char_args}, _resolutions) do
    Chars.create_char(char_args)
  end

  def update_char(_parent, %{id: id, char: char_args}, _context) do
    char = Repo.get(Chars.Char, id)

    if char, do: Chars.update_char(char, char_args), else: {:error, "Cannot find char by id: #{id}"}
  end

  def delete_char(_parent, %{id: id}, _info) do
    Chars.delete_char(id)
  end
end