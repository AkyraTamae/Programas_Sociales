connection: "biplata"


# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxel_dwh_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxel_dwh_default_datagroup

map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}

explore: vl_02 {
  join: vl_02_fix {
    sql_on: ${vl_02.folio_de_reembolso} = ${vl_02_fix.folio_de_reembolso}  ;;
    relationship: one_to_many
    type: left_outer # Could be excluded since left_outer is the default
  }
}

explore: grl08_liquidacion_comercios {}

explore: daily_tracking {}
explore: rep_datos_financieros1525 {}
explore: programas_sociales_all {}
explore: reporte_semanal_transaccional {}
explore: alertas_programas_transacciones_por_dia {}
explore: alertas_programas_transacciones_por_hora {}
explore: programas_transacciones_rechazadas_por_hora {}
explore: daily_tracking_v2_bq {}
explore: reporte_audios {}
explore: alertas_tableros {}
