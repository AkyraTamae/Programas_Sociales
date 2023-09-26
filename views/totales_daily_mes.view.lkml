view: totales_daily_mes {
  sql_table_name: dbo.Totales_Daily_Mes ;;

  dimension: b2b {
    type: number
    sql: ${TABLE}.b2b ;;
  }
  dimension: b2c {
    type: number
    sql: ${TABLE}.b2c ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: repe {
    type: number
    sql: ${TABLE}.Repe ;;
  }
  measure: count {
    type: count
  }
}
