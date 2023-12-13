view: hv_03_2 {
  derived_table: {
    sql: Select
        A.folio,
        A.liquidacion_comercio,
        A.fecha,
        A.fechaPago,
        A.comercio,
        A.importe_ventas,
        A.transacciones,
        AA.razon_social,
        AA.rfc
      From
        broxelco_rdg.bp_detalle_diario_comercio A With (Nolock)
      Left Join
        (
        Select
          comercio,
          razon_social,
          rfc
        From
          broxelco_rdg.Comercio With (Nolock)
        )AA On A.comercio = AA.comercio
      Where
        A.processor = 2 And A.importe_ventas <> 0 And A.idPrograma = 10 And fecha > '2018-04-10' ;;
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

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }

  set: detail {
    fields: [
      folio,
      liquidacion_comercio,
      fecha,
      fecha_pago,
      comercio,
      importe_ventas,
      transacciones,
      razon_social,
      rfc
    ]
  }
}
