connection: "broxelpaymentsws_187"

include:"/views/HV_03_1.view.lkml"
include:"/views/HV_03_2.view.lkml"

explore: hv_03_1 {
  join: hv_03_2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${hv_03_2.comercio_2} = ${hv_03_1.comercio} ;;
  }
}
