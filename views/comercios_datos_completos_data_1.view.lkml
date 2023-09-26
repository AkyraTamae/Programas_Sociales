view: comercios_datos_completos_data_1 {
  sql_table_name: dbo.Comercios_Datos_completos_data (1) ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }
  dimension: atm_o_consumo {
    type: string
    sql: ${TABLE}."Atm o Consumo" ;;
  }
  dimension: b2b {
    type: string
    sql: ${TABLE}.b2b ;;
  }
  dimension: broxel_control {
    type: string
    sql: ${TABLE}.BroxelControl ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
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
    type: string
    sql: ${TABLE}.CodigoTransaccion ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: comercio_comercios_admin {
    type: string
    sql: ${TABLE}."Comercio (comercios admin)" ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }
  dimension: fecha_actualizacion {
    type: string
    sql: ${TABLE}.FechaActualizacion ;;
  }
  dimension: fecha_creacion_cliente {
    type: string
    sql: ${TABLE}.FechaCreacionCliente ;;
  }
  dimension: fecha_periodo {
    type: string
    sql: ${TABLE}."Fecha periodo" ;;
  }
  dimension: giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }
  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GrupoCliente ;;
  }
  dimension: hora {
    type: string
    sql: ${TABLE}.Hora ;;
  }
  dimension: id_nivel_de_cuenta {
    type: string
    sql: ${TABLE}.IdNivelDeCuenta ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: importe_por_comercio {
    type: number
    sql: ${TABLE}."Importe por comercio" ;;
  }
  dimension: mcc {
    type: string
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
  dimension: nmero_de_registros {
    type: number
    sql: ${TABLE}."Número de registros" ;;
  }
  dimension: operaciones___monto_valor {
    type: number
    sql: ${TABLE}."Operaciones   Monto (valor)" ;;
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
    sql: ${TABLE}."Razon social" ;;
  }
  dimension: razon_social2 {
    type: string
    sql: ${TABLE}."Razon Social2" ;;
  }
  dimension: ticket_promedio {
    type: number
    sql: ${TABLE}."Ticket promedio" ;;
  }
  dimension: tipo_de_comercio {
    type: string
    sql: ${TABLE}."Tipo de comercio" ;;
  }
  dimension: tipo_transaccion {
    type: string
    sql: ${TABLE}.TipoTransaccion ;;
  }
  dimension: top_comercio {
    type: string
    sql: ${TABLE}."Top comercio" ;;
  }
  dimension: top_razon_social {
    type: string
    sql: ${TABLE}."Top Razon Social" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
