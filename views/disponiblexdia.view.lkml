view: disponiblexdia {
  sql_table_name: dbo.disponiblexdia ;;

  dimension: disponible {
    type: number
    sql: ${TABLE}.disponible ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }
  measure: count {
    type: count
  }
}
