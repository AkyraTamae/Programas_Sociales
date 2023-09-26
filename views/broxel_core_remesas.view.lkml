view: broxel_core_remesas {
  sql_table_name: dbo.BroxelCoreRemesas ;;
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
    type: number
    sql: ${TABLE}.OnHold ;;
  }
  dimension: pago_realizado {
    type: number
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
