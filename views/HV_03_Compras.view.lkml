
view: hv_03_compras {
  derived_table: {
    sql: Select Distinct
          A.IdClienteTransaccion As 'C_IdClienteTransaccion',
          C.idMovimiento As 'C_idMovimiento',
          C.Monto As 'C_Monto',
          A.FechaCreacion As 'C_FechaCreacion',
          A.IdEstado As 'C_IdEstado',
          A.IdTransaccionStp As 'C_IdTransaccionStp',
          B.Comercio As 'C_Comercio',
          B.Folio As 'C_Folio',
          C.Tarjeta As 'C_Tarjeta',
          C.NumCuenta As 'C_NumCuenta',
          AA.NoCredito As 'P_NoCredito',
          AA.ConciliacionesEcoWebID As 'P_ConciliacionesEcoWebID',
          AA.EstadosConciliacionEcoWebID As 'P_EstadosConciliacionEcoWebID',
          AA.Estado As 'P_Estado',
          AA.Descripcion As 'P_Descripcion'
      From
        dbo.BitacoraTransaccionesExternas A With (Nolock)
      Left Join
        dbo.BitacoraTransaccionesExternasLiquidaciones B With (Nolock) On A.IdMovimiento = B.IdMovimiento
      Join
        dbo.Movimiento C With (Nolock) On B.IdMovimiento = C.idMovimiento
      Left Join
        (
        Select
          IdMovimiento,
          NoCredito,
          ConciliacionesEcoWebID,
          A.EstadosConciliacionEcoWebID,
          Estado,
          Descripcion
        From
          dbo.ConciliacionesEcoWeb a with(nolock)
        inner join
          dbo.CatEstadosConciliacionEcoWeb b with(nolock) on a.EstadosConciliacionEcoWebID=b.EstadosConciliacionEcoWebID
        )AA On C.idMovimiento = AA.IdMovimiento
      Where
        C.idMovimiento > 15000000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: c_id_cliente_transaccion {
    type: string
    sql: ${TABLE}.C_IdClienteTransaccion ;;
  }

  dimension: c_id_movimiento {
    type: number
    sql: ${TABLE}.C_idMovimiento ;;
  }

  dimension: c_monto {
    type: number
    sql: ${TABLE}.C_Monto ;;
  }

  dimension_group: c_fecha_creacion {
    type: time
    sql: ${TABLE}.C_FechaCreacion ;;
  }

  dimension: c_id_estado {
    type: number
    sql: ${TABLE}.C_IdEstado ;;
  }

  dimension: c_id_transaccion_stp {
    type: string
    sql: ${TABLE}.C_IdTransaccionStp ;;
  }

  dimension: c_comercio {
    type: string
    sql: ${TABLE}.C_Comercio ;;
  }

  dimension: c_folio {
    type: string
    sql: ${TABLE}.C_Folio ;;
  }

  dimension: c_tarjeta {
    type: string
    sql: ${TABLE}.C_Tarjeta ;;
  }

  dimension: c_num_cuenta {
    type: string
    sql: ${TABLE}.C_NumCuenta ;;
  }

  dimension: p_no_credito {
    type: string
    sql: ${TABLE}.P_NoCredito ;;
  }

  dimension: p_conciliaciones_eco_web_id {
    type: number
    sql: ${TABLE}.P_ConciliacionesEcoWebID ;;
  }

  dimension: p_estados_conciliacion_eco_web_id {
    type: number
    sql: ${TABLE}.P_EstadosConciliacionEcoWebID ;;
  }

  dimension: p_estado {
    type: string
    sql: ${TABLE}.P_Estado ;;
  }

  dimension: p_descripcion {
    type: string
    sql: ${TABLE}.P_Descripcion ;;
  }

  set: detail {
    fields: [
        c_id_cliente_transaccion,
  c_id_movimiento,
  c_monto,
  c_fecha_creacion_time,
  c_id_estado,
  c_id_transaccion_stp,
  c_comercio,
  c_folio,
  c_tarjeta,
  c_num_cuenta,
  p_no_credito,
  p_conciliaciones_eco_web_id,
  p_estados_conciliacion_eco_web_id,
  p_estado,
  p_descripcion
    ]
  }
}
