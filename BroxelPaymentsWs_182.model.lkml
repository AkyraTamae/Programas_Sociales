connection: "broxelpaymentsws_187"

include: "/views/*.view.lkml"

datagroup: BroxelPaymentsWs_187_default_datagroupPaymentsWs_187_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
  }

persist_with: BroxelPaymentsWs_187_default_datagroupPaymentsWs_187_default_datagroup
