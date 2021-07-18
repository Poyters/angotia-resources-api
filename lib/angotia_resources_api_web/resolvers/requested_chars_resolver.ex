defmodule AngotiaResourcesApiWeb.Resolvers.RequestedCharsResolver do
  alias AngotiaResourcesApi.RequestedChars
  alias AngotiaResourcesApi.Repo

  def all_requested_chars(_parent, _args, _info) do
    {:ok, RequestedChars.list_chars()}
  end

  def get_requested_char(_parent, %{id: id}, _info) do
    RequestedChars.get_char(id)
  end

  def get_requested_chars_by_type(_parent, %{type: type}, _info) do
    {:ok, RequestedChars.get_chars_by_type(type)}
  end

  def get_requested_chars_by_author(_parent, %{author_id: author_id}, _info) do
    {:ok, RequestedChars.get_chars_by_author(author_id)}
  end

  def create_requested_char(_parent, %{char: char_args}, _resolutions) do
    RequestedChars.create_char(char_args)
  end

  def update_requested_char(_parent, %{id: id, char: char_args}, _context) do
    char = Repo.get(RequestedChars.Char, id)

    if char, do: RequestedChars.update_char(char, char_args), else: {:error, "Cannot find Requested Char by id: #{id}"}
  end

  def delete_requested_char(_parent, %{id: id}, _info) do
    RequestedChars.delete_char(id)
  end

  def accept_requested_char(_parent, %{id: id}, _info) do
    RequestedChars.accept_char(id)
  end
end