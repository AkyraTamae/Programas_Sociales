view: cuenta_pickit {
  sql_table_name: dbo.Cuenta_Pickit ;;

  dimension: num_cnt_pickit {
    type: string
    sql: ${TABLE}.Num_Cnt_Pickit ;;
  }
  measure: count {
    type: count
  }
}
