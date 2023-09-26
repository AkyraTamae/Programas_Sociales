view: pagos_temp {
  sql_table_name: dbo.PagosTemp ;;

  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }
  measure: count {
    type: count
  }
}
