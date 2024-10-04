connection: "broxel_dwh"

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

map_layer: edo_mex_layer {
  #file: "/mapas/map.json"
  file: "/Mapa/Edo_Mex.topojson"
  property_key: "mun_name"
}

explore: broxel_usa {}
explore: PV04_monitoreo_B2B {}
explore: clientes {}
explore: fondeos_mejoravit {}
explore: inactividad_de_cuentas {}
explore: hv_03_no_enrolados {}
explore: hv_03_errores {}
explore: hv_06_campanas_email {}
explore: hv_06_in_app {}
explore: hv_06_sms {}
explore: transacciones_mensual_all {}
explore: trsnacacciones {}
explore: hv_03_conciliacion {}
explore: comparacion_conciliacion {}
explore: astro_main {}
explore: cnbv_dispositivos {}
explore: cnbv_dispositivos_transaccion {}
explore: cnbv_comercios {}
explore: cnbv_comercios_transaccion {}
explore: cierres_credencial_usa {
  label: "GRL12: Cierres Financieros USA"
  join: cierres_credencial_usa_claveagrupacion {
    type: left_outer
    relationship: one_to_one
    sql_on: ${cierres_credencial_usa_claveagrupacion.clave_grupo_cliente} = ${cierres_credencial_usa.clave_grupo_cliente} ;;
  }
}
explore: estatus_creditos_construyo {}
explore: prueba_llamadas {}
