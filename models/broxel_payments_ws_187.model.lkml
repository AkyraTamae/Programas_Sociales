connection: "broxelpaymentsws_187"
connection: "azurebi"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxel_payments_ws_187_default_datagroup  {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: broxel_payments_ws_187_default_datagroup
