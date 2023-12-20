connection: "servidor187"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: servidor187_default_datagroup  {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: servidor187_default_datagroup

explore: hv_03_no_enrolados {}
