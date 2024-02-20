view: grl08_liquidacion_comercios {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIPlata.GRL08_LiquidacionComercios` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: _is_deleted {
    type: yesno
    sql: ${TABLE}._is_deleted ;;
  }
  dimension: _row_id {
    type: string
    sql: ${TABLE}._row_id ;;
  }
  dimension: _sequence_num {
    type: number
    sql: ${TABLE}._sequence_num ;;
  }
  dimension: _source_timestamp {
    type: number
    sql: ${TABLE}._source_timestamp ;;
  }
  dimension: amonestaciones {
    type: number
    sql: ${TABLE}.amonestaciones ;;
  }
  dimension: cfdi {
    type: string
    sql: ${TABLE}.cfdi ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: clave_rastreo {
    type: string
    sql: ${TABLE}.claveRastreo ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.comercio ;;
  }
  dimension: comercio_no_reportar {
    type: string
    sql: ${TABLE}.ComercioNoReportar ;;
  }
  dimension: cp_comercial {
    type: string
    sql: ${TABLE}.cpComercial ;;
  }
  dimension: delegacion_comercial {
    type: string
    sql: ${TABLE}.delegacionComercial ;;
  }
  dimension: devoluciones {
    type: number
    sql: ${TABLE}.devoluciones ;;
  }
  dimension: email_avisos {
    type: string
    sql: ${TABLE}.email_avisos ;;
  }
  dimension: email_contacto {
    type: string
    sql: ${TABLE}.email_contacto ;;
  }
  dimension: envio_pago {
    type: number
    sql: ${TABLE}.envioPago ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: estado_comercial {
    type: string
    sql:
      Case
      When comercio = '23CBX00958' Then 'Hidalgo'
      When Comercio = '23CBX00980' Then 'Jalisco'
      When lower(${TABLE}.estadoComercial) Like '%cdmx%' Or lower(${TABLE}.estadoComercial) Like '%ciudad de m%' Or lower(${TABLE}.estadoComercial) Like '%ciudad de m%' Or lower(${TABLE}.estadoComercial) Like '%federal%' Or lower(${TABLE}.estadoComercial) Like '%d.f.%' Or lower(${TABLE}.estadoComercial) Like '%df%' Or lower(${TABLE}.estadoComercial) Like '%cdmx%' Or lower(${TABLE}.estadoComercial) Like '%dad de m%' Or lower(${TABLE}.estadoComercial) Like '%cmdx%' Then 'Distrito Federal'
      When lower(${TABLE}.estadoComercial) Like '%xico%' Or lower(${TABLE}.estadoComercial) Like '%edo. méx' Or lower(${TABLE}.estadoComercial) Like '%edo mes%' Or lower(${TABLE}.estadoComercial) In ('MEX','MEX.') Or lower(${TABLE}.estadoComercial) Like '%edo. mex.%'  Then 'México'
      When lower(${TABLE}.estadoComercial) Like '%uebl%' Then 'Puebla'
      When lower(${TABLE}.estadoComercial) Like '%guerr%' Then 'Guerrero'
      When lower(${TABLE}.estadoComercial) Like '%quer%' Then 'Querétaro'
      When lower(${TABLE}.estadoComercial) Like '%nuevo l%' Or lower(${TABLE}.estadoComercial) In ('n.l.','monterrey') Or lower(${TABLE}.estadoComercial) Like '%leon%' Then 'Nuevo León'
      When lower(${TABLE}.estadoComercial) in ('baja california', 'baja california ','baja california norte ','baja california norte') Or ${TABLE}.estadoComercial In ('BAJA CALIFORNA ','Baja California') Or lower(${TABLE}.estadoComercial) like '%norte%'  Then 'Baja California'
      When lower(${TABLE}.estadoComercial) Like '%sur%' Then 'Baja California Sur'
      When lower(${TABLE}.estadoComercial) Like '%campech%' Or lower(${TABLE}.estadoComercial) like '%campe%' Then 'Campeche'
      When lower(${TABLE}.estadoComercial) Like '%chiap%' Then 'Chiapas'
      When lower(${TABLE}.estadoComercial) Like '%aulipa%' Then 'Tamaulipas'
      When lower(${TABLE}.estadoComercial) Like '%jalis%' Then 'Jalisco'
      When lower(${TABLE}.estadoComercial) Like '%sonor%' Or lower(${TABLE}.estadoComercial) = 'son' Then 'Sonora'
      When lower(${TABLE}.estadoComercial) Like '%naya%' Then 'Nayarit'
      When lower(${TABLE}.estadoComercial) Like '%micho%' Then 'Michoacán de Ocampo'
      When lower(${TABLE}.estadoComercial) Like '%potos%' Or lower(${TABLE}.estadoComercial) = 's.l.p.' Then 'San Luis Potosí'
      When lower(${TABLE}.estadoComercial) Like '%oahu%' Or lower(${TABLE}.estadoComercial) Like '%uila%' Then 'Coahuila de Zaragoza'
      When lower(${TABLE}.estadoComercial) Like '%ver%' Then 'Veracruz de Ignacio de la Llave'
      When lower(${TABLE}.estadoComercial) Like '%yuca%' Then 'Yucatán'
      When lower(${TABLE}.estadoComercial) Like '%more%' Or lower(${TABLE}.estadoComercial) Like '%mor%' Then 'Morelos'
      When lower(${TABLE}.estadoComercial) Like '%chih%' Then 'Chihuahua'
      When lower(${TABLE}.estadoComercial) Like '%zaca%' Then 'Zacatecas'
      When lower(${TABLE}.estadoComercial) Like '%guana%' Then 'Guanajuato'
      When lower(${TABLE}.estadoComercial) Like '%roo%' Then 'Quintana Roo'
      When lower(${TABLE}.estadoComercial) Like '%coli%' Then 'Colima'
      When lower(${TABLE}.estadoComercial) Like '%aguas%' Then 'Aguascalientes'
      When lower(${TABLE}.estadoComercial) Like '%oax%' Then 'Oaxaca'
      When lower(${TABLE}.estadoComercial) Like '%sina%' Then 'Sinaloa'
      When lower(${TABLE}.estadoComercial) Like '%chia%' Then 'Chiapas'
      When lower(${TABLE}.estadoComercial) Like '%dura%' Then 'Durango'
      When lower(${TABLE}.estadoComercial) Like '%hidal%' Then 'Hidalgo'
      When lower(${TABLE}.estadoComercial) Like '%tlax%' Then 'Tlaxcala'
      When lower(${TABLE}.estadoComercial) Like '%taba%' Then 'Tabasco'
      Else 'México'
      End ;;
  }
  dimension: facturado {
    type: number
    sql: ${TABLE}.facturado ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }
  dimension_group: fecha_alta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.fecha_alta ;;
  }
  dimension_group: fecha_amonestacion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha_amonestacion ;;
  }
  dimension_group: fecha_cert_of {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.fechaCertOF ;;
  }
  dimension_group: fecha_insercion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fechaInsercion ;;
  }
  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaPago ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.folio ;;
  }
  dimension: folio_factura {
    type: string
    sql: ${TABLE}.folioFactura ;;
  }
  dimension: id_programa {
    type: number
    sql: ${TABLE}.idPrograma ;;
  }
  dimension: importe_descuento {
    type: number
    sql: ${TABLE}.importe_descuento ;;
  }
  dimension: importe_ventas {
    type: number
    hidden: yes
    sql: ${TABLE}.importe_ventas ;;
  }
  dimension: iva {
    type: number
    sql: ${TABLE}.iva ;;
  }
  dimension: liquidacion_comercio {
    type: number
    sql: ${TABLE}.liquidacion_comercio ;;
  }
  dimension: monto_pagado {
    type: number
    sql: ${TABLE}.monto_pagado ;;
  }
  dimension: motivo {
    type: string
    sql: ${TABLE}.motivo ;;
  }
  dimension: num_cuenta_broxel {
    type: string
    sql: ${TABLE}.numCuentaBroxel ;;
  }
  dimension: of_num_empleados_sucursal {
    type: number
    sql: ${TABLE}.ofNumEmpleadosSucursal ;;
  }
  dimension: processor {
    type: number
    sql: ${TABLE}.processor ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }
  dimension: ref_pago {
    type: string
    sql: ${TABLE}.refPago ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }
  dimension: st_pago {
    type: string
    sql: ${TABLE}.stPago ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }
  dimension: sub_tipo_transaccion {
    type: number
    sql: ${TABLE}.SubTipoTransaccion ;;
  }
  dimension: tiene_usuario_fintech {
    type: number
    sql: ${TABLE}.tieneUsuarioFintech ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.transacciones ;;
  }
  dimension: ventas {
    type: number
    sql: ${TABLE}.ventas ;;
  }
  dimension: ventas_anuales_py {
    type: number
    sql: ${TABLE}.ventasAnualesPY ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  ########################################

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${estado_comercial} ;;
  }
  measure: sum_importe_ventas {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    label: "Importe Ventas"
    sql: ${TABLE}.importe_ventas ;;
    }
  dimension: fecha_c {
    type: string
    sql: ${fecha_month} ;;
    html: {{ rendered_value | date: "%B %Y" }} ;;
    }
  dimension: estatus {
    type: string
    label: "Estatus"
    sql: case when ${TABLE}.comercio is not null then '' else null end ;;
  }
  dimension: black_list {
    type: string
    label: "Black List"
    sql: case when ${TABLE}.comercio is not null then '' else null end ;;
  }
  dimension: fecha_de_ingreso_a_black_list {
    type: string
    label: "Fecha de Ingreso a Black List"
    sql: case when ${TABLE}.comercio is not null then '' else null end ;;
  }
  dimension: fecha_de_salida_de_black_list {
    type: string
    label: "Fecha de Salida de Black List"
    sql: case when ${TABLE}.comercio is not null then '' else null end ;;
  }
}
