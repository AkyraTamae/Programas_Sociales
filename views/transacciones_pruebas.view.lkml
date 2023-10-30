
view: transacciones_pruebas {
  derived_table: {
    sql: Select *
      From
        [dbo].[CierreTransacciones] ;;
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

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: operaciones {
    type: number
    sql: ${TABLE}.Operaciones ;;
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }

  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.MontoIntercambio ;;
  }

  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.ClasificacionCliente ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  set: detail {
    fields: [
        id,
	fecha,
	producto,
	clave_cliente,
	operaciones,
	cuentas,
	importe_pesos,
	monto_intercambio,
	clasificacion_cliente,
	tipo_movimiento,
	procesador
    ]
  }
}
