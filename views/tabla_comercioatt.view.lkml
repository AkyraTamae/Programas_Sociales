view: tabla_comercioatt {
  sql_table_name: dbo.TablaComercioatt ;;

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: inicial {
    type: string
    sql: ${TABLE}.Inicial ;;
  }
  dimension: movimientos {
    type: number
    sql: ${TABLE}.movimientos ;;
  }
  measure: count {
    type: count
  }
}
