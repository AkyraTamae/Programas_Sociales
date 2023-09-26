view: embozos_ps {
  sql_table_name: dbo.Embozos_PS ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."año" ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.cuentas ;;
  }
  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.estado_operativo ;;
  }
  dimension_group: fechas {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fechas ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.mes ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  dimension: programa {
    type: string
    sql: ${TABLE}.programa ;;
  }
  dimension: tipocuenta {
    type: string
    sql: ${TABLE}.tipocuenta ;;
  }
  measure: count {
    type: count
  }
}
