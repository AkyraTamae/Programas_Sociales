
view: hv_03_spei {
  derived_table: {
    sql: Select
        Monto,
        idSTP,
        ConceptoPago,
        Fecha 
      From 
        broxelco_rdg.RecepcionTransferencias With (Nolock)
      Where
        FechaOperacion > '2018-04-05' And CLABE = '646180143121032635' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }

  dimension: id_stp {
    type: string
    sql: ${TABLE}.idSTP ;;
  }

  dimension: concepto_pago {
    type: string
    sql: ${TABLE}.ConceptoPago ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.Fecha ;;
  }

  set: detail {
    fields: [
        monto,
	id_stp,
	concepto_pago,
	fecha_time
    ]
  }
}
