view: apuestas {
  sql_table_name: dbo.Apuestas ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: empate {
    type: number
    sql: ${TABLE}.Empate ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: id_jornada {
    type: number
    sql: ${TABLE}.IdJornada ;;
  }
  dimension: id_usuario {
    type: number
    sql: ${TABLE}.IdUsuario ;;
  }
  dimension: local {
    type: number
    sql: ${TABLE}.Local ;;
  }
  dimension: tipo_apuesta {
    type: number
    sql: ${TABLE}.TipoApuesta ;;
  }
  dimension: visita {
    type: number
    sql: ${TABLE}.Visita ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
