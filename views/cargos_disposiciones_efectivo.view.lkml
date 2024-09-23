view: cargos_disposiciones_efectivo {
  sql_table_name: broxelco_rdg.CargosDisposicionesEfectivo ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: autorizado {
    type: number
    sql: ${TABLE}.Autorizado ;;
  }
  dimension: autorizado_reverso {
    type: number
    sql: ${TABLE}.AutorizadoReverso ;;
  }
  dimension_group: fecha_hora_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraCreacion ;;
  }
  dimension_group: fecha_hora_reverso {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraReverso ;;
  }
  dimension: id_disposicion {
    type: number
    sql: ${TABLE}.IdDisposicion ;;
  }
  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.IdMovimiento ;;
  }
  dimension: id_reverso {
    type: number
    sql: ${TABLE}.IdReverso ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }
  dimension: num_autorizacion {
    type: string
    sql: ${TABLE}.NumAutorizacion ;;
  }
  dimension: num_autorizacion_reverso {
    type: string
    sql: ${TABLE}.NumAutorizacionReverso ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }
  dimension: num_tarjeta {
    type: string
    sql: ${TABLE}.NumTarjeta ;;
  }
  dimension: status {
    type: number
    sql: ${TABLE}.Status ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
