connection: "servidor217"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: servidor217_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: servidor217_default_datagroup

explore: hv_06_campanas_email {}
