view: urgentes_galileo20221104 {
  sql_table_name: dbo.urgentesGalileo20221104 ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: monto_usd {
    type: number
    sql: ${TABLE}.montoUSD ;;
  }
  dimension: titular {
    type: string
    sql: ${TABLE}.titular ;;
  }
  measure: count {
    type: count
  }
}
