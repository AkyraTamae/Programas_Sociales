view: alertas_tableros {
  derived_table: {
    sql: SELECT
          *
        FROM
          `mgcp-10078073-bxl-bi-snd.BIOro.AlertasTableros`
        WHERE
          FechaInsercion = CURRENT_DATE('America/Mexico_City') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.table_schema ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: table_schema_key {
    type: string
    sql: ${TABLE}.table_schema_key ;;
  }

  dimension: full_table_name {
    order_by_field: updated_at_date
    type: string
    sql: ${TABLE}.full_table_name ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: datetime
    sql: ${TABLE}.updated_at ;;
  }

  dimension: total_rows {
    type: number
    sql: ${TABLE}.total_rows ;;
  }

  dimension: total_registros_previo {
    type: number
    sql: ${TABLE}.TotalRegistrosPrevio ;;
  }

  dimension: az_registros_actual {
    type: number
    sql: ${TABLE}.Az_Registros_Actual ;;
  }

  dimension: az_registros_previo {
    type: number
    sql: ${TABLE}.Az_Registros_Previo ;;
  }

  dimension: alerta {
    type: string
    sql: ${TABLE}.Alerta ;;
  }

  dimension_group: fecha_corte {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: datetime
    sql: ${TABLE}.Az_Fecha_Corte ;;
  }

  dimension: fecha_corte_txt {
    type: string
    order_by_field: fecha_corte_month
    sql: ${TABLE}.FechaCorte ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  set: detail {
    fields: [
      project_id,
      table_schema,
      table_name,
      table_schema_key,
      full_table_name,
      total_rows,
      total_registros_previo,
      az_registros_actual,
      az_registros_previo,
      alerta
    ]
  }
}
