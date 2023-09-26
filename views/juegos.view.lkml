view: juegos {
  sql_table_name: dbo.Juegos ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: equipo_local {
    type: string
    sql: ${TABLE}.EquipoLocal ;;
  }
  dimension: equipo_visita {
    type: string
    sql: ${TABLE}.EquipoVisita ;;
  }
  dimension_group: fecha_juego {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaJuego ;;
  }
  dimension: id_jornada {
    type: number
    sql: ${TABLE}.IdJornada ;;
  }
  dimension: tipo {
    type: number
    sql: ${TABLE}.Tipo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
