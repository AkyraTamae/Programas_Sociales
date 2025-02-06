
view: hv_03_conciliacion {
  derived_table: {
    sql: Select
      BTT.C_idMovimiento As IdMovimiento,
      AA.Comercio,
      AA.razon_social As RazonSocial,
      BTT.C_Folio As Folio,
      BTT.C_NumCuenta As NumCuenta,
      CAST(AB.fecha As Date) As FechaCompra,
      AC.Monto As MontoDeCompra,
      AC.IdSTP,
      CAST(AC.Fecha As TimeStamp) As FechaSPEI,
      AC.Monto As MontoSPEI,
      CAST(AB.fechaPago As Date) As FechaLiquidacion,
      DATE_DIFF(CAST(AB.fechaPago As Date), CAST(AC.Fecha As Date), DAY) As TiempoParaLiquidacion,
      AB.liquidacion_comercio As LiquidacionComercio,
      AB.importe_ventas As ImporteVentas,
      BTT.C_IdClienteTransaccion As IdClienteTransaccion,
      CAST(BTT.C_FechaCreacion As Date) As FechaCreacion,
      BTT.P_ConciliacionesEcoWebID As ConciliacionesEcoWebID,
      BTT.P_EstadosConciliacionEcoWebID As EstadosConciliacionEcoWebID,
      BTT.P_Estado As EstadoConciliacion,
      BTT.P_Descripcion As Descripcion,
      BTT.C_IdEstado As IdEstado,
      AA.Comercio As ComercioC,
      BTT.C_Comercio As ComercioP,
      AC.ConceptoPago As ConceptoPago,
      Case
      When BTT.C_IdEstado = 3 Then 'Cancelada'
      When BTT.C_IdEstado = 2 Then 'Lista Para Pagar'
      When BTT.C_IdEstado = 1 Then 'Cargo Realizado'
      End As Estado,
      AB.folio As FolioC,
      BTT.C_idMovimiento  As IdMovimientoC,
      BTT.C_IdTransaccionStp As IdTransaccionSTP,
      ROUND(AC.Monto / 1000 , 0) * 1000 As MontoCompraAgrupado,
      BTT.P_NoCredito As NoCredito,
      '1' As NumeroDeRregistros,
      AA.rfc As RFC,
      BTT.C_Tarjeta As Tarjeta,
      AB.transacciones As Transacciones,
      AD.EstadoComercial
    From
      (
      --BitacoraTransacciones
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
      ) BTT
    Left Join
      (
      Select Distinct
        comercio,
        razon_social,
        rfc
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio`
      )AA On BTT.C_Comercio = AA.Comercio
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
      `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.bp_detalle_diario_comercio`
    Where
      processor = 2 And importe_ventas <> 0 And idPrograma = 10 And fecha > '2018-04-10'
      )AB On BTT.C_Folio = AB.folio And C_Comercio = Ab.comercio
    Left Join
      (
      Select Distinct
        Monto,
        idSTP,
        ConceptoPago,
        Fecha
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.RecepcionTransferencias`
      Where
        FechaOperacion > '2018-04-05' And CLABE = '646180143121032635'
      )AC On C_IdCLienteTransaccion = AC.ConceptoPago
    Left Join
      (
      Select
        comercio,
        Case
        --Modificación de regla solicitada el 29 de dicie-180bre
        When Comercio = '23CBX00958' Then 'Hidalgo'
        When Comercio = '23CBX00980' Then 'Jalisco'
        --
        When Lower(estadoComercial) Like 'cdmx' Or Lower(estadoComercial) Like 'ciudad de m%' Or Lower(estadoComercial) Like 'ciudad de m%' Or Lower(estadoComercial) Like '%federal%' Or Lower(estadoComercial) Like 'd.f.' Or Lower(estadoComercial) Like 'df' Then 'Distrito Federal'
        When Lower(estadoComercial) Like '%xico%' Or Lower(estadoComercial) Like 'edo. méx' Or Lower(estadoComercial) Like 'edo mex%' Or Lower(estadoComercial) = 'mex' Or Lower(estadoComercial) = 'mex.' Or Lower(estadoComercial) Like 'edo. mex.%'  Then 'México'
        When Lower(estadoComercial) Like '%uebl%' Then 'Puebla'
        When Lower(estadoComercial) Like 'guerr%' Then 'Guerrero'
        When Lower(estadoComercial) Like 'quer%' Then 'Querétaro'
        When Lower(estadoComercial) Like 'nuevo le%' Or Lower(estadoComercial) Like 'NUENO LEON' Then 'Nuevo León'
        When Lower(estadoComercial) = 'baja california' Or Lower(estadoComercial) = 'baja california ' Or Lower(estadoComercial) = 'baja california ' Or Lower(estadoComercial) = 'baja california norte ' Or Lower(estadoComercial) Like '%norte' Then 'Baja California'
        When Lower(estadoComercial) Like '%sur%' Then 'Baja California Sur'
        When Lower(estadoComercial) Like 'campech%' Or Lower(estadoComercial) Like '%campech%' Then 'Campeche'
        When Lower(estadoComercial) Like 'chiap%' Then 'Chiapas'
        When Lower(estadoComercial) Like '%aulipa%' Then 'Tamaulipas'
        When Lower(estadoComercial) Like 'jalis%' Then 'Jalisco'
        When Lower(estadoComercial) Like 'sonor%' Then 'Sonora'
        When Lower(estadoComercial) Like 'naya%' Then 'Nayarit'
        When Lower(estadoComercial) Like 'micho%' Then 'Michoacán de Ocampo'
        When Lower(estadoComercial) Like '%potos%' Then 'San Luis Potosí'
        When Lower(estadoComercial) Like '%oahu%' Then 'Coahuila de Zaragoza'
        When Lower(estadoComercial) Like 'vera%' Then 'Veracruz de Ignacio de la Llave'
        When Lower(estadoComercial) Like '%ucat%' Then 'Yucatán'
        When Lower(estadoComercial) Like 'more%' Then 'Morelos'
        When Lower(estadoComercial) Like 'chih%' Then 'Chihuahua'
        When Lower(estadoComercial) Like 'zaca%' Then 'Zacatecas'
        When Lower(estadoComercial) Like 'guana%' Then 'Guanajuato'
        When Lower(estadoComercial) Like '%roo%' Then 'Quintana Roo'
        When Lower(estadoComercial) Like 'coli%' Then 'Colima'
        When Lower(estadoComercial) Like 'aguas%' Or Lower(estadoComercial) Like '%aguas%'Then 'Aguascalientes'
        When Lower(estadoComercial) Like 'oax%' Then 'Oaxaca'
        When Lower(estadoComercial) Like 'sina%' Then 'Sinaloa'
        When Lower(estadoComercial) Like 'chia%' Then 'Chiapas'
        When Lower(estadoComercial) Like 'dura%' Then 'Durango'
        When Lower(estadoComercial) Like 'hidal%' Then 'Hidalgo'
        When Lower(estadoComercial) Like 'tlax%' Then 'Tlaxcala'
        When Lower(estadoComercial) Like 'taba%' Then 'Tabasco'
        Else 'México'
        End As EstadoComercial
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio`
      )AD On BTT.C_Comercio = AD.Comercio ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: string
    sql: ${TABLE}.IdMovimiento ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }

  dimension_group: fecha_compra {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaCompra ;;
  }


  dimension: monto_de_compra {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDeCompra ;;
  }

  dimension: id_stp {
    type: string
    sql: ${TABLE}.IdSTP ;;
  }

  dimension_group: fecha_spei {
    type: time
    sql: ${TABLE}.FechaSPEI ;;
  }

  dimension: monto_spei {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoSPEI ;;
  }

  dimension: fecha_liquidacion {
    type: date
    sql: ${TABLE}.FechaLiquidacion ;;
  }

  dimension: tiempo_para_liquidacion {
    type: number
    sql: ${TABLE}.TiempoParaLiquidacion ;;
  }

  dimension: liquidacion_comercio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    hidden: yes
    sql: ${TABLE}.LiquidacionComercio ;;
  }

  dimension: importe_ventas {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteVentas ;;
  }

  dimension: id_cliente_transaccion {
    type: string
    sql: ${TABLE}.IdClienteTransaccion ;;
  }

  dimension_group: fecha_creacion {
    type: time
    sql: ${TABLE}.FechaCreacion ;;
  }

  dimension: conciliaciones_eco_web_id {
    type: string
    sql: ${TABLE}.ConciliacionesEcoWebID ;;
  }

  dimension: estados_conciliacion_eco_web_id {
    type: string
    sql: ${TABLE}.EstadosConciliacionEcoWebID ;;
  }

  dimension: estado_conciliacion {
    type: string
    sql: ${TABLE}.EstadoConciliacion ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  dimension: id_estado {
    type: string
    sql: ${TABLE}.IdEstado ;;
  }

  dimension: comercio_c {
    type: string
    sql: ${TABLE}.ComercioC ;;
  }

  dimension: comercio_p {
    type: string
    sql: ${TABLE}.ComercioP ;;
  }

  dimension: concepto_pago {
    type: string
    sql: ${TABLE}.ConceptoPago ;;
  }

  measure: diferencia {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${diferencia_avg} - ${diferencia_sum} ;;
  }

  measure: diferencia_avg {
    type: number
    hidden: yes
    sql: AVG(${TABLE}.ImporteVentas) ;;
  }

  measure: diferencia_sum {
    type: number
    hidden: yes
    sql: SUM(${TABLE}.MontoDeCompra) ;;
  }

  measure: monto_de_compra_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDeCompra ;;
  }

  measure: importe_ventas_avg {
    type: average
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteVentas ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: folio_c {
    type: string
    sql: ${TABLE}.FolioC ;;
  }

  dimension: id_movimiento_c {
    type: string
    sql: ${TABLE}.IdMovimientoC ;;
  }

  dimension: id_transaccion_stp {
    type: string
    sql: ${TABLE}.IdTransaccionSTP ;;
  }

  dimension: monto_compra_agrupado {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoCompraAgrupado ;;
  }

  dimension: no_credito {
    type: string
    sql: ${TABLE}.NoCredito ;;
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

#####################################3

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.EstadoComercial ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto_de_compra_sum} / ${count} ;;
  }

  measure: importe_ventas_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteVentas ;;
  }

  dimension: liquidacion_comercio_measure {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    label:"Liquidacion Comercio"
    sql: if(${transacciones} > 1, cast(${monto_de_compra} - (( 1 - (${liquidacion_comercio} / ${importe_ventas})) * ${monto_de_compra}) as numeric), ${liquidacion_comercio}) ;;
  }

  dimension: mes_compra {
    type: string
    label: "Mes Compra"
    sql: ${TABLE}.FechaCompra ;;
    html: {{ rendered_value | date: "%B %G" }};;

  }

  set: detail {
    fields: [
        id_movimiento,
  comercio,
  razon_social,
  folio,
  num_cuenta,
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
