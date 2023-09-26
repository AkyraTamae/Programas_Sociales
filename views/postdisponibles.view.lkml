view: postdisponibles {
  sql_table_name: dbo.Postdisponibles ;;

  dimension: column_0 {
    type: string
    sql: ${TABLE}."Column 0" ;;
  }
  dimension: column_1 {
    type: string
    sql: ${TABLE}."Column 1" ;;
  }
  measure: count {
    type: count
  }
}
