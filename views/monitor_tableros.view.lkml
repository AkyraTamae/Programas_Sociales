view: dashboard_time_spent {
  derived_table: {
    sql:
      SELECT
        history.user_id,
        history.dashboard_id,
        DATE(history.created_at) AS usage_date,
        MIN(history.created_at) AS first_interaction,
        MAX(history.created_at) AS last_interaction,
        -- Calcula la diferencia entre el último y primer clic
        TIMESTAMP_DIFF(MAX(history.created_at), MIN(history.created_at), MINUTE) AS time_spent_minutes
      FROM history
      WHERE history.dashboard_id IS NOT NULL
      GROUP BY 1, 2, 3
    ;;
  }

  dimension: user_id { type: number sql: ${TABLE}.user_id ;; }
  dimension: dashboard_id { type: string sql: ${TABLE}.dashboard_id ;; }

  dimension: time_spent_minutes {
    type: number
    sql: ${TABLE}.time_spent_minutes ;;
    description: "Tiempo en minutos desde la primera hasta la última interacción en el tablero ese día"
  }

  measure: average_time_spent {
    type: average
    sql: ${time_spent_minutes} ;;
    value_format_name: decimal_1
  }
}
