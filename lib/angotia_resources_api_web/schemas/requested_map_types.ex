defmodule AngotiaResourcesApiWeb.Schema.RequestedMapTypes do
  use Absinthe.Schema.Notation

  alias AngotiaResourcesApiWeb.Resolvers

  object :requested_map do
    field :id, non_null(:id)
    field :description, :string
    field :author, :string
    field :updated_at, :naive_datetime
    field :inserted_at, :naive_datetime
    field :min_entry_level, non_null(:integer)
    field :combined_layers_blob, non_null(:string)
    field :visibility_range, non_null(:integer)
    field :size, non_null(:requested_size)
    field :_id, non_null(:string)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:requested_passage)
    field :building, non_null(:requested_building)
    field :decoration, non_null(:requested_decoration)
    field :terrain, non_null(:requested_terrain)
    field :npc, non_null(:requested_npc)
    field :mob, non_null(:requested_mob)
    field :se, non_null(:requested_se)
    field :block_matrix, non_null(:requested_block)
    field :vertex, non_null(:requested_vertex)
  end

  input_object :input_requested_map do
    field :author, :string
    field :description, :string
    field :min_entry_level, non_null(:integer)
    field :combined_layers_blob, non_null(:string)
    field :visibility_range, non_null(:integer)
    field :size, non_null(:input_requested_size)
    field :_id, non_null(:string)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:input_requested_passage)
    field :building, non_null(:input_requested_building)
    field :decoration, non_null(:input_requested_decoration)
    field :terrain, non_null(:input_requested_terrain)
    field :npc, non_null(:input_requested_npc)
    field :mob, non_null(:input_requested_mob)
    field :se, non_null(:input_requested_se)
    field :block_matrix, non_null(:input_requested_block)
    field :vertex, non_null(:input_requested_vertex)
  end

  input_object :update_requested_map do
    field :description, :string
    field :min_entry_level, non_null(:integer)
    field :combined_layers_blob, non_null(:string)
    field :visibility_range, non_null(:integer)
    field :size, non_null(:input_requested_size)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:input_requested_passage)
    field :building, non_null(:input_requested_building)
    field :decoration, non_null(:input_requested_decoration)
    field :terrain, non_null(:input_requested_terrain)
    field :npc, non_null(:input_requested_npc)
    field :mob, non_null(:input_requested_mob)
    field :se, non_null(:input_requested_se)
    field :block_matrix, non_null(:input_requested_block)
    field :vertex, non_null(:input_requested_vertex)
  end

  object :requested_size do
    field :x, non_null(:integer)
    field :y, non_null(:integer)
  end

  input_object :input_requested_size do
    field :x, non_null(:integer)
    field :y, non_null(:integer)
  end

  object :requested_passage do
    field :locations, list_of(:requested_location)
  end

  input_object :input_requested_passage do
    field :locations, list_of(:input_location)
  end

  object :requested_location do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :destination, non_null(:requested_destination)
  end

  input_object :input_requested_location do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :destination, non_null(:input_requested_destination)
  end

  object :requested_destination do
    field :map_target_id, :integer
    field :map_target_cords, :integer
  end

  input_object :input_requested_destination do
    field :map_target_id, :integer
    field :map_target_cords, :integer
  end

  object :requested_item do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :value, :string
  end

  input_object :input_requested_item do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :value, :string
  end

  object :requested_picture do
    field :_id, :string
    field :blob, :string
  end

  input_object :input_requested_picture do
    field :_id, :string
    field :blob, :string
  end

  object :requested_building do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_building do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_decoration do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_decoration do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_terrain do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_terrain do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_npc do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_npc do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_mob do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_mob do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_se do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_se do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_block do
    field :items, list_of(:requested_item)
    field :pics, list_of(:requested_picture)
  end

  input_object :input_requested_block do
    field :items, list_of(:input_requested_item)
    field :pics, list_of(:input_requested_picture)
  end

  object :requested_vertex do
    field :weights, list_of(:requested_weight)
  end

  input_object :input_requested_vertex do
    field :weights, list_of(:input_requested_weight)
  end

  object :requested_weight do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :weight, :integer
  end

  input_object :input_requested_weight do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :weight, :integer
  end

  object :requested_maps_queries do
    field :all_requested_maps, non_null(list_of(non_null(:requested_map))) do
      resolve &Resolvers.RequestedMapsResolver.all_requested_maps/3
    end

    field :get_requested_map, :requested_map do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedMapsResolver.get_requested_map/3)
    end

    field :get_requested_maps_by_author, non_null(list_of(non_null(:requested_map))) do
      arg :author_id, non_null(:string)

      resolve(&Resolvers.RequestedMapsResolver.get_requested_maps_by_author/3)
    end
  end

  object :requested_maps_mutations do
    field :create_requested_map, type: :requested_map do
      arg :map, :input_requested_map

      resolve(&Resolvers.RequestedMapsResolver.create_requested_map/3)
    end

    field :update_requested_map, type: :requested_map do
      arg :id, non_null(:id)
      arg :map, :update_requested_map

      resolve(&Resolvers.RequestedMapsResolver.update_requested_map/3)
    end

    field :delete_requested_map, type: :requested_map do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedMapsResolver.delete_requested_map/3)
    end

    field :accept_requested_map, type: :requested_map do
      arg :id, non_null(:id)

      resolve(&Resolvers.RequestedMapsResolver.accept_requested_map/3)
    end
  end
end
