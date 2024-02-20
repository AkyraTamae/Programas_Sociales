connection: "azurebi"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: programas_sociales_join_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: programas_sociales_join_default_datagroup


map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}

map_layer: edo_mex_layer {
  #file: "/mapas/map.json"
  file: "/Mapa/Edo_Mex.topojson"
  property_key: "mun_name"
}

explore: programas_sociales_all {
  join: transacciones_mensual_all {
    sql_on: ${programas_sociales_all.fecha_date} = ${transacciones_mensual_all.fecha_date}  ;;
    relationship: many_to_many
    type: left_outer
  }
}
