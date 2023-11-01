
view: transacciones_pruebas {
  derived_table: {
    sql: Select *
      From
        recursos.AnalisisClientes ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: importe_pesos {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Importe_Pesos ;;
  }

  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.Monto_Intercambio ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.Clasificacion_Cliente ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  dimension: fecha_primer_movimiento {
    type: date
    sql: ${TABLE}.FechaPrimerMovimiento ;;
  }

  dimension: fecha_ultimo_movimiento {
    type: date
    sql: ${TABLE}.FechaUltimoMovimiento ;;
  }

  dimension: ultimo_movimiento_mes_ant {
    type: date
    sql: ${TABLE}.UltimoMovimientoMesAnt ;;
  }

  dimension: dias_sin_uso {
    type: number
    sql: ${TABLE}.DiasSinUso ;;
  }

  dimension: fecha_min_pago {
    type: date
    sql: ${TABLE}.FechaMinPago ;;
  }

  dimension: fecha_max_pago {
    type: date
    sql: ${TABLE}.FechaMaxPago ;;
  }

  dimension: fecha_min_dispersion {
    type: date
    sql: ${TABLE}.FechaMinDispersion ;;
  }

  dimension: fecha_max_dispersion {
    type: date
    sql: ${TABLE}.FechaMaxDispersion ;;
  }

  dimension: fecha_min_transaccion {
    type: date
    sql: ${TABLE}.FechaMinTransaccion ;;
  }

  dimension: fecha_max_transaccion {
    type: date
    sql: ${TABLE}.FechaMaxTransaccion ;;
  }

  dimension: fecha_min_transferencia {
    type: date
    sql: ${TABLE}.FechaMinTransferencia ;;
  }

  dimension: fecha_max_transferencia {
    type: date
    sql: ${TABLE}.FechaMaxTransferencia ;;
  }

  dimension: fecha_min_c2_centrada {
    type: date
    sql: ${TABLE}.FechaMinC2CEntrada ;;
  }

  dimension: fecha_max_c2_centrada {
    type: date
    sql: ${TABLE}.FechaMaxC2CEntrada ;;
  }

  dimension: fecha_min_c2_csalida {
    type: date
    sql: ${TABLE}.FechaMinC2CSalida ;;
  }

  dimension: fecha_max_c2_csalida {
    type: date
    sql: ${TABLE}.FechaMaxC2CSalida ;;
  }

  dimension: estado {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Estado ;;
  }

  dimension: country_id {
    type: string
    sql: ${TABLE}.Country_Id ;;
  }

  set: detail {
    fields: [
        id,
  fecha,
  cuentas,
  transacciones,
  producto,
  clave_cliente,
  importe_pesos,
  monto_intercambio,
  comercio,
  clasificacion_cliente,
  tipo_movimiento,
  procesador,
  fecha_primer_movimiento,
  fecha_ultimo_movimiento,
  ultimo_movimiento_mes_ant,
  dias_sin_uso,
  fecha_min_pago,
  fecha_max_pago,
  fecha_min_dispersion,
  fecha_max_dispersion,
  fecha_min_transaccion,
  fecha_max_transaccion,
  fecha_min_transferencia,
  fecha_max_transferencia,
  fecha_min_c2_centrada,
  fecha_max_c2_centrada,
  fecha_min_c2_csalida,
  fecha_max_c2_csalida,
  estado,
  country_id
    ]
  }
}
