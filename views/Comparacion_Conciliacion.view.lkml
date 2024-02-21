
view: comparacion_conciliacion {
  derived_table: {
    sql: Select
        A.Fecha,
        CAST(AA.Monto_de_Compra As Decimal (10,2)) As 'Monto_de_Compra',
        SUM(A.importe_ventas) As 'Importe_Ventas'
      From
        [broxelco_rdg].[bp_detalle_diario_comercio] A
      Left Join
        [broxelco_rdg].[ComercioNoReportar] C On A.comercio = C.Comercio
      Left Join
        (
        Select
          B.fecha As 'Fecha_Compra',
          SUM(C.Monto) As 'Monto_de_Compra',
          REPLACE(B.fecha, '-', '') As 'KeyId'
        From
          [dbo].[BitacoraTransacciones] A With (Nolock)
        Left Join
          (
          Select Distinct
            folio,
            fecha,
            comercio
          From
            [broxelco_rdg].[bp_detalle_diario_comercio] Wirh (Nolock)
          Where
            processor = '2' And importe_ventas <> '0' And idPrograma = '10' And fecha >= '2024-01-01'
          )B On A.C_Folio = B.folio And A.C_Comercio = B.comercio
        Left Join
          (
          Select Distinct
            Monto,
            ConceptoPago
          From
            [broxelco_rdg].[RecepcionTransferencias] With (Nolock)
          Where
            FechaOperacion >= '2024-01-01' And CLABE = '646180143121032635'
          )C On A.C_IdCLienteTransaccion = C.ConceptoPago
        Where
          B.fecha Is Not Null
        Group BY
          B.fecha
        )AA On REPLACE(A.Fecha, '-', '') = AA.KeyId
      Where
        A.fecha >= '2024-01-01' And A.idPrograma = '10' And C.Comercio Is Null
      Group By
        A.Fecha,
        AA.Monto_de_Compra ;;
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
    sql: ${TABLE}.Monto_de_Compra ;;
  }

  measure: importe_ventas {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Importe_Ventas ;;
  }

  set: detail {
    fields: [monto_de_compra, importe_ventas]
  }
}
