
view: acceso_cuentas {
  derived_table: {
    sql: Select
      From
        [recursos].[Acceso_cuentas] With (Nolock) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.Cliente ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: cuenta_madre {
    type: string
    sql: ${TABLE}.CuentaMadre ;;
  }

  dimension: limite_compras {
    type: number
    sql: ${TABLE}.LimiteCompras ;;
  }

  dimension: nivel_cuenta {
    type: number
    sql: ${TABLE}.NivelCuenta ;;
  }

  dimension: limite_credito {
    type: number
    sql: ${TABLE}.LimiteCredito ;;
  }

  dimension: titular {
    type: string
    sql: ${TABLE}.Titular ;;
  }

  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.EstadoOperativo ;;
  }

  dimension: disponible {
    type: number
    sql: ${TABLE}.Disponible ;;
  }

  dimension: fecha_disponible {
    type: date
    sql: ${TABLE}.FechaDisponible ;;
  }

  dimension: fecha_alta {
    type: date
    sql: ${TABLE}.FechaAlta ;;
  }

  dimension: fecha_baja {
    type: date
    sql: ${TABLE}.FechaBaja ;;
  }

  dimension: fecha_primer_movimiento {
    type: date
    sql: ${TABLE}.FechaPrimerMovimiento ;;
  }

  dimension: fecha_ultimo_movimiento {
    type: date
    sql: ${TABLE}.FechaUltimoMovimiento ;;
  }

  dimension_group: fecha_registro {
    type: time
    sql: ${TABLE}.FechaRegistro ;;
  }

  dimension_group: fecha_min_pago {
    type: time
    sql: ${TABLE}.FechaMinPago ;;
  }

  dimension_group: fecha_max_pago {
    type: time
    sql: ${TABLE}.FechaMaxPago ;;
  }

  dimension_group: fecha_min_dispersion {
    type: time
    sql: ${TABLE}.FechaMinDispersion ;;
  }

  dimension_group: fecha_max_dispersion {
    type: time
    sql: ${TABLE}.FechaMaxDispersion ;;
  }

  dimension_group: fecha_min_transaccion {
    type: time
    sql: ${TABLE}.FechaMinTransaccion ;;
  }

  dimension_group: fecha_max_transaccion {
    type: time
    sql: ${TABLE}.FechaMaxTransaccion ;;
  }

  dimension_group: fecha_min_transferencia {
    type: time
    sql: ${TABLE}.FechaMinTransferencia ;;
  }

  dimension_group: fecha_max_transferencia {
    type: time
    sql: ${TABLE}.FechaMaxTransferencia ;;
  }

  dimension_group: fecha_min_c2_centrada {
    type: time
    sql: ${TABLE}.FechaMinC2CEntrada ;;
  }

  dimension_group: fecha_max_c2_centrada {
    type: time
    sql: ${TABLE}.FechaMaxC2CEntrada ;;
  }

  dimension_group: fecha_min_c2_csalida {
    type: time
    sql: ${TABLE}.FechaMinC2CSalida ;;
  }

  dimension_group: fecha_max_c2_csalida {
    type: time
    sql: ${TABLE}.FechaMaxC2CSalida ;;
  }

  dimension_group: fecha_modificacion {
    type: time
    sql: ${TABLE}.FechaModificacion ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }

  dimension: ultimo_movimientob {
    type: string
    sql: ${TABLE}.UltimoMovimientob ;;
  }

  dimension: primer_movimientob {
    type: string
    sql: ${TABLE}.PrimerMovimientob ;;
  }

  dimension: ultimo_movimiento {
    type: string
    sql: ${TABLE}.UltimoMovimiento ;;
  }

  dimension: primer_movimiento {
    type: string
    sql: ${TABLE}.PrimerMovimiento ;;
  }

  dimension: etiqueta_corte {
    type: string
    sql: ${TABLE}.EtiquetaCorte ;;
  }

  dimension: fecha_corte {
    type: date
    sql: ${TABLE}.FechaCorte ;;
  }

  dimension: ultimo_movimiento_mes_ant {
    type: date
    sql: ${TABLE}.UltimoMovimientoMesAnt ;;
  }

  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GrupoCliente ;;
  }

  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.FechaNacimiento ;;
  }

  set: detail {
    fields: [
        id,
  procesador,
  producto,
  cliente,
  cuenta,
  cuenta_madre,
  limite_compras,
  nivel_cuenta,
  limite_credito,
  titular,
  estado_operativo,
  disponible,
  fecha_disponible,
  fecha_alta,
  fecha_baja,
  fecha_primer_movimiento,
  fecha_ultimo_movimiento,
  fecha_registro_time,
  fecha_min_pago_time,
  fecha_max_pago_time,
  fecha_min_dispersion_time,
  fecha_max_dispersion_time,
  fecha_min_transaccion_time,
  fecha_max_transaccion_time,
  fecha_min_transferencia_time,
  fecha_max_transferencia_time,
  fecha_min_c2_centrada_time,
  fecha_max_c2_centrada_time,
  fecha_min_c2_csalida_time,
  fecha_max_c2_csalida_time,
  fecha_modificacion_time,
  usuario,
  ultimo_movimientob,
  primer_movimientob,
  ultimo_movimiento,
  primer_movimiento,
  etiqueta_corte,
  fecha_corte,
  ultimo_movimiento_mes_ant,
  grupo_cliente,
  fecha_nacimiento
    ]
  }
}
