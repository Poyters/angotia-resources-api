defmodule AngotiaResourcesApiWeb.Resolvers.QuestsResolver do
  alias AngotiaResourcesApi.Quests
  alias AngotiaResourcesApi.Repo

  def all_quests(_parent, _args, _info) do
    {:ok, Quests.list_quests()}
  end

  def get_quest(_parent, %{id: id}, _info) do
    {:ok, Quests.get_quest!(id)}
  end

  def create_quest(_parent, args, _resolutions) do
    Quests.create_quest(args)
  end

  def update_quest(_parent, %{id: id, quest: quest_args}, _context) do
    quest = Repo.get(Quests.Quest, id)

    if quest, do: Quests.update_quest(quest, quest_args), else: {:error, "Cannot find quest by id: #{id}"}
  end

  def delete_quest(_parent, %{id: id}, _info) do
    quest = Repo.get(Quests.Quest, id)

    if quest, do: Quests.delete_quest(quest), else: {:error, "Cannot find quest by id: #{id}"}
  end
end