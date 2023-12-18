
view: hv_03_liquidacion {
  derived_table: {
    sql: Select
        folio As 'L_Folio',
        liquidacion_comercio As 'L_liquidacion_comercio',
        fecha As 'L_Fecha',
        fechaPago As 'L_FechaPago',
        comercio As 'L_Comercio',
        importe_ventas As 'L_Importe_ventas',
        transacciones As 'L_Transacciones'
      From
        broxelco_rdg.bp_detalle_diario_comercio With(Nolock)
      Where
        Processor = 2 And importe_ventas <> 0 And  idPrograma = 10 And fecha >'2018-04-10' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: l_folio {
    type: string
    sql: ${TABLE}.l_folio ;;
  }

  dimension: l_liquidacion_comercio {
    type: number
    sql: ${TABLE}.l_liquidacion_comercio ;;
  }

  dimension: l_fecha {
    type: date
    sql: ${TABLE}.l_fecha ;;
  }

  dimension: l_fecha_pago {
    type: date
    sql: ${TABLE}.l_fechaPago ;;
  }

  dimension: l_comercio {
    type: string
    sql: ${TABLE}.l_comercio ;;
  }

  dimension: l_importe_ventas {
    type: number
    sql: ${TABLE}.l_importe_ventas ;;
  }

  dimension: l_transacciones {
    type: number
    sql: ${TABLE}.l_transacciones ;;
  }

  set: detail {
    fields: [
        l_folio,
  l_liquidacion_comercio,
  l_fecha,
  l_fecha_pago,
  l_comercio,
  l_importe_ventas,
  l_transacciones
    ]
  }
}
