
view: programas_sociales_all {
  derived_table: {
    sql:Select
  D.Comercio,
  D.Fecha,
  D.Mes_txt,
  D.NombreMedidas,
  UPPER(E.razon_social) As razon_social,
  E.rfc,
  D.email_contacto,
  D.Usuario,
  D.ventas,
  D.devoluciones,
  D.iva,
  D.importe_ventas,
  D.importe_descuento,
  D.transacciones,
  D.EstadoFiscal,
  E.Estado_Comercial,
  D.Municipio_Comercial,
  F.Fecha_de_Alta
From
  (
  Select
    Comercio,
    Fecha,
    Mes_txt,
    NombreMedidas ,
    email_contacto,
    Usuario,
    ventas,
    CAST(devoluciones As Numeric) As devoluciones,
    CAST(iva As Numeric) As iva,
    CAST(importe_ventas As Numeric) As importe_ventas,
    CAST(importe_descuento As Numeric) As importe_descuento,
    CAST(transacciones As Numeric) As transacciones,
    EstadoFiscal,
    MunicipioComercial As Municipio_Comercial
  From
    `mgcp-10078073-bxl-bi-snd.BIOro.ConsolidadoV6`

  Union All

  Select
    A.Comercio,
    A.Fecha,
    DATE_TRUNC(A.Fecha, MONTH) As Mes_txt,
    Case
    When A.idPrograma = 5 Then 'Mejoravit'
    When A.idPrograma = 10 Then 'Hipoteca Verde'
    When A.idPrograma = 219 Then 'Renueva'
    When A.idPrograma = 220 Then 'Repara'
    When A.idPrograma = 223 Then 'Equipa Tu Casa'
    End As Nombre_de_medidas,
    B.email_contacto,
    'Si' As Usuario,
    A.ventas,
    A.devoluciones,
    A.iva,
    A.importe_ventas, --Este campo se toma en cuenta para renueva y repara
    A.importe_descuento,
    A.transacciones,
    B.estado As Estado_Fiscal,
    B.delegacionComercial As Municipio_Comercial
  From
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.bp_detalle_diario_comercio` A
  Left Join
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio` B On A.comercio = B.Comercio
  Left Join
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ComercioNoReportar` C On A.comercio = C.Comercio
  Where
    A.fecha >= '2023-09-01' And A.idPrograma In (5, 10, 219, 220, 223) And C.Comercio Is Null
  ) D
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
    End As Estado_Comercial,
    razon_social,
    rfc
  From
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio`
  ) E On E.Comercio = D.Comercio
Left join
  (
  Select
    rfc,
    MIN(FechaHoraCreacion) As Fecha_de_Alta
  From
    `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio`
  Group By
    rfc
  )F On E.rfc = F.rfc ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: datetime
    sql: ${TABLE}.Fecha ;;
  }


  dimension: mes_txt {
    type: date
    sql: ${TABLE}.Mes_txt ;;
  }

  dimension: nombre_medidas {
    type: string
    sql: ${TABLE}.NombreMedidas ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }

  dimension: email_contacto {
    type: string
    sql: ${TABLE}.email_contacto ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
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

  dimension: iva {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.iva ;;
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

  dimension: transacciones {
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  dimension: estado_fiscal {
    type: string
    sql: ${TABLE}.EstadoFiscal ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
  }

  dimension: municipio_comercial {
    type: string
    sql: ${TABLE}.Municipio_Comercial ;;
  }

  measure: puntos_de_venta {
    type: count_distinct
    label: "Punto De Venta"
    sql: ${TABLE}.Comercio ;;
  }

  dimension: keyid {
    type: string
    hidden: yes
    sql: ${TABLE}.KeyId ;;
  }

  dimension_group: fecha_de_alta{
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    type: time
    sql: ${TABLE}.fecha_de_alta ;;
  }

  dimension: mes_txt2 {
    type: string
    label: "Mes"
    sql: ${TABLE}.Mes_txt ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  measure: total_ventas{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql:
      Case
      When NombreMedidas In ('Renueva','Repara','Equipa Tu Casa') Then importe_ventas
      When Fecha >= '2023-09-01' And NombreMedidas In ('Mejoravit','Hipoteca Verde') Then importe_ventas
      Else ventas
      End;;
  }

  measure: total_transacciones {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  dimension: filtro_comercio{
    type: string
    sql:
      Case
      When rfc In ('HDM001017AS1','COP920428Q20') Then razon_social
      Else ''
      End ;;
  }

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.estado_comercial ;;
  }

  set: detail {
    fields: [
      comercio,
      mes_txt,
      nombre_medidas,
      razon_social,
      rfc,
      email_contacto,
      usuario,
      ventas,
      devoluciones,
      iva,
      importe_ventas,
      importe_descuento,
      transacciones,
      estado_fiscal,
      estado_comercial,
      municipio_comercial,
      keyid
    ]
  }
}
