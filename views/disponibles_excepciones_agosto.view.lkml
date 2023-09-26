view: disponibles_excepciones_agosto {
  sql_table_name: dbo.DisponiblesExcepcionesAgosto ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: disponible {
    type: number
    sql: ${TABLE}.Disponible ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: limite_credito {
    type: number
    sql: ${TABLE}.LimiteCredito ;;
  }
  dimension: monto_usado {
    type: number
    sql: ${TABLE}.MontoUsado ;;
  }
  dimension: pendiente_de_pago {
    type: number
    sql: ${TABLE}.PendienteDePago ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
