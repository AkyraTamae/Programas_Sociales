view: ivr_cc {
  sql_table_name: dbo.IVR_CC ;;

  dimension: activacion {
    type: string
    sql: ${TABLE}.Activacion ;;
  }
  dimension_group: fecha_simple {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaSimple ;;
  }
  dimension_group: hora {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Hora ;;
  }
  dimension: ivr {
    type: string
    sql: ${TABLE}.Ivr ;;
  }
  dimension: opcion_ivr {
    type: string
    sql: ${TABLE}.Opcion_Ivr ;;
  }
  dimension: saldo {
    type: string
    sql: ${TABLE}.Saldo ;;
  }
  dimension: tarjeta {
    type: number
    sql: ${TABLE}.Tarjeta ;;
  }
  dimension: telefono {
    type: number
    sql: ${TABLE}.Telefono ;;
  }
  measure: count {
    type: count
  }
}
