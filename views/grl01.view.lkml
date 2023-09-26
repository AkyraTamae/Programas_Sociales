view: grl01 {
  sql_table_name: dbo.GRL01 ;;

  dimension: broxel_control {
    type: string
    sql: ${TABLE}.BroxelControl ;;
  }
  dimension: categoria_payments {
    type: string
    sql: ${TABLE}.CategoriaPayments ;;
  }
  dimension: clasificacion {
    type: string
    sql: ${TABLE}.Clasificacion ;;
  }
  dimension: cliente {
    type: string
    sql: ${TABLE}.Cliente ;;
  }
  dimension: codigo_transaccion {
    type: number
    sql: ${TABLE}.CodigoTransaccion ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension_group: fecha_actualizacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaActualizacion ;;
  }
  dimension_group: fecha_creacion_cliente {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaCreacionCliente ;;
  }
  dimension: giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }
  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GrupoCliente ;;
  }
  dimension: id_nivel_de_cuenta {
    type: number
    sql: ${TABLE}.IdNivelDeCuenta ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: mcc {
    type: number
    sql: ${TABLE}.MCC ;;
  }
  dimension: moneda {
    type: string
    sql: ${TABLE}.Moneda ;;
  }
  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.MontoIntercambio ;;
  }
  dimension: num_movimientos {
    type: number
    sql: ${TABLE}.NumMovimientos ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.TipoTransaccion ;;
  }
  measure: count {
    type: count
  }
}
