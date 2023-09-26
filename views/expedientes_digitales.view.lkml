view: expedientes_digitales {
  sql_table_name: dbo.ExpedientesDigitales ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: cobertura {
    type: string
    sql: ${TABLE}.Cobertura ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }
  dimension: estatus {
    type: string
    sql: ${TABLE}.Estatus ;;
  }
  dimension_group: fecha_hora_recepcion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraRecepcion ;;
  }
  dimension_group: fecha_hora_respuesta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraRespuesta ;;
  }
  dimension_group: fecha_recepcion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaRecepcion ;;
  }
  dimension_group: fecha_respuesta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaRespuesta ;;
  }
  dimension: motivo {
    type: string
    sql: ${TABLE}.Motivo ;;
  }
  dimension: motivo_limpo {
    type: string
    sql: ${TABLE}.MotivoLimpo ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: originador {
    type: string
    sql: ${TABLE}.Originador ;;
  }
  dimension: proveedor {
    type: string
    sql: ${TABLE}.Proveedor ;;
  }
  dimension: ubicacion {
    type: string
    sql: ${TABLE}.Ubicacion ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
