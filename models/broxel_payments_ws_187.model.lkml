connection: "broxelpaymentsws_187"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxelpaymentsws_187default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxelpaymentsws_187default_datagroup
