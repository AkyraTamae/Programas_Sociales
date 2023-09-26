view: con_inter_becas {
  sql_table_name: dbo.ConInter_BECAS ;;

  dimension: consumo {
    type: number
    sql: ${TABLE}.Consumo ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: intercambio {
    type: number
    sql: ${TABLE}.Intercambio ;;
  }
  measure: count {
    type: count
  }
}
