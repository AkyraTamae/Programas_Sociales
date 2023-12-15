
view: hv_03_liquidacion {
  derived_table: {
    sql: Select
        folio,
        liquidacion_comercio,
        fecha,fechaPago,comercio,importe_ventas,
        transacciones 
      From
        broxelco_rdg.bp_detalle_diario_comercio With(Nolock)
      Where 
        Processor = 2 And importe_ventas <> 0 And  idPrograma = 10 And fecha >'2018-04-10' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: folio {
    type: string
    sql: ${TABLE}.folio ;;
  }

  dimension: liquidacion_comercio {
    type: number
    sql: ${TABLE}.liquidacion_comercio ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.fecha ;;
  }

  dimension: fecha_pago {
    type: date
    sql: ${TABLE}.fechaPago ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.comercio ;;
  }

  dimension: importe_ventas {
    type: number
    sql: ${TABLE}.importe_ventas ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.transacciones ;;
  }

  set: detail {
    fields: [
        folio,
	liquidacion_comercio,
	fecha,
	fecha_pago,
	comercio,
	importe_ventas,
	transacciones
    ]
  }
}
