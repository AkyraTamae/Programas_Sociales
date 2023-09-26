view: respaldo_cierre_transacciones07072023 {
  sql_table_name: dbo.RespaldoCierreTransacciones07072023 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.ClasificacionCliente ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.MontoIntercambio ;;
  }
  dimension: operaciones {
    type: number
    sql: ${TABLE}.Operaciones ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
