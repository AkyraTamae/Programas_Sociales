view: base_hv {
  sql_table_name: dbo.baseHV ;;

  dimension_group: fecha_base {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaBase ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.numCuenta ;;
  }
  measure: count {
    type: count
  }
}
