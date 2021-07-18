defmodule AngotiaApiWeb.Schema.QuestTypes do
  use Absinthe.Schema.Notation

  alias AngotiaResourcesApiWeb.Resolvers

  object :quest do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :description, non_null(:string)
    field :level, non_null(:integer)
  end

  input_object :update_quest do
    field :title, :string
    field :description, :string
    field :level, :integer
  end

  object :quests_queries do
    field :all_quests, non_null(list_of(non_null(:quest))) do
      resolve &Resolvers.QuestsResolver.all_quests/3
    end

    field :get_quest, :quest do
      arg :id, non_null(:id)  
      
      resolve(&Resolvers.QuestsResolver.get_quest/3)
    end
  end

  object :quests_mutations do
    field :create_quest, type: :quest do
      arg :title, non_null(:string)
      arg :description, non_null(:string)
      arg :level, non_null(:integer)

      resolve(&Resolvers.QuestsResolver.create_quest/3)
    end

    field :update_quest, type: :quest do
      arg :id, non_null(:id)
      arg :quest, :update_quest

      resolve(&Resolvers.QuestsResolver.update_quest/3)
    end

    field :delete_quest, type: :quest do
      arg :id, non_null(:id)   
      
      resolve(&Resolvers.QuestsResolver.delete_quest/3)
    end
  end
end