view: log_cargas {
  sql_table_name: dbo.LogCargas ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: inicio_fin {
    type: string
    sql: ${TABLE}.InicioFin ;;
  }
  dimension: nombre_tabla {
    type: string
    sql: ${TABLE}.NombreTabla ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
