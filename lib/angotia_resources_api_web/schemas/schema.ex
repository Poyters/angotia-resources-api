defmodule AngotiaResourcesApiWeb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types AngotiaResourcesApiWeb.Schema.MapTypes
  import_types AngotiaResourcesApiWeb.Schema.RequestedMapTypes
  import_types AngotiaResourcesApiWeb.Schema.CharTypes
  import_types AngotiaResourcesApiWeb.Schema.RequestedCharTypes

  query do
    import_fields(:maps_queries)
    import_fields(:requested_maps_queries)
    import_fields(:chars_queries)
    import_fields(:requested_chars_queries)
  end

  mutation do
    import_fields(:maps_mutations)
    import_fields(:requested_maps_mutations)
    import_fields(:chars_mutations)
    import_fields(:requested_chars_mutations)
  end

#   subscription do
#     import_fields(:news_subscriptions)
#   end
end