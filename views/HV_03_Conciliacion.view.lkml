
view: hv_03_conciliacion {
  derived_table: {
    sql: Select
        A.C_idMovimiento As 'Id_Movimiento',
        AA.Comercio,
        AA.razon_social As 'Razon_Social',
        A.C_Folio As 'Folio',
        A.C_NumCuenta As 'Num_Cuenta',
        AB.fecha As 'Fecha_Compra',
        AC.Monto As 'Monto_de_Compra',
        AC.idSTP,
        AC.Fecha As 'Fecha_SPEI',
        AC.Monto As 'Monto_SPEI',
        AB.fechaPago As 'Fecha_Liquidacion',
        DATEDIFF(DAY,AC.Fecha,AB.fechaPago) As 'Tiempo_Para_Liquidacion',
        AB.liquidacion_comercio As 'Liquidacion_Comercio',
        AB.importe_ventas As 'Importe_Ventas',
        A.C_IdClienteTransaccion As 'Id_Cliente_Transaccion',
        A.C_FechaCreacion As 'Fecha_Creacion',
        A.P_ConciliacionesEcoWebID As 'Conciliaciones_Eco_Web_ID',
        A.P_EstadosConciliacionEcoWebID As 'Estados_Conciliacion_Eco_Web_ID',
        A.P_Estado As 'Estado_Conciliacion',
        A.P_Descripcion As 'Descripcion',
        A.C_IdEstado As 'Id_Estado',
        AA.Comercio As 'Comercio_C',
        A.C_Comercio As 'Comercio_P',
        AC.ConceptoPago As 'Concepto_Pago',
        Null As 'Diferencia',--AVG(AB.importe_ventas) - SUM(AC.Monto)
        Case
          When A.C_IdEstado = 3 Then 'Cancelada'
          When A.C_IdEstado = 2 Then 'Lista Para Pagar'
          When A.C_IdEstado = 1 Then 'Cargo Realizado'
        End As 'Estado',
        AB.folio As 'Folio_C',
        A.C_idMovimiento  As 'Id_Movimiento_C',
        A.C_IdTransaccionStp As 'Id_Transaccion_STP',
        ROUND(AC.Monto, -3, -2) As 'Monto_Compra_Agrupado',
        A.P_NoCredito As 'No_Credito',
        '1' As 'Número de registros',
        AA.rfc As 'RFC',
        A.C_Tarjeta As 'Tarjeta',
        AB.transacciones As 'Transacciones'
      From
        [dbo].[BitacoraTransacciones] A With (Nolock)
      Left Join
        (
        Select Distinct
          comercio,
          razon_social,
          rfc
        From
          [broxelco_rdg].[Comercio] With (Nolock)
        )AA On A.C_Comercio = AA.Comercio
      Left Join
        (
        Select Distinct
          folio,
          liquidacion_comercio,
          fecha,
          fechaPago,
          comercio,
          importe_ventas,
          transacciones
        From
          [broxelco_rdg].[bp_detalle_diario_comercio] Wirh (Nolock)
        Where
          processor = '2' And importe_ventas <> '0' And idPrograma = '10' And fecha>'2018-04-10'
        )AB On A.C_Folio = AB.folio And C_Comercio = Ab.comercio
      Left Join
        (
        Select Distinct
          Monto,
          idSTP,
          ConceptoPago,
          Fecha
        From
          [broxelco_rdg].[RecepcionTransferencias] With (Nolock)
        Where
          FechaOperacion > '2018-04-05' And CLABE = '646180143121032635'
        )AC On C_IdCLienteTransaccion = AC.ConceptoPago ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.Id_Movimiento ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.Razon_Social ;;
  }

  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.Num_Cuenta ;;
  }

  dimension: fecha_compra {
    type: date
    sql: ${TABLE}.Fecha_Compra ;;
  }

  dimension: monto_de_compra {
    type: number
    sql: ${TABLE}.Monto_de_Compra ;;
  }

  dimension: id_stp {
    type: string
    sql: ${TABLE}.idSTP ;;
  }

  dimension_group: fecha_spei {
    type: time
    sql: ${TABLE}.Fecha_SPEI ;;
  }

  dimension: monto_spei {
    type: number
    sql: ${TABLE}.Monto_SPEI ;;
  }

  dimension: fecha_liquidacion {
    type: date
    sql: ${TABLE}.Fecha_Liquidacion ;;
  }

  dimension: tiempo_para_liquidacion {
    type: number
    sql: ${TABLE}.Tiempo_Para_Liquidacion ;;
  }

  dimension: liquidacion_comercio {
    type: number
    sql: ${TABLE}.Liquidacion_Comercio ;;
  }

  dimension: importe_ventas {
    type: number
    sql: ${TABLE}.Importe_Ventas ;;
  }

  dimension: id_cliente_transaccion {
    type: string
    sql: ${TABLE}.Id_Cliente_Transaccion ;;
  }

  dimension_group: fecha_creacion {
    type: time
    sql: ${TABLE}.Fecha_Creacion ;;
  }

  dimension: conciliaciones_eco_web_id {
    type: number
    sql: ${TABLE}.Conciliaciones_Eco_Web_ID ;;
  }

  dimension: estados_conciliacion_eco_web_id {
    type: number
    sql: ${TABLE}.Estados_Conciliacion_Eco_Web_ID ;;
  }

  dimension: estado_conciliacion {
    type: string
    sql: ${TABLE}.Estado_Conciliacion ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  dimension: id_estado {
    type: number
    sql: ${TABLE}.Id_Estado ;;
  }

  dimension: comercio_c {
    type: string
    sql: ${TABLE}.Comercio_C ;;
  }

  dimension: comercio_p {
    type: string
    sql: ${TABLE}.Comercio_P ;;
  }

  dimension: concepto_pago {
    type: string
    sql: ${TABLE}.Concepto_Pago ;;
  }

  dimension: diferencia {
    type: number
    sql: ${TABLE}.Diferencia ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: folio_c {
    type: string
    sql: ${TABLE}.Folio_C ;;
  }

  dimension: id_movimiento_c {
    type: number
    sql: ${TABLE}.Id_Movimiento_C ;;
  }

  dimension: id_transaccion_stp {
    type: number
    sql: ${TABLE}.Id_Transaccion_STP ;;
  }

  dimension: monto_compra_agrupado {
    type: number
    sql: ${TABLE}.Monto_Compra_Agrupado ;;
  }

  dimension: no_credito {
    type: string
    sql: ${TABLE}.No_Credito ;;
  }

  dimension: nmero_de_registros {
    type: string
    label: "Número de registros"
    sql: ${TABLE}."Número de registros" ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: tarjeta {
    type: string
    sql: ${TABLE}.Tarjeta ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  set: detail {
    fields: [
        id_movimiento,
  comercio,
  razon_social,
  folio,
  num_cuenta,
  fecha_compra,
  monto_de_compra,
  id_stp,
  fecha_spei_time,
  monto_spei,
  fecha_liquidacion,
  tiempo_para_liquidacion,
  liquidacion_comercio,
  importe_ventas,
  id_cliente_transaccion,
  fecha_creacion_time,
  conciliaciones_eco_web_id,
  estados_conciliacion_eco_web_id,
  estado_conciliacion,
  descripcion,
  id_estado,
  comercio_c,
  comercio_p,
  concepto_pago,
  diferencia,
  estado,
  folio_c,
  id_movimiento_c,
  id_transaccion_stp,
  monto_compra_agrupado,
  no_credito,
  nmero_de_registros,
  rfc,
  tarjeta,
  transacciones
    ]
  }
}
