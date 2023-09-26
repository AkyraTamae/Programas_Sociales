view: au_xavaya2023 {
  sql_table_name: dbo.AuXAvaya2023 ;;

  dimension: administrativo {
    type: number
    sql: ${TABLE}.Administrativo ;;
  }
  dimension: aux1099 {
    type: number
    sql: ${TABLE}.Aux1099 ;;
  }
  dimension: break {
    type: number
    sql: ${TABLE}."Break" ;;
  }
  dimension: capacitacion {
    type: number
    sql: ${TABLE}.Capacitacion ;;
  }
  dimension: comida {
    type: number
    sql: ${TABLE}.Comida ;;
  }
  dimension: evaluacion {
    type: number
    sql: ${TABLE}.Evaluacion ;;
  }
  dimension: ext {
    type: number
    sql: ${TABLE}.EXT ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: medico {
    type: number
    sql: ${TABLE}.Medico ;;
  }
  dimension: monitoreo {
    type: number
    sql: ${TABLE}.Monitoreo ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: sanitario {
    type: number
    sql: ${TABLE}.Sanitario ;;
  }
  dimension: supervisor {
    type: number
    sql: ${TABLE}.Supervisor ;;
  }
  dimension: tiempo0 {
    type: number
    sql: ${TABLE}.Tiempo0 ;;
  }
  dimension: tiempo_aux {
    type: number
    sql: ${TABLE}.Tiempo_Aux ;;
  }
  dimension: tiempo_conexion {
    type: number
    sql: ${TABLE}.Tiempo_Conexion ;;
  }
  measure: count {
    type: count
  }
}
