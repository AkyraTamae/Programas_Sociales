connection: "biplata"


# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxel_dwh_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxel_dwh_default_datagroup

explore: vl02 {}
