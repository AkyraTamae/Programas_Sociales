view: presentaciones_ejecutivas_yy_renueva {
  derived_table: {
    sql: --Transacciones Equipa, Renueva
      Select
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
        COUNT(1) As 'Transacciones',
        AA.TransaccionesPrevio,
        SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) As 'Monto',
        AA.MontoPrevio,
        Case When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas',
        B.razon_social As 'RazonSocial',
        B.rfc As 'RFC',
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When B.Comercio = '23CBX00958' Then 'Hidalgo'
        When B.Comercio = '23CBX00980' Then 'Jalisco'
        --
        When B.estadoComercial Like '%cdmx%' Or B.estadoComercial Like '%ciudad de m%' Or B.estadoComercial Like '%CIUDAD DE M%' Or B.estadoComercial Like '%FEDERAL%' Or B.estadoComercial Like '%D.F.%' Or B.estadoComercial Like '%DF%' Or B.estadoComercial Like '%CMDX%' Then 'Distrito Federal'
        When B.estadoComercial Like '%xico%' Or B.estadoComercial Like '%Edo. Méx' Or B.estadoComercial Like '%EDO MEX%' Or B.estadoComercial = 'MEX' Or B.estadoComercial = 'MEX.' Or B.estadoComercial Like '%Edo. Mex.%'  Then 'México'
        When B.estadoComercial Like '%uebl%' Then 'Puebla'
        When B.estadoComercial Like '%guerr%' Then 'Guerrero'
        When B.estadoComercial Like '%quer%' Then 'Querétaro'
        When B.estadoComercial Like '%nuevo le%' Or B.estadoComercial Like '%nuevo le%' Or B.estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
        When B.estadoComercial = 'Baja California' Or B.estadoComercial = 'Baja California ' Or B.estadoComercial = 'BAJA CALIFORNA ' Or B.estadoComercial = 'Baja California Norte ' Or B.estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
        When B.estadoComercial Like '%sur%' Then 'Baja California Sur'
        When B.estadoComercial Like '%campech%' Then 'Campeche'
        When B.estadoComercial Like '%chiap%' Then 'Chiapas'
        When B.estadoComercial Like '%aulipa%' Then 'Tamaulipas'
        When B.estadoComercial Like '%jalis%' Then 'Jalisco'
        When B.estadoComercial Like '%sonor%' Then 'Sonora'
        When B.estadoComercial Like '%naya%' Then 'Nayarit'
        When B.estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
        When B.estadoComercial Like '%potos%' Then 'San Luis Potosí'
        When B.estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
        When B.estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
        When B.estadoComercial Like '%yuca%' Then 'Yucatán'
        When B.estadoComercial Like '%more%' Then 'Morelos'
        When B.estadoComercial Like '%chih%' Then 'Chihuahua'
        When B.estadoComercial Like '%zaca%' Then 'Zacatecas'
        When B.estadoComercial Like '%guana%' Then 'Guanajuato'
        When B.estadoComercial Like '%roo%' Then 'Quintana Roo'
        When B.estadoComercial Like '%coli%' Then 'Colima'
        When B.estadoComercial Like '%aguas%' Then 'Aguascalientes'
        When B.estadoComercial Like '%oax%' Then 'Oaxaca'
        When B.estadoComercial Like '%sina%' Then 'Sinaloa'
        When B.estadoComercial Like '%chia%' Then 'Chiapas'
        When B.estadoComercial Like '%dura%' Then 'Durango'
        When B.estadoComercial Like '%hidal%' Then 'Hidalgo'
        When B.estadoComercial Like '%tlax%' Then 'Tlaxcala'
        When B.estadoComercial Like '%taba%' Then 'Tabasco'
        Else 'México'
        End As 'Estado_Comercial'
      From
        [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
      Left Join
        (
        Select
          DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
          COUNT(1) As 'TransaccionesPrevio',
          SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) As 'MontoPrevio',
          Case When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas'
        From
          [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
        Inner Join
          [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
        Where
          Producto In ('K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
        Group By
          DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
          A.Producto
        )AA On DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) = DATEADD(MONTH,1,AA.Fecha) And Case When A.Producto = 'K303' Then 'Equipa Tu Casa' When A.Producto = 'K281' Then 'Renueva' End = AA.NombreDeMedidas
      Where
        Producto In ('K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
      Group By
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
        A.Producto,
        AA.MontoPrevio,
        AA.TransaccionesPrevio,
        B.razon_social,
        B.rfc,
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When B.Comercio = '23CBX00958' Then 'Hidalgo'
        When B.Comercio = '23CBX00980' Then 'Jalisco'
        --
        When B.estadoComercial Like '%cdmx%' Or B.estadoComercial Like '%ciudad de m%' Or B.estadoComercial Like '%CIUDAD DE M%' Or B.estadoComercial Like '%FEDERAL%' Or B.estadoComercial Like '%D.F.%' Or B.estadoComercial Like '%DF%' Or B.estadoComercial Like '%CMDX%' Then 'Distrito Federal'
        When B.estadoComercial Like '%xico%' Or B.estadoComercial Like '%Edo. Méx' Or B.estadoComercial Like '%EDO MEX%' Or B.estadoComercial = 'MEX' Or B.estadoComercial = 'MEX.' Or B.estadoComercial Like '%Edo. Mex.%'  Then 'México'
        When B.estadoComercial Like '%uebl%' Then 'Puebla'
        When B.estadoComercial Like '%guerr%' Then 'Guerrero'
        When B.estadoComercial Like '%quer%' Then 'Querétaro'
        When B.estadoComercial Like '%nuevo le%' Or B.estadoComercial Like '%nuevo le%' Or B.estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
        When B.estadoComercial = 'Baja California' Or B.estadoComercial = 'Baja California ' Or B.estadoComercial = 'BAJA CALIFORNA ' Or B.estadoComercial = 'Baja California Norte ' Or B.estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
        When B.estadoComercial Like '%sur%' Then 'Baja California Sur'
        When B.estadoComercial Like '%campech%' Then 'Campeche'
        When B.estadoComercial Like '%chiap%' Then 'Chiapas'
        When B.estadoComercial Like '%aulipa%' Then 'Tamaulipas'
        When B.estadoComercial Like '%jalis%' Then 'Jalisco'
        When B.estadoComercial Like '%sonor%' Then 'Sonora'
        When B.estadoComercial Like '%naya%' Then 'Nayarit'
        When B.estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
        When B.estadoComercial Like '%potos%' Then 'San Luis Potosí'
        When B.estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
        When B.estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
        When B.estadoComercial Like '%yuca%' Then 'Yucatán'
        When B.estadoComercial Like '%more%' Then 'Morelos'
        When B.estadoComercial Like '%chih%' Then 'Chihuahua'
        When B.estadoComercial Like '%zaca%' Then 'Zacatecas'
        When B.estadoComercial Like '%guana%' Then 'Guanajuato'
        When B.estadoComercial Like '%roo%' Then 'Quintana Roo'
        When B.estadoComercial Like '%coli%' Then 'Colima'
        When B.estadoComercial Like '%aguas%' Then 'Aguascalientes'
        When B.estadoComercial Like '%oax%' Then 'Oaxaca'
        When B.estadoComercial Like '%sina%' Then 'Sinaloa'
        When B.estadoComercial Like '%chia%' Then 'Chiapas'
        When B.estadoComercial Like '%dura%' Then 'Durango'
        When B.estadoComercial Like '%hidal%' Then 'Hidalgo'
        When B.estadoComercial Like '%tlax%' Then 'Tlaxcala'
        When B.estadoComercial Like '%taba%' Then 'Tabasco'
        Else 'México'
        End  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha {
    type: time
    timeframes: [date, month_name, month_num, year]
    sql: ${TABLE}.Fecha ;;
  }

  dimension: transacciones {
    type: number
    hidden: yes
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: transacciones_previo {
    type: number
    hidden: yes
    sql: ${TABLE}.TransaccionesPrevio ;;
  }

  dimension: monto {
    type: number
    hidden: yes
    sql: ${TABLE}.Monto ;;
  }

  dimension: monto_previo {
    type: number
    hidden: yes
    sql: ${TABLE}.MontoPrevio ;;
  }

  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
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
    sql: ${TABLE}.Estado_Comercial ;;
  }

  ####################################

  dimension: month_name {
    type: string
    order_by_field: fecha_date
    sql:
    case
    when month(${fecha_date}) = 1 then concat('Enero ', ${fecha_year})
    when month(${fecha_date}) = 2 then concat('Febrero ', ${fecha_year})
    when month(${fecha_date}) = 3 then concat('Marzo ', ${fecha_year})
    when month(${fecha_date}) = 4 then concat('Abril ', ${fecha_year})
    when month(${fecha_date}) = 5 then concat('Mayo ', ${fecha_year})
    when month(${fecha_date}) = 6 then concat('Junio ', ${fecha_year})
    when month(${fecha_date}) = 7 then concat('Julio ', ${fecha_year})
    when month(${fecha_date}) = 8 then concat('Agosto ', ${fecha_year})
    when month(${fecha_date}) = 9 then concat('Septiembre ', ${fecha_year})
    when month(${fecha_date}) = 10 then concat('Octubre ', ${fecha_year})
    when month(${fecha_date}) = 11 then concat('Noviembre ', ${fecha_year})
    when month(${fecha_date}) = 12 then concat('Diciembre ', ${fecha_year})
    end  ;;
  }

  measure: transacciones_sum {
    type: sum
    value_format: "#,##0"
    sql: ${transacciones} ;;
  }

  measure: transacciones_previo_max  {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.TransaccionesPrevio ;;
  }

  measure: monto_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto} ;;
  }

  measure: monto_previo_max {
    type: max
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoPrevio ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: sum(${TABLE}.Monto) / sum(${TABLE}.Transacciones) ;;
  }

  measure: ticket_promedio_previo {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: max(${TABLE}.MontoPrevio) / max(${TABLE}.TransaccionesPrevio) ;;
  }

  measure: month_over_month_monto {
    type: number
    value_format: "0.00%"
    sql: (sum(${TABLE}.Monto) / max(${TABLE}.MontoPrevio)) -1 ;;
  }

  measure: month_over_month_ticket {
    type: number
    value_format: "0.00%"
    sql: (${ticket_promedio} / ${ticket_promedio_previo}) -1 ;;
  }

  measure: estatus_mom_monto {
    type: string    sql: case when ${month_over_month_monto} < 0 then 'decremento' else 'incremento' end ;;
  }

  measure: estatus_mom_ticket {
    type: string
    sql: case when ${month_over_month_ticket} < 0 then 'decremento' else 'incremento' end ;;
  }

  measure: month_year {
    type: string
    sql_distinct_key: ${TABLE}.NombreDeMedida ;;
    sql:
    case
    when min(month(${TABLE}.Fecha)) = 1 then concat('Enero ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 2 then concat('Febrero ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 3 then concat('Marzo ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 4 then concat('Abril ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 5 then concat('Mayo ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 6 then concat('Junio ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 7 then concat('Julio ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 8 then concat('Agosto ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 9 then concat('Septiembre ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 10 then concat('Octubre ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 11 then concat('Noviembre ', min(year(${TABLE}.Fecha)))
    when min(month(${TABLE}.Fecha)) = 12 then concat('Diciembre ', min(year(${TABLE}.Fecha)))
    end ;;
  }

  measure: descriptivo_mensual {
    type: string
    sql: concat('En el mes de ', ${month_year}, ' se registró un total de ', format(${transacciones_sum}, 'N0', 'en-us'), ' transacciones y un volumen de facturación de ', format(${monto_sum},'C', 'en-us'), '. Las ventas presentaron un ',  ${estatus_mom_monto},' del ', format(abs(${month_over_month_monto}), 'P', 'en-us'), ' con relación al mes anterior. El Ticket Promedio global presentó un ', ${estatus_mom_ticket}, ' del ', format(abs(${month_over_month_ticket}), 'P', 'en-us'), ' con relación al mes anterior.' ) ;;
    #${fecha_month_name},' ',${fecha_year}
  }

  ####################################

  dimension: top_1 {
    type: number
    sql: max(${monto_sum}) ;;
  }


  ####################################



  set: detail {
    fields: [
      transacciones,
      transacciones_previo,
      monto,
      monto_previo,
      nombre_de_medidas,
      razon_social,
      rfc,
      estado_comercial
    ]
  }
}
