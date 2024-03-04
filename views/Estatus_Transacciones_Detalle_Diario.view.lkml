
view: estatus_transacciones_detalle_diario {
  sql_table_name: dbo.EstatusTransaccionesDetalleDiario  ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: hora {
    type: number
    sql: ${TABLE}.Hora ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: descripcion_estatus {
    type: string
    sql: ${TABLE}.DescripcionEstatus ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: categoria_transaccion {
    type: string
    sql: ${TABLE}.CategoriaTransaccion ;;
  }

  dimension: is_authorized {
    type: number
    sql: ${TABLE}.IS_AUTHORIZED ;;
  }

  set: detail {
    fields: [
        id,
  transacciones,
  fecha,
  hora,
  producto,
  descripcion_estatus,
  comercio,
  categoria_transaccion,
  is_authorized
    ]
  }
}
