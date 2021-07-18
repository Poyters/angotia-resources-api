defmodule AngotiaResourcesApiWeb.Schema.MapTypes do
  use Absinthe.Schema.Notation

  alias AngotiaResourcesApiWeb.Resolvers

  object :map do
    field :id, non_null(:id)
    field :description, :string
    field :combined_layers_blob, non_null(:string)
    field :min_entry_level, non_null(:integer)
    field :visibility_range, non_null(:integer)
    field :size, non_null(:size)
    field :_id, non_null(:string)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:passage)
    field :building, non_null(:building)
    field :decoration, non_null(:decoration)
    field :terrain, non_null(:terrain)
    field :npc, non_null(:npc)
    field :mob, non_null(:mob)
    field :se, non_null(:se)
    field :block_matrix, non_null(:block)
    field :vertex, non_null(:vertex)
  end

  input_object :input_map do
    field :description, :string
    field :min_entry_level, non_null(:integer)
    field :visibility_range, non_null(:integer)
    field :combined_layers_blob, non_null(:string)
    field :size, non_null(:input_size)
    field :_id, non_null(:string)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:input_passage)
    field :building, non_null(:input_building)
    field :decoration, non_null(:input_decoration)
    field :terrain, non_null(:input_terrain)
    field :npc, non_null(:input_npc)
    field :mob, non_null(:input_mob)
    field :se, non_null(:input_se)
    field :block_matrix, non_null(:input_block)
    field :vertex, non_null(:input_vertex)
  end

  input_object :update_map do
    field :description, :string
    field :min_entry_level, non_null(:integer)
    field :combined_layers_blob, non_null(:string)
    field :visibility_range, non_null(:integer)
    field :size, non_null(:input_size)
    field :map_name, non_null(:string)
    field :map_pic, :string
    field :passage, non_null(:input_passage)
    field :building, non_null(:input_building)
    field :decoration, non_null(:input_decoration)
    field :terrain, non_null(:input_terrain)
    field :npc, non_null(:input_npc)
    field :mob, non_null(:input_mob)
    field :se, non_null(:input_se)
    field :block_matrix, non_null(:input_block)
    field :vertex, non_null(:input_vertex)
  end

  object :size do
    field :x, non_null(:integer)
    field :y, non_null(:integer)
  end

  input_object :input_size do
    field :x, non_null(:integer)
    field :y, non_null(:integer)
  end

  object :passage do
    field :locations, list_of(:location)
  end

  input_object :input_passage do
    field :locations, list_of(:input_location)
  end

  object :location do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :destination, non_null(:destination)
  end

  input_object :input_location do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :destination, non_null(:input_destination)
  end

  object :destination do
    field :map_target_id, :integer
    field :map_target_cords, :integer
  end

  input_object :input_destination do
    field :map_target_id, :integer
    field :map_target_cords, :integer
  end

  object :item do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :value, :string
  end

  input_object :input_item do
    field :x, :integer
    field :y, :integer
    field :x_shift, :integer
    field :y_shift, :integer
    field :value, :string
  end

  object :picture do
    field :_id, :string
    field :blob, :string
  end

  input_object :input_picture do
    field :_id, :string
    field :blob, :string
  end

  object :building do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_building do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :decoration do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_decoration do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :terrain do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_terrain do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :npc do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_npc do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :mob do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_mob do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :se do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_se do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :block do
    field :items, list_of(:item)
    field :pics, list_of(:picture)
  end

  input_object :input_block do
    field :items, list_of(:input_item)
    field :pics, list_of(:input_picture)
  end

  object :vertex do
    field :weights, list_of(:weight)
  end

  input_object :input_vertex do
    field :weights, list_of(:input_weight)
  end

  object :weight do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :weight, :integer
  end

  input_object :input_weight do
    field :x, :integer
    field :y, :integer
    field :_id, :string
    field :x_shift, :integer
    field :y_shift, :integer
    field :weight, :integer
  end

  object :maps_queries do
    field :all_maps, non_null(list_of(non_null(:map))) do
      resolve &Resolvers.MapsResolver.all_maps/3
    end

    field :get_map, :map do
      arg :id, non_null(:id)

      resolve(&Resolvers.MapsResolver.get_map/3)
    end
  end

  object :maps_mutations do
    field :create_map, type: :map do
      arg :map, :input_map

      resolve(&Resolvers.MapsResolver.create_map/3)
    end

    field :update_map, type: :map do
      arg :id, non_null(:id)
      arg :map, :update_map

      resolve(&Resolvers.MapsResolver.update_map/3)
    end

    field :delete_map, type: :map do
      arg :id, non_null(:id)

      resolve(&Resolvers.MapsResolver.delete_map/3)
    end
  end
end
