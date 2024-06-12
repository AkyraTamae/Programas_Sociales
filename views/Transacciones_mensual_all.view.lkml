view: transacciones_mensual_all {
  derived_table: {
    sql: Select
    AA.IdMovimiento,
    AA.Cuenta,
    AA.Comercio,
    AA.RazonSocial,
    AA.RFC,
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
    End As EstadoComercial,
    CAST(AA.Fecha As TimeStamp) As Fecha,
    AA.Monto,
    AA.NombreDeMedidas
    From
    (
    --Transacciones Mejoravit,Equipa, Renueva
    Select
    A.IdTransferencia As IdMovimiento,
    A.NumCuenta As Cuenta,
    A.DenMov As Comercio,
    B.razon_social As RazonSocial,
    B.rfc As RFC,
    B.estadoComercial,
    CAST(A.Fecha As Date) As Fecha,
    CAST(A.ImpTotal As Numeric) As Monto, --string
    Case
    When A.Producto = 'K182' Then 'Mejoravit'
    When A.Producto = 'K303' Then 'Equipa tu Casa'
    When A.Producto = 'K281' Then 'Renueva'
    End As NombreDeMedidas
    From
    `mgcp-10078073-bxl-dwh-prod.stg_BroxelPaymentsWS.PrePayStudioMovements` A
    Inner Join
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio` B On DenMov = Comercio
    Where
    A.Producto In ('K303','K281','K182') And CAST(A.Fecha As Date) > CURRENT_DATE() -180 And A.AuthorizationCode Is Not Null And B.comercio Not In (Select * From `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ComercioNoReportar`)

    Union All

    --Transacciones Repara
    Select
    A.id As IdMovimiento,
    A.NroRuc As Cuenta,
    A.DenMov As Comercio,
    B.razon_social As RazonSocial,
    B.rfc As RFC,
    B.estadoComercial,
    CAST(A.FClear As Date) As Fecha,
    A.ImpTotal As Monto,
    'Repara' As NombreDeMedidas
    From
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ind_movimientos` A
    Inner Join
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio` B On A.DenMov = B.Comercio
    Where
    A.CodPtoCuota = 'K671' And CAST(A.FClear As Date) > CURRENT_DATE() -180 And B.comercio Not In (select * From `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ComercioNoReportar`)
    )AA ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: string
    sql: ${TABLE}.IdMovimiento ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.EstadoComercial ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [date, month_name, month_num, year]
    sql: ${TABLE}.Fecha ;;
  }

  dimension: monto {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }

  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
  }

  dimension:  mexico_layer {
    type: string
    map_layer_name:  mexico_layer
    sql: ${TABLE}.EstadoComercial ;;
  }

  measure: sum_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }

  measure: ticket_promedio {
    type: number
    order_by_field: sum_monto
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${sum_monto}/${count} ;;
  }

  ###########################################

  dimension: fecha_txt {
    type: string
    sql: datetrunc(month,${TABLE}.Fecha) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  measure: prueba_2 {
    type: string
    sql: concat('En el mes de ***** ',' se registró un total de ', format(${count},'G'),' transacciones y un volumen de facturación de ',format(${sum_monto},'C','en-us'),'. Las ventas presentaron un decremento del ***** con relación al mes anterior. El Ticket Promedio global presentó un decremento del ***** con relación al mes anterior.') ;;
  }




  ###########################################

  set: detail {
    fields: [
        id_movimiento,
  cuenta,
  comercio,
  razon_social,
  rfc,
  estado_comercial,
  monto,
  nombre_de_medidas
    ]
  }
}
