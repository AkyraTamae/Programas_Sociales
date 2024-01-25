connection: "biplata"


# include all the views
include: "/views/**/*.view.lkml"

datagroup: broxel_dwh_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: broxel_dwh_default_datagroup

explore: vl_02 {
  join: vl_02_fix {
    sql_on: ${vl_02.folio_de_reembolso} = ${vl_02_fix.folio_de_reembolso}  ;;
    relationship: one_to_many
    type: left_outer # Could be excluded since left_outer is the default
  }
}
