connection: "broxelpaymentsws_187"

include: "/views/*.view.lkml"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxelpaymentsws_187_default_datagroup  {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: broxelpaymentsws_187_default_datagroup

explore: hv_03_compras {}

explore: hv_03_consulta_personalizada {}
