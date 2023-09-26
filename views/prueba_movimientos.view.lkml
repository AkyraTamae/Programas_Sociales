view: prueba_movimientos {
  sql_table_name: dbo.pruebaMovimientos ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }
  dimension_group: minfecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.minfecha ;;
  }
  measure: count {
    type: count
  }
}
