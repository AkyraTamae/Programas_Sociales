connection: "azurebi"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: programas_sociales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: programas_sociales_default_datagroup


map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}

map_layer: edo_mex_layer {
  #file: "/mapas/map.json"
  file: "/Mapa/Edo_Mex.topojson"
  property_key: "mun_name"
}

map_layer: united_states_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_USA.topojson"
  property_key: "name"
}

explore: remesas{}
explore: programas_sociales_all {}
explore: matv09_auditorias {}
explore: distribucion_y_prediccion_de_las_vueltas {}
explore: comercios_cnbv {}
explore: datos_generales_dispositivos_2443 {}
explore: credito_yo_construyo {}
explore: filtros_grl12 {}
explore: hv_03_comercios {}
explore: hv_03_liquidacion {}
explore: hv_03_spei {}
explore: reporte_semanal_transaccional {}
explore: rep_mujeres_con_bienestar {}
explore: hv_02_venta_por_comercio {}
explore: programas_sociales_all_v2 {}
explore: presentaciones_ejecutivas_yy_v2 {}
explore: presentaciones_ejecutivas_yy_v2_comercios {}
explore: estatus_transacciones_detalle_diario {}
explore: conteo_registro_tablas {}
explore: remittance_pathward {}
explore: daily_tracking_v2_az {}
explore: daily_tracking_productivo {} #Este se mantiene aca ya que es el conteo que proviene de servidores productivos de azure
