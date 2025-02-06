
view: comparacion_conciliacion {
  derived_table: {
    sql: Select
        CAST(A.Fecha As TimeStamp) As Fecha,
        CAST(AA.MontoDeCompra As Numeric) As MontoDeCompra,
        SUM(A.importe_ventas) As ImporteVentas
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.bp_detalle_diario_comercio` A
      Left Join
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ComercioNoReportar` C On A.comercio = C.Comercio
      Left Join
        (
        Select
          B.fecha As FechaCompra,
          SUM(C.Monto) As MontoDeCompra,
          REPLACE(CAST(B.fecha As String), '-', '') As KeyId
        From
          (--BitacoraTransacciones
          Select Distinct
            A.IdClienteTransaccion As C_IdClienteTransaccion,
            C.idMovimiento As C_idMovimiento,
            C.Monto As C_Monto,
            A.FechaCreacion As C_FechaCreacion,
            A.IdEstado As C_IdEstado,
            A.IdTransaccionStp As C_IdTransaccionStp,
            B.Comercio As C_Comercio,
            B.Folio As C_Folio,
            C.Tarjeta As C_Tarjeta,
            C.NumCuenta As C_NumCuenta,
            AA.NoCredito As P_NoCredito,
            AA.ConciliacionesEcoWebID As P_ConciliacionesEcoWebID,
            AA.EstadosConciliacionEcoWebID As P_EstadosConciliacionEcoWebID,
            AA.Estado As P_Estado,
            AA.Descripcion As P_Descripcion
          From
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.BitacoraTransaccionesExternas` A
          Left Join
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.BitacoraTransaccionesExternasLiquidaciones` B On A.IdMovimiento = B.IdMovimiento
          Join
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.Movimiento` C On B.IdMovimiento = C.idMovimiento
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
              `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.ConciliacionesEcoWeb` A
            Inner Join
              `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.CatEstadosConciliacionEcoWeb` B On A.EstadosConciliacionEcoWebID = B.EstadosConciliacionEcoWebID
            )AA On C.idMovimiento = AA.IdMovimiento
          Where
            C.idMovimiento > 15000000

          UNION ALL

          Select Distinct
            A.IdClienteTransaccion As C_IdClienteTransaccion,
            C.idMovimiento As C_idMovimiento,
            C.Monto As C_Monto,
            A.FechaCreacion As C_FechaCreacion,
            A.IdEstado As C_IdEstado,
            A.IdTransaccionStp As C_IdTransaccionStp,
            B.Comercio As C_Comercio,
            B.Folio As C_Folio,
            C.Tarjeta As C_Tarjeta,
            C.NumCuenta As C_NumCuenta,
            AA.NoCredito As P_NoCredito,
            AA.ConciliacionesEcoWebID As P_ConciliacionesEcoWebID,
            AA.EstadosConciliacionEcoWebID As P_EstadosConciliacionEcoWebID,
            AA.Estado As P_Estado,
            AA.Descripcion As P_Descripcion
          From
            `mgcp-10078073-bxl-dwh-prod.raw_BroxelPaymentsWs.BitacoraTransaccionesExternas_20250121` A
          Left Join
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.BitacoraTransaccionesExternasLiquidaciones` B On A.IdMovimiento = B.IdMovimiento
          Join
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.Movimiento` C On B.IdMovimiento = C.idMovimiento
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
              `mgcp-10078073-bxl-dwh-prod.raw_BroxelPaymentsWs.ConciliacionesEcoWeb_20250121` A
            Inner Join
              `mgcp-10078073-bxl-dwh-prod.cdc_BroxelPaymentsWS.CatEstadosConciliacionEcoWeb` B On A.EstadosConciliacionEcoWebID = B.EstadosConciliacionEcoWebID
            )AA On C.idMovimiento = AA.IdMovimiento
          Where
            C.idMovimiento > 15000000
          )BTT
        Left Join
          (
          Select Distinct
            folio,
            fecha,
            comercio
          From
            `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.bp_detalle_diario_comercio`
          Where
            processor = 2 And importe_ventas <> 0 And idPrograma = 10 And fecha >= '2023-12-01'
          )B On BTT.C_Folio = B.folio And BTT.C_Comercio = B.comercio
        Left Join
          (
          Select Distinct
            Monto,
            ConceptoPago
          From
            `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.RecepcionTransferencias`
          Where
            FechaOperacion >= '2023-12-01' And CLABE = '646180143121032635'
          )C On BTT.C_IdCLienteTransaccion = C.ConceptoPago
        Where
          B.fecha Is Not Null
        Group BY
          B.fecha
        )AA On REPLACE(CAST(A.Fecha As String), '-', '') = AA.KeyId
      Where
        A.fecha >= '2023-12-01' And A.idPrograma = 10 And C.Comercio Is Null
      Group By
        A.Fecha,
        AA.MontoDeCompra ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha {
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    type: time
    sql: ${TABLE}.Fecha ;;
  }

  measure: monto_de_compra {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDeCompra ;;
  }

  measure: importe_ventas {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteVentas ;;
  }

  measure: diferencia {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${importe_ventas} - ${monto_de_compra} ;;
  }

  set: detail {
    fields: [monto_de_compra, importe_ventas]
  }
}
