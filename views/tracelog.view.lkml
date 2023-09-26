view: tracelog {
  sql_table_name: dbo.tracelog ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: excepcion {
    type: string
    sql: ${TABLE}.Excepcion ;;
  }
  dimension_group: fecha_hora {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHora ;;
  }
  dimension: id_usuario {
    type: number
    sql: ${TABLE}.IdUsuario ;;
  }
  dimension: logger {
    type: string
    sql: ${TABLE}.Logger ;;
  }
  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }
  dimension: nivel {
    type: number
    sql: ${TABLE}.Nivel ;;
  }
  dimension: stack_trace {
    type: string
    sql: ${TABLE}.StackTrace ;;
  }
  dimension: titulo {
    type: string
    sql: ${TABLE}.Titulo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
