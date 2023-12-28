
view: programas_sociales_all {
  derived_table: {
    sql:
    Select
        D.Comercio,
        D.Fecha,
        D.Mes_txt,
        D.NombreMedidas,
        UPPER(E.razon_social) As 'razon_social',
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
        CONVERT(DATE,DATENAME(M,D.Mes_txt) + ' ' + DATENAME(Y,D.Mes_txt)) As 'mes_txt2',
        F.Puntos_de_Venta

      From
      (
      Select
      Comercio,
      Fecha,
      Mes_txt,
      Case
      When NombreMedidas = 'Renueva' Then NombreMedidas
      Else SUBSTRING(NombreMedidas,2,LEN(NombreMedidas)-1)
      End As 'NombreMedidas',
      email_contacto,
      Usuario,
      ventas,
      CAST(devoluciones As Decimal (32,2)) As 'devoluciones',
      CAST(iva As Float) As 'iva',
      importe_ventas,
      CAST(importe_descuento As Decimal(32,2))As 'importe_descuento',
      CAST(transacciones As Decimal (32,2)) As 'transacciones',
      EstadoFiscal,
      MunicipioComercial As 'Municipio_Comercial'
      From
      dbo.Consolidadov6

      Union All

      Select
      A.Comercio,
      A.Fecha,
      DATETRUNC(MONTH,A.Fecha) AS 'Mes_txt',
      Case
      When A.idPrograma = '5' Then 'Mejoravit'
      When A.idPrograma = '10' Then 'Hipoteca Verde'
      When A.idPrograma = '219' Then 'Renueva'
      When A.idPrograma = '220' Then 'Repara'
      When A.idPrograma = '223' Then 'Equipa Tu Casa'
      End As 'Nombre de medidas',
      B.email_contacto,
      'Si' As 'Usuario',
      A.ventas,
      A.devoluciones,
      A.iva,
      A.importe_ventas, --Este campo se toma en cuenta para renueva y repara
      A.importe_descuento,
      A.transacciones,
      B.estado As 'Estado Fiscal',
      B.delegacionComercial As 'Municipio_Comercial'
      From
      broxelco_rdg.bp_detalle_diario_comercio A
      Left Join
      broxelco_rdg.Comercio B  On A.comercio = B.Comercio
      Left Join
      broxelco_rdg.ComercioNoReportar C On A.comercio = C.Comercio
      Where
      A.fecha Between '2023-09-01' And '2023-12-31' And A.idPrograma In ('5','10','219','220','223') And C.Comercio Is Null
      ) D

      Left Join
      (
      Select
      comercio,
      Case
      WHEN estadoComercial Like '%cdmx%' Or estadoComercial Like '%ciudad de m%' Or estadoComercial Like '%CIUDAD DE M%' Or estadoComercial Like '%FEDERAL%' Or estadoComercial Like '%D.F.%' Or estadoComercial Like '%DF%' Or estadoComercial Like '%CMDX%' Then 'DISTRITO FEDERAL'
      WHEN estadoComercial Like '%xico%' Or estadoComercial Like '%Edo. Méx' Or estadoComercial Like '%EDO MEX%' Or estadoComercial = 'MEX' Or estadoComercial = 'MEX.' Or estadoComercial Like '%Edo. Mex.%'  Then 'ESTADO DE MÉXICO'
      WHEN estadoComercial Like '%uebl%' Then 'PUEBLA'
      WHEN estadoComercial Like '%guerr%' Then 'GUERRERO'
      WHEN estadoComercial Like '%quer%' Then 'QUERÉTARO'
      WHEN estadoComercial Like '%nuevo le%' Or estadoComercial Like '%nuevo le%' Or estadoComercial Like '%NUENO LEON%' Then 'NUEVO LEÓN'
      WHEN estadoComercial = 'Baja California' Or estadoComercial = 'Baja California ' Or estadoComercial = 'BAJA CALIFORNA ' Or estadoComercial = 'Baja California Norte ' Or estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'BAJA CALIFORNIA'
      WHEN estadoComercial Like '%sur%' Then 'BAJA CALIFORNIA SUR'
      WHEN estadoComercial Like '%campech%' Then 'CAMPECHE'
      WHEN estadoComercial Like '%chiap%' Then 'CHIAPAS'
      WHEN estadoComercial Like '%aulipa%' Then 'TAMAULIPAS'
      WHEN estadoComercial Like '%jalis%' Then 'JALISCO'
      WHEN estadoComercial Like '%sonor%' Then 'SONORA'
      WHEN estadoComercial Like '%naya%' Then 'NAYARIT'
      WHEN estadoComercial Like '%micho%' Then 'MICHOACAN'
      WHEN estadoComercial Like '%potos%' Then 'SAN LUIS POTOSÍ'
      WHEN estadoComercial Like '%oahu%' Then 'COAHUILA'
      WHEN estadoComercial Like '%vera%' Then 'VERACRUZ'
      WHEN estadoComercial Like '%yuca%' Then 'YUCATÁN'
      WHEN estadoComercial Like '%more%' Then 'MORELOS'
      WHEN estadoComercial Like '%chih%' Then 'CHIHUAHUA'
      WHEN estadoComercial Like '%zaca%' Then 'ZACATECAS'
      WHEN estadoComercial Like '%guana%' Then 'GUANAJUATO'
      WHEN estadoComercial Like '%roo%' Then 'QUINTANA ROO'
      WHEN estadoComercial Like '%coli%' Then 'COLIMA'
      WHEN estadoComercial Like '%aguas%' Then 'AGUASCALIENTES'
      WHEN estadoComercial Like '%oax%' Then 'OAXACA'
      WHEN estadoComercial Like '%sina%' Then 'SINALOA'
      WHEN estadoComercial Like '%chia%' Then 'CHIAPAS'
      WHEN estadoComercial Like '%dura%' Then 'DURANGO'
      WHEN estadoComercial Like '%hidal%' Then 'HIDALGO'
      WHEN estadoComercial Like '%tlax%' Then 'TLAXCALA'
      WHEN estadoComercial Like '%taba%' Then 'TABASCO'
      Else 'ESTADO DE MÉXICO'
      End As 'Estado_Comercial',
      razon_social,
      rfc
      From
      broxelco_rdg.Comercio With (Nolock)
      ) E On E.Comercio = D.Comercio

      Left Join
      (
      Select --Conteo de Puntos de venta
      COUNT(Distinct D.Comercio) As 'Puntos_de_Venta',
      D.NombreMedidas,
      E.Estado_Comercial,
      CONCAT( D.NombreMedidas, '_', E.Estado_Comercial) As 'KeyId'
      From
      (
      Select
      Comercio,
      Fecha,
      Mes_txt,
      Case
      When NombreMedidas = 'Renueva' Then NombreMedidas
      Else SUBSTRING(NombreMedidas,2,LEN(NombreMedidas)-1)
      End As 'NombreMedidas',
      email_contacto,
      Usuario,
      ventas,
      CAST(devoluciones As Decimal (32,2)) As 'devoluciones',
      CAST(iva As Float) As 'iva',
      importe_ventas,
      CAST(importe_descuento As Decimal(32,2))As 'importe_descuento',
      CAST(transacciones As Decimal (32,2)) As 'transacciones',
      EstadoFiscal,
      MunicipioComercial As 'Municipio_Comercial'
      From
      dbo.Consolidadov6

      Union All

      Select
      A.Comercio,
      A.Fecha,
      DATETRUNC(MONTH,A.Fecha) AS 'Mes_txt',
      Case
      When A.idPrograma = '5' Then 'Mejoravit'
      When A.idPrograma = '10' Then 'Hipoteca Verde'
      When A.idPrograma = '219' Then 'Renueva'
      When A.idPrograma = '220' Then 'Repara'
      When A.idPrograma = '223' Then 'Equipa Tu Casa'
      End As 'Nombre de medidas',
      B.email_contacto,
      'Si' As 'Usuario',
      A.ventas,
      A.devoluciones,
      A.iva,
      A.importe_ventas, --Este campo se toma en cuenta para renueva y repara
      A.importe_descuento,
      A.transacciones,
      B.estado As 'Estado Fiscal',
      B.delegacionComercial As 'Municipio_Comercial'
      From
      broxelco_rdg.bp_detalle_diario_comercio A With (Nolock)
      Left Join
      broxelco_rdg.Comercio B  With (Nolock) On A.comercio = B.Comercio
      Left Join
      broxelco_rdg.ComercioNoReportar C With (Nolock)On A.comercio = C.Comercio
      Where
      A.fecha Between '2023-09-01' And '2023-12-31' And A.idPrograma In ('5','10','219','220','223') And C.Comercio Is Null
      ) D

      Left Join
      (
      Select
      comercio,
      Case
      WHEN estadoComercial Like '%cdmx%' Or estadoComercial Like '%ciudad de m%' Or estadoComercial Like '%CIUDAD DE M%' Or estadoComercial Like '%FEDERAL%' Or estadoComercial Like '%D.F.%' Or estadoComercial Like '%DF%' Or estadoComercial Like '%CMDX%' Then 'DISTRITO FEDERAL'
      WHEN estadoComercial Like '%xico%' Or estadoComercial Like '%Edo. Méx' Or estadoComercial Like '%EDO MEX%' Or estadoComercial = 'MEX' Or estadoComercial = 'MEX.' Or estadoComercial Like '%Edo. Mex.%'  Then 'ESTADO DE MÉXICO'
      WHEN estadoComercial Like '%uebl%' Then 'PUEBLA'
      WHEN estadoComercial Like '%guerr%' Then 'GUERRERO'
      WHEN estadoComercial Like '%quer%' Then 'QUERÉTARO'
      WHEN estadoComercial Like '%nuevo le%' Or estadoComercial Like '%nuevo le%' Or estadoComercial Like '%NUENO LEON%' Then 'NUEVO LEÓN'
      WHEN estadoComercial = 'Baja California' Or estadoComercial = 'Baja California ' Or estadoComercial = 'BAJA CALIFORNA ' Or estadoComercial = 'Baja California Norte ' Or estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'BAJA CALIFORNIA'
      WHEN estadoComercial Like '%sur%' Then 'BAJA CALIFORNIA SUR'
      WHEN estadoComercial Like '%campech%' Then 'CAMPECHE'
      WHEN estadoComercial Like '%chiap%' Then 'CHIAPAS'
      WHEN estadoComercial Like '%aulipa%' Then 'TAMAULIPAS'
      WHEN estadoComercial Like '%jalis%' Then 'JALISCO'
      WHEN estadoComercial Like '%sonor%' Then 'SONORA'
      WHEN estadoComercial Like '%naya%' Then 'NAYARIT'
      WHEN estadoComercial Like '%micho%' Then 'MICHOACAN'
      WHEN estadoComercial Like '%potos%' Then 'SAN LUIS POTOSÍ'
      WHEN estadoComercial Like '%oahu%' Then 'COAHUILA'
      WHEN estadoComercial Like '%vera%' Then 'VERACRUZ'
      WHEN estadoComercial Like '%yuca%' Then 'YUCATÁN'
      WHEN estadoComercial Like '%more%' Then 'MORELOS'
      WHEN estadoComercial Like '%chih%' Then 'CHIHUAHUA'
      WHEN estadoComercial Like '%zaca%' Then 'ZACATECAS'
      WHEN estadoComercial Like '%guana%' Then 'GUANAJUATO'
      WHEN estadoComercial Like '%roo%' Then 'QUINTANA ROO'
      WHEN estadoComercial Like '%coli%' Then 'COLIMA'
      WHEN estadoComercial Like '%aguas%' Then 'AGUASCALIENTES'
      WHEN estadoComercial Like '%oax%' Then 'OAXACA'
      WHEN estadoComercial Like '%sina%' Then 'SINALOA'
      WHEN estadoComercial Like '%chia%' Then 'CHIAPAS'
      WHEN estadoComercial Like '%dura%' Then 'DURANGO'
      WHEN estadoComercial Like '%hidal%' Then 'HIDALGO'
      WHEN estadoComercial Like '%tlax%' Then 'TLAXCALA'
      WHEN estadoComercial Like '%taba%' Then 'TABASCO'
      Else 'ESTADO DE MÉXICO'
      End As 'Estado_Comercial',
      razon_social,
      rfc
      From
      broxelco_rdg.Comercio With (Nolock)
      ) E On E.Comercio = D.Comercio
      Group By
      D.NombreMedidas,
      E.Estado_Comercial
      )F On CONCAT(D.NombreMedidas,'_',E.Estado_Comercial) = F.KeyId ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: fecha {
    type: date
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
    value_format: "#,##0.00;-#,##0.00"
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

  dimension: mes_txt2 {
    type: string
    sql: ${TABLE}.mes_txt ;;
    html: {{ rendered_value | date: "%B %Y" }};;

  }

  dimension_group: mes_txt2 {
    type: time
    timeframes: [
      date,
      month_name,
      month_num,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.mes_txt2 ;;
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
    value_format: "#,##0.00;-#,##0.00"
    sql: ${TABLE}.transacciones ;;
  }

  dimension: filtro_comercio{
    type: string
    sql:
      Case
      When rfc In ('HDM001017AS1','COP920428Q20','DLI931201MI9') Then razon_social
      Else ''
      End ;;
  }

  measure: puntos_de_venta {
    type: max
    sql: ${TABLE}.Puntos_de_Venta ;;
  }

  measure: puntosdeventa {
    type: count_distinct
    sql: ${TABLE}.comercio ;;
  }

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.estado_comercial ;;
  }

  set: detail {
    fields: [
      comercio,
      fecha,
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
      mes_txt2,
      puntos_de_venta

    ]
  }
}
