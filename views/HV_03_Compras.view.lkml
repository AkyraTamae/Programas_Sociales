
view: hv_03_compras {
  derived_table: {
    sql: Select Distinct
          A.IdClienteTransaccion,
          C.idMovimiento,
          C.Monto,
          A.FechaCreacion,
          A.IdEstado,
          A.IdTransaccionStp,
          B.Comercio,
          B.Folio,
          C.Tarjeta,
          C.NumCuenta,
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

  dimension: id_cliente_transaccion {
    type: string
    sql: ${TABLE}.IdClienteTransaccion ;;
  }

  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.idMovimiento ;;
  }

  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }

  dimension_group: fecha_creacion {
    type: time
    sql: ${TABLE}.FechaCreacion ;;
  }

  dimension: id_estado {
    type: number
    sql: ${TABLE}.IdEstado ;;
  }

  dimension: id_transaccion_stp {
    type: string
    sql: ${TABLE}.IdTransaccionStp ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }

  dimension: tarjeta {
    type: string
    sql: ${TABLE}.Tarjeta ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
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
        id_cliente_transaccion,
  id_movimiento,
  monto,
  fecha_creacion_time,
  id_estado,
  id_transaccion_stp,
  comercio,
  folio,
  tarjeta,
  num_cuenta,
  p_no_credito,
  p_conciliaciones_eco_web_id,
  p_estados_conciliacion_eco_web_id,
  p_estado,
  p_descripcion
    ]
  }
}
