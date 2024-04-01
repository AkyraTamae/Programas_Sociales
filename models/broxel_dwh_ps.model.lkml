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
