connection: "azuresqlbi"

# include all the views

include: "/views/**/*.view.lkml"

datagroup:  broxel_nexus_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxel_nexus_default_datagroup

map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}
