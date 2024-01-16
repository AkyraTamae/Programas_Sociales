
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
        F.Puntos_de_Venta_Estado_Comercial_Comercios,
        F.KeyId,
        G.Fecha_de_Alta

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
      A.fecha Between '2023-09-01' And '2024-01-31' And A.idPrograma In ('5','10','219','220','223') And C.Comercio Is Null
      ) D

      Left Join
      (
      Select
      comercio,
      Case
      WHEN Comercio = '23CBX00958' Then 'Hidalgo'
      WHEN Comercio = '23CBX00980' Then 'Jalisco'
      WHEN estadoComercial Like '%cdmx%' Or estadoComercial Like '%ciudad de m%' Or estadoComercial Like '%CIUDAD DE M%' Or estadoComercial Like '%FEDERAL%' Or estadoComercial Like '%D.F.%' Or estadoComercial Like '%DF%' Or estadoComercial Like '%CMDX%' Then 'Distrito Federal'
      WHEN estadoComercial Like '%xico%' Or estadoComercial Like '%Edo. Méx' Or estadoComercial Like '%EDO MEX%' Or estadoComercial = 'MEX' Or estadoComercial = 'MEX.' Or estadoComercial Like '%Edo. Mex.%'  Then 'México'
      WHEN estadoComercial Like '%uebl%' Then 'Puebla'
      WHEN estadoComercial Like '%guerr%' Then 'Guerrero'
      WHEN estadoComercial Like '%quer%' Then 'Querétaro'
      WHEN estadoComercial Like '%nuevo le%' Or estadoComercial Like '%nuevo le%' Or estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
      WHEN estadoComercial = 'Baja California' Or estadoComercial = 'Baja California ' Or estadoComercial = 'BAJA CALIFORNA ' Or estadoComercial = 'Baja California Norte ' Or estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
      WHEN estadoComercial Like '%sur%' Then 'Baja California Sur'
      WHEN estadoComercial Like '%campech%' Then 'Campeche'
      WHEN estadoComercial Like '%chiap%' Then 'Chiapas'
      WHEN estadoComercial Like '%aulipa%' Then 'Tamaulipas'
      WHEN estadoComercial Like '%jalis%' Then 'Jalisco'
      WHEN estadoComercial Like '%sonor%' Then 'Sonora'
      WHEN estadoComercial Like '%naya%' Then 'Nayarit'
      WHEN estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
      WHEN estadoComercial Like '%potos%' Then 'San Luis Potosí'
      WHEN estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
      WHEN estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
      WHEN estadoComercial Like '%yuca%' Then 'Yucatán'
      WHEN estadoComercial Like '%more%' Then 'Morelos'
      WHEN estadoComercial Like '%chih%' Then 'Chihuahua'
      WHEN estadoComercial Like '%zaca%' Then 'Zacatecas'
      WHEN estadoComercial Like '%guana%' Then 'Guanajuato'
      WHEN estadoComercial Like '%roo%' Then 'Quintana Roo'
      WHEN estadoComercial Like '%coli%' Then 'Colima'
      WHEN estadoComercial Like '%aguas%' Then 'Aguascalientes'
      WHEN estadoComercial Like '%oax%' Then 'Oaxaca'
      WHEN estadoComercial Like '%sina%' Then 'Sinaloa'
      WHEN estadoComercial Like '%chia%' Then 'Chiapas'
      WHEN estadoComercial Like '%dura%' Then 'Durango'
      WHEN estadoComercial Like '%hidal%' Then 'Hidalgo'
      WHEN estadoComercial Like '%tlax%' Then 'Tlaxcala'
      WHEN estadoComercial Like '%taba%' Then 'Tabasco'
      Else 'México'
      End As 'Estado_Comercial',
      razon_social,
      rfc
      From
      broxelco_rdg.Comercio With (Nolock)
      ) E On E.Comercio = D.Comercio
      Left Join
      (
      Select --Puntos de venta
      MAX(E.Puntos_de_venta2) As 'Puntos_de_Venta_Estado_Comercial_Comercios',
      CONCAT(E.Estado_Comercial, '_', E.NombreMedidas, '_', E.rfc) As 'KeyId'
      From
      (
      Select
      ROW_NUMBER() Over (Partition By CONCAT(D.Estado_Comercial, D.rfc, C.NombreMedidas) Order By D.rfc) 'Puntos_de_venta2',
      C.NombreMedidas,
      D.Estado_Comercial,
      D.rfc
      From
      (
      Select
      Comercio,
      Case
      When NombreMedidas = 'Renueva' Then NombreMedidas
      Else SUBSTRING(NombreMedidas,2,LEN(NombreMedidas)-1)
      End As 'NombreMedidas'
      From
      dbo.Consolidadov6

      Union All

      Select
      A.Comercio,
      Case
      When A.idPrograma = '5' Then 'Mejoravit'
      When A.idPrograma = '10' Then 'Hipoteca Verde'
      When A.idPrograma = '219' Then 'Renueva'
      When A.idPrograma = '220' Then 'Repara'
      When A.idPrograma = '223' Then 'Equipa Tu Casa'
      End As 'Nombre de medidas'
      From
      broxelco_rdg.bp_detalle_diario_comercio A With (Nolock)
      Left Join
      broxelco_rdg.ComercioNoReportar B With (Nolock)On A.comercio = B.Comercio
      Where
      A.fecha >= '2023-09-01' And A.idPrograma In ('5','10','219','220','223') And B.Comercio Is Null
      ) C
      Left Join
      (
      Select
      comercio,
      Case
      When comercio = '23CBX00958' Then 'Hidalgo'
      When Comercio = '23CBX00980' Then 'Jalisco'
      When estadoComercial Like '%cdmx%' Or estadoComercial Like '%ciudad de m%' Or estadoComercial Like '%CIUDAD DE M%' Or estadoComercial Like '%FEDERAL%' Or estadoComercial Like '%D.F.%' Or estadoComercial Like '%DF%' Or estadoComercial Like '%CMDX%' Then 'Distrito Federal'
      When estadoComercial Like '%xico%' Or estadoComercial Like '%Edo. Méx' Or estadoComercial Like '%EDO MEX%' Or estadoComercial = 'MEX' Or estadoComercial = 'MEX.' Or estadoComercial Like '%Edo. Mex.%'  Then 'México'
      When estadoComercial Like '%uebl%' Then 'Puebla'
      When estadoComercial Like '%guerr%' Then 'Guerrero'
      When estadoComercial Like '%quer%' Then 'Querétaro'
      When estadoComercial Like '%nuevo le%' Or estadoComercial Like '%nuevo le%' Or estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
      When estadoComercial = 'Baja California' Or estadoComercial = 'Baja California ' Or estadoComercial = 'BAJA CALIFORNA ' Or estadoComercial = 'Baja California Norte ' Or estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
      When estadoComercial Like '%sur%' Then 'Baja California Sur'
      When estadoComercial Like '%campech%' Then 'Campeche'
      When estadoComercial Like '%chiap%' Then 'Chiapas'
      When estadoComercial Like '%aulipa%' Then 'Tamaulipas'
      When estadoComercial Like '%jalis%' Then 'Jalisco'
      When estadoComercial Like '%sonor%' Then 'Sonora'
      When estadoComercial Like '%naya%' Then 'Nayarit'
      When estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
      When estadoComercial Like '%potos%' Then 'San Luis Potosí'
      When estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
      When estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
      When estadoComercial Like '%yuca%' Then 'Yucatán'
      When estadoComercial Like '%more%' Then 'Morelos'
      When estadoComercial Like '%chih%' Then 'Chihuahua'
      When estadoComercial Like '%zaca%' Then 'Zacatecas'
      When estadoComercial Like '%guana%' Then 'Guanajuato'
      When estadoComercial Like '%roo%' Then 'Quintana Roo'
      When estadoComercial Like '%coli%' Then 'Colima'
      When estadoComercial Like '%aguas%' Then 'Aguascalientes'
      When estadoComercial Like '%oax%' Then 'Oaxaca'
      When estadoComercial Like '%sina%' Then 'Sinaloa'
      When estadoComercial Like '%chia%' Then 'Chiapas'
      When estadoComercial Like '%dura%' Then 'Durango'
      When estadoComercial Like '%hidal%' Then 'Hidalgo'
      When estadoComercial Like '%tlax%' Then 'Tlaxcala'
      When estadoComercial Like '%taba%' Then 'Tabasco'
      Else 'México'
      End As 'Estado_Comercial',
      razon_social,
      rfc
      From
      broxelco_rdg.Comercio With (Nolock)
      ) D On D.Comercio = C.Comercio
      Group By
      C.NombreMedidas,
      D.Estado_Comercial,
      D.rfc,
      D.Comercio
      )E
      Group By
      E.NombreMedidas,
      E.Estado_Comercial,
      E.rfc
      )F On CONCAT(E.Estado_Comercial,'_',D.NombreMedidas, '_', E.rfc) = F.KeyId
      Left join
      (
      Select
      rfc,
      MIN(FechaHoraCreacion) As 'Fecha_de_Alta'
      From
      broxelco_rdg.Comercio With (Nolock)
      Group By
      rfc
      )G On E.rfc = G.rfc ;;
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

  measure: puntos_de_venta_estado_comercial_comercios {
    type: sum_distinct
    label: "Puntos de venta"
    sql_distinct_key: ${TABLE}.keyid ;;
    sql: ${TABLE}.puntos_de_venta_estado_comercial_comercios ;;
  }

  dimension: keyid {
    type: string
    sql: ${TABLE}.KeyId ;;
  }

  dimension_group: fecha_de_alta{
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    type: time
    sql: ${TABLE}.fecha_de_alta ;;
  }

  dimension: mes_txt2 {
    type: string
    sql: ${TABLE}.mes_txt ;;
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
      When rfc In ('HDM001017AS1','COP920428Q20','DLI931201MI9') Then razon_social
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
      puntos_de_venta_estado_comercial_comercios,
      keyid
    ]
  }
}
