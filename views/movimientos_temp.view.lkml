view: movimientos_temp {
  sql_table_name: dbo.MovimientosTemp ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  measure: count {
    type: count
  }
}
