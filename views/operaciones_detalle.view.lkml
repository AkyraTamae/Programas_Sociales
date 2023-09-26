view: operaciones_detalle {
  sql_table_name: dbo.OperacionesDetalle ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension_group: fecha_actualizacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaActualizacion ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension: id_operacion {
    type: number
    sql: ${TABLE}.IdOperacion ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }
  dimension: observaciones {
    type: string
    sql: ${TABLE}.Observaciones ;;
  }
  dimension: procesador {
    type: number
    sql: ${TABLE}.Procesador ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
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
