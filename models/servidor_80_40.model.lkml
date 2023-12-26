connection: "servidor_80_40"

include: "/views/*.view.lkml"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: servidor_80_40_default_datagroup  {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "20 hour"
}

persist_with: servidor_80_40_default_datagroup

explore: replica_fn_17 {}
