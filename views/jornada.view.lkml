view: jornada {
  sql_table_name: dbo.Jornada ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: descripcion_jornada {
    type: string
    sql: ${TABLE}.DescripcionJornada ;;
  }
  dimension_group: fecha_fin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaFin ;;
  }
  dimension_group: fecha_inicio {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaInicio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
