view: broxel_217_broxelcore_remesa {
  sql_table_name: dbo.Remesa ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: cuenta_destino {
    type: string
    sql: ${TABLE}.CuentaDestino ;;
  }
  dimension: cuenta_origen {
    type: string
    sql: ${TABLE}.CuentaOrigen ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaPago ;;
  }
  dimension: id_meltsan {
    type: number
    sql: ${TABLE}.IdMeltsan ;;
  }
  dimension: id_operacion {
    type: number
    sql: ${TABLE}.IdOperacion ;;
  }
  dimension: monto_mxn {
    type: number
    sql: ${TABLE}.MontoMXN ;;
  }
  dimension: observaciones {
    type: string
    sql: ${TABLE}.Observaciones ;;
  }
  dimension: on_hold {
    type: string
    sql: ${TABLE}.OnHold ;;
  }
  dimension: pago_realizado {
    type: string
    sql: ${TABLE}.PagoRealizado ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
