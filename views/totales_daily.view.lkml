view: totales_daily {
  sql_table_name: dbo.Totales_Daily ;;

  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }
  measure: count {
    type: count
  }
}
