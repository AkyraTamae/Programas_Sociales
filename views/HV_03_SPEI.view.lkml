
view: hv_03_spei {
  derived_table: {
    sql: Select
        Monto As 'S_Monto',
        idSTP As 'S_idSTP',
        ConceptoPago As 'S_ConceptoPago',
        Fecha As 'S_Fecha'
      From
        broxelco_rdg.RecepcionTransferencias With (Nolock)
      Where
        FechaOperacion > '2018-04-05' And CLABE = '646180143121032635' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: s_monto {
    type: number
    sql: ${TABLE}.s_Monto ;;
  }

  dimension: s_id_stp {
    type: string
    sql: ${TABLE}.s_idSTP ;;
  }

  dimension: s_concepto_pago {
    type: string
    sql: ${TABLE}.s_ConceptoPago ;;
  }

  dimension_group: s_fecha {
    type: time
    sql: ${TABLE}.s_Fecha ;;
  }

  set: detail {
    fields: [
        s_monto,
  s_id_stp,
  s_concepto_pago,
  s_fecha_time
    ]
  }
}
