connection: "multicanales"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: multicanales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: multicanales_default_datagroup

map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}

map_layer: edo_mex_layer {
  #file: "/mapas/map.json"
  file: "/Mapa/Edo_Mex.topojson"
  property_key: "mun_name"
}

explore: astro_main {
#  join: astro_destino {
#    sql_on: ${astro_main.agente_id} = ${astro_destino.key_id}  ;;
#    relationship: one_to_one
#    type: left_outer # Could be excluded since left_outer is the default
#  }
}
