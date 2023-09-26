view: att_view {
  sql_table_name: dbo.att_view ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension_group: fecha_primer_movimiento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaPrimerMovimiento ;;
  }
  dimension_group: fecha_ultimo_movimiento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaUltimoMovimiento ;;
  }
  dimension: monto_max {
    type: number
    sql: ${TABLE}.MontoMax ;;
  }
  dimension: monto_total_entradas {
    type: number
    sql: ${TABLE}.MontoTotalEntradas ;;
  }
  dimension: monto_total_salidas {
    type: number
    sql: ${TABLE}.MontoTotalSalidas ;;
  }
  dimension: movientos {
    type: number
    sql: ${TABLE}.Movientos ;;
  }
  measure: count {
    type: count
  }
}
