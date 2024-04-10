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

explore: remesas{}

explore: transacciones_pruebas {}

explore: programas_sociales_all {}

explore: cierres_credencial_usa {}

explore: matv09_auditorias {}

explore: edo_mex_pruebas {}

explore: distribucion_y_prediccion_de_las_vueltas {}

explore: comercios_cnbv {}

explore: datos_generales_dispositivos_2443 {}

explore: credito_yo_construyo {}

explore: filtros_grl12 {}

explore: estatus_creditos_construyo {}

explore: hv_03_comercios {}

explore: hv_03_liquidacion {}

explore: hv_03_spei {}

explore: hv_03_conciliacion {}

explore: reporte_semanal_transaccional {}

explore: rep_mujeres_con_bienestar {}

explore: hv_02_venta_por_comercio {}

explore: datos_financieros_1525 {}

explore: data_lineage {}

explore: programas_sociales_all_v2 {}

explore: comparacion_conciliacion {}

explore: presentaciones_ejecutivas_yy_v2 {}

explore: trsnacacciones {}

explore: presentaciones_ejecutivas_yy_v2_comercios {}

explore: estatus_transacciones_detalle_diario {}

explore: cierres_credencial_usa_agrupacion {}
