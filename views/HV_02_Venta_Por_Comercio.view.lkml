
view: hv_02_venta_por_comercio {
  derived_table: {
    sql: Select
        A.id As 'Id',
        CONVERT(Date, A.fecha) As 'Fecha',
        A.Comercio,
        A.importe_ventas,
        A.importe_descuento,
        A.iva,
        A.folio,
        A.transacciones,
        A.liquidacion_comercio,
        A.refPago,
        A.claveRastreo,
        A.stPago,
        A.motivo,
        A.envioPago,
        A.ventas,
        A.devoluciones,
        A.monto_pagado,
        A.facturado,
        A.folioFactura,
        A.IdPrograma,
        Case A.IdPrograma
        When 5 Then 'Mejoravit'
        When 10 Then 'Hipoteca Verde'
        End As 'Programa',
        B.fecha_acepto_terminos,
        B.razon_social,
        B.numCuentaBroxel,
        B.haSidoLiquidadoMerchant,
        TRIM(B.rfc) As 'RFC',
        B.estado,
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
        End As 'Estado_Comercial',
        B.usuario_acepta_terminos As'Email'
      From
        [broxelco_rdg].[bp_detalle_diario_comercio] A with(nolock)
      Left Join
        [broxelco_rdg].[Comercio] B with(nolock) On A.comercio = B.comercio
      Where
        A.idPrograma In (5,10) And B.comercio Not In ('PROC. / MTTO. / CONSULTAS','TRANSFERENCIA A TERCEROS','TRASPASO DE SALDO','OPERACIONES','01800 COMPRAS','15CBX00312','15CBX00313','15CBX00315','15CBX00327','15CBX00328','16ADM00001','16ADM00002','16ADM00003','16ADM00004','16ADM00005','16ADM00006','16ADM00007','16ADM00008','16ADM00014','16CBX00046','16CBX00057','16CBX00058','16CBX00062','16CBX00071','16CBX00072','16CBX00078','16CBX00079','16CBX00086','16CBX00087','16CBX00088','16CBX00101','16CBX00109','16CBX00110','16PS00001','16PS00002','16PS00003','16PS00004','COMISION POR DISPOSICION DE CREDITO','DEMO','DEVOLUCION CUENTA EXTERNA','DISPOSICION DE CREDITO','16CBX00043','16CBX00063','CALLCENTER','16CBX00044','16CBX00054','16CBX00084','16ADM00009','16ADM00042','16CBX00045','16CBX00055','16CBX00085','16ADM00010','16ADM00018','16ADM00020','18CBX01048','16ADM00040','16ADM00011','16ADM00012','16ADM00013','16ADM00015','16ADM00016','16ADM00017','16ADM00019','16ADM00021','16ADM00022','16ADM00023','16ADM00024','16ADM00025','16ADM00026','16ADM00027','16ADM00028','16ADM00029','16ADM00030','16ADM00031','16ADM00032','16ADM00033','16ADM00034','16ADM00035','16ADM00036','16ADM00037','16ADM00038','16ADM00039','16ADM00041','16ADM00043','16ADM00044','16ADM00045','13CBX00001','13CBX00002','13CBX00003') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: importe_ventas {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_ventas ;;
  }

  dimension: importe_descuento {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_descuento ;;
  }

  dimension: iva {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.iva ;;
  }

  dimension: folio {
    type: string
    sql: ${TABLE}.folio ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.transacciones ;;
  }

  dimension: liquidacion_comercio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.liquidacion_comercio ;;
  }

  dimension: ref_pago {
    type: string
    sql: ${TABLE}.refPago ;;
  }

  dimension: clave_rastreo {
    type: string
    sql: ${TABLE}.claveRastreo ;;
  }

  dimension: st_pago {
    type: string
    sql: ${TABLE}.stPago ;;
  }

  dimension: motivo {
    type: string
    sql: ${TABLE}.motivo ;;
  }

  dimension: envio_pago {
    type: number
    sql: ${TABLE}.envioPago ;;
  }

  dimension: ventas {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ventas ;;
  }

  dimension: devoluciones {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.devoluciones ;;
  }

  dimension: monto_pagado {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.monto_pagado ;;
  }

  dimension: facturado {
    type: number
    sql: ${TABLE}.facturado ;;
  }

  dimension: folio_factura {
    type: string
    sql: ${TABLE}.folioFactura ;;
  }

  dimension: id_programa {
    type: number
    sql: ${TABLE}.IdPrograma ;;
  }

  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }

  dimension_group: fecha_acepto_terminos {
    type: time
    sql: ${TABLE}.fecha_acepto_terminos ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: num_cuenta_broxel {
    type: string
    sql: ${TABLE}.numCuentaBroxel ;;
  }

  dimension: ha_sido_liquidado_merchant {
    type: string
    sql: ${TABLE}.haSidoLiquidadoMerchant ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.estado ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }

######################################################

  measure: importe_ventas_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_ventas ;;
  }

  measure: importe_descuento_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_descuento ;;
  }

  measure: iva_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.iva ;;
  }

  measure: transacciones_sum {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  measure: liquidacion_comercio_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.liquidacion_comercio ;;
  }

  measure: ventas_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ventas ;;
  }

  measure: devoluciones_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.devoluciones ;;
  }

  measure: monto_pagado_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.monto_pagado ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${ventas_sum}/${transacciones_sum} ;;
  }

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.Estado_Comercial ;;
  }


  set: detail {
    fields: [
        id,
  comercio,
  importe_ventas,
  importe_descuento,
  iva,
  folio,
  transacciones,
  liquidacion_comercio,
  ref_pago,
  clave_rastreo,
  st_pago,
  motivo,
  envio_pago,
  ventas,
  devoluciones,
  monto_pagado,
  facturado,
  folio_factura,
  id_programa,
  programa,
  fecha_acepto_terminos_time,
  razon_social,
  num_cuenta_broxel,
  ha_sido_liquidado_merchant,
  rfc,
  estado,
  estado_comercial,
  email
    ]
  }
}
