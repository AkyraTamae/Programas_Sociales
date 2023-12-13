connection: "broxelpaymentsws_187"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxel_payments_ws_187_default_datagroup  {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: broxel_payments_ws_187_default_datagroup

explore: hv_03_1 {
  join: hv_03_2 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${hv_03_1.comercio} = ${hv_03_2.comercio_2} ;;
  }
}
