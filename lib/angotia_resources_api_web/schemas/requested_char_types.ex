defmodule AngotiaResourcesApiWeb.Schema.RequestedCharTypes do
  use Absinthe.Schema.Notation

  alias AngotiaResourcesApiWeb.Resolvers

  object :requested_char do
    field :id, non_null(:id)
    field :_id, non_null(:string)
    field :name, non_null(:string)
    field :author, :string
    field :updated_at, :naive_datetime
    field :inserted_at, :naive_datetime
    field :field_diameter, non_null(:integer)
    field :move_type, :string
    field :type, non_null(:string)
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :requested_statistics
    field :settings, :requested_settings
    field :monologs, list_of(:requested_monolog)
    field :dialogs, list_of(:requested_dialog)
  end

  input_object :update_requested_char do
    field :name, :string
    field :field_diameter, :integer
    field :move_type, :string
    field :type, :string
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :input_requested_statistics
    field :settings, :input_requested_settings
    field :monologs, list_of(:input_requested_monolog)
    field :dialogs, list_of(:input_requested_dialog)
  end

  input_object :input_requested_char do
    field :_id, :string
    field :author, :string
    field :name, :string
    field :field_diameter, :integer
    field :move_type, :string
    field :type, :string
    field :has_visible_level, :boolean
    field :char_pic, :string
    field :mob_range, :string
    field :is_mob_aggressive, :boolean
    field :statistics, :input_requested_statistics
    field :settings, :input_requested_settings
    field :monologs, list_of(:input_requested_monolog)
    field :dialogs, list_of(:input_requested_dialog)
  end

  object :requested_statistics do
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

  input_object :input_requested_statistics do
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

  object :requested_settings do
    field :time_of_occurance, non_null(:requested_time_of_occurance)
    field :resp_time, non_null(:requested_resp_time)
  end

  input_object :input_requested_settings do
    field :time_of_occurance, non_null(:input_requested_time_of_occurance)
    field :resp_time, non_null(:input_requested_resp_time)
  end

  object :requested_time_of_occurance do
    field :min, :integer
    field :max, :integer
  end

  input_object :input_requested_time_of_occurance do
    field :min, :integer
    field :max, :integer
  end

  object :requested_resp_time do
    field :min, :integer
    field :max, :integer
  end

  input_object :input_requested_resp_time do
    field :min, :integer
    field :max, :integer
  end

  object :requested_monolog do
    field :_id, :string
    field :content, :string
  end

  input_object :input_requested_monolog do
    field :_id, :string
    field :content, :string
  end

  object :requested_dialog do
    field :_id, :string
    field :npc, :string
    field :player, list_of(:player)
  end

  input_object :input_requested_dialog do
    field :_id, :string
    field :npc, :string
    field :player, list_of(:input_requested_player)
  end

  object :requested_player do
    field :_id, :string
    field :dialog, :string
    field :action, :string
    field :condition, :string
    field :next, :string
  end

  input_object :input_requested_player do
    field :_id, :string
    field :dialog, :string
    field :action, :string
    field :condition, :string
    field :next, :string
  end

  object :requested_chars_queries do
    field :all_requested_chars, non_null(list_of(non_null(:requested_char))) do
      resolve &Resolvers.RequestedCharsResolver.all_requested_chars/3
    end

    field :get_requested_char, :requested_char do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedCharsResolver.get_requested_char/3)
    end

    field :get_requested_chars_by_type, non_null(list_of(non_null(:requested_char))) do
      arg :type, non_null(:string)

      resolve(&Resolvers.RequestedCharsResolver.get_requested_chars_by_type/3)
    end

    field :get_requested_chars_by_author, non_null(list_of(non_null(:requested_char))) do
      arg :author_id, non_null(:string)

      resolve(&Resolvers.RequestedCharsResolver.get_requested_chars_by_author/3)
    end
  end

  object :requested_chars_mutations do
    field :create_requested_char, type: :requested_char do
      arg :char, :input_requested_char

      resolve(&Resolvers.RequestedCharsResolver.create_requested_char/3)
    end

    field :update_requested_char, type: :requested_char do
      arg :id, non_null(:id)
      arg :char, :update_requested_char

      resolve(&Resolvers.RequestedCharsResolver.update_requested_char/3)
    end

    field :delete_requested_char, type: :requested_char do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedCharsResolver.delete_requested_char/3)
    end

    field :accept_requested_char, type: :requested_char do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedCharsResolver.accept_requested_char/3)
    end
  end
end
