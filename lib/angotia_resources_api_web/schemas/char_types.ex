defmodule AngotiaResourcesApiWeb.Schema.CharTypes do
  use Absinthe.Schema.Notation

  alias AngotiaResourcesApiWeb.Resolvers

  object :char do
    field :id, non_null(:id)
    field :_id, non_null(:string)
    field :name, non_null(:string)
    field :field_diameter, non_null(:integer)
    field :move_type, :string
    field :type, non_null(:string)
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :statistics
    field :settings, :settings
    field :monologs, list_of(:monolog)
    field :dialogs, list_of(:dialog)
  end

  input_object :update_char do
    field :name, :string
    field :field_diameter, :integer
    field :move_type, :string
    field :type, :string
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :input_statistics
    field :settings, :input_settings
    field :monologs, list_of(:input_monolog)
    field :dialogs, list_of(:input_dialog)
  end

  input_object :input_char do
    field :_id, :string
    field :name, :string
    field :field_diameter, :integer
    field :move_type, :string
    field :type, :string
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :input_statistics
    field :settings, :input_settings
    field :monologs, list_of(:input_monolog)
    field :dialogs, list_of(:input_dialog)
  end

  object :statistics do
    field :level, :integer
    field :health, :integer
    field :attack, :integer
    field :defence, :integer
    field :strength, :integer
    field :dexterity, :integer
    field :inteligence, :integer
    field :jink, :integer
    field :speed, :integer
    field :attack_range, :integer
    field :attack_speed, :integer
  end

  input_object :input_statistics do
    field :level, :integer
    field :health, :integer
    field :attack, :integer
    field :defence, :integer
    field :strength, :integer
    field :dexterity, :integer
    field :inteligence, :integer
    field :jink, :integer
    field :speed, :integer
    field :attack_range, :integer
    field :attack_speed, :integer
  end

  object :settings do
    field :time_of_occurance, non_null(:time_of_occurance)
    field :resp_time, non_null(:resp_time)
  end

  input_object :input_settings do
    field :time_of_occurance, non_null(:input_time_of_occurance)
    field :resp_time, non_null(:input_resp_time)
  end

  object :time_of_occurance do
    field :min, :integer
    field :max, :integer
  end

  input_object :input_time_of_occurance do
    field :min, :integer
    field :max, :integer
  end

  object :resp_time do
    field :min, :integer
    field :max, :integer
  end

  input_object :input_resp_time do
    field :min, :integer
    field :max, :integer
  end

  object :monolog do
    field :_id, :string
    field :content, :string
  end

  input_object :input_monolog do
    field :_id, :string
    field :content, :string
  end

  object :dialog do
    field :_id, :string
    field :npc, :string
    field :player, list_of(:player)
  end

  input_object :input_dialog do
    field :_id, :string
    field :npc, :string
    field :player, list_of(:input_player)
  end

  object :player do
    field :_id, :string
    field :dialog, :string
    field :action, :string
    field :condition, :string
    field :next, :string
  end

  input_object :input_player do
    field :_id, :string
    field :dialog, :string
    field :action, :string
    field :condition, :string
    field :next, :string
  end

  object :chars_queries do
    field :all_chars, non_null(list_of(non_null(:char))) do
      resolve &Resolvers.CharsResolver.all_chars/3
    end

    field :get_char, :char do
      arg :id, non_null(:id)

      resolve(&Resolvers.CharsResolver.get_char/3)
    end

    field :get_chars_by_type, non_null(list_of(non_null(:char))) do
      arg :type, non_null(:string)

      resolve(&Resolvers.CharsResolver.get_chars_by_type/3)
    end
  end

  object :chars_mutations do
    field :create_char, type: :char do
      arg :char, :input_char

      resolve(&Resolvers.CharsResolver.create_char/3)
    end

    field :update_char, type: :char do
      arg :id, non_null(:id)
      arg :char, :update_char

      resolve(&Resolvers.CharsResolver.update_char/3)
    end

    field :delete_char, type: :char do
      arg :id, non_null(:id)

      resolve(&Resolvers.CharsResolver.delete_char/3)
    end
  end
end
