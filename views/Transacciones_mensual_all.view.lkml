
view: transacciones_mensual_all {
  derived_table: {
    sql: --Transacciones Equipa, Renueva
      Select
        IdTransferencia As 'Id_Movimiento',
        NumCuenta As 'Cuenta',
        DenMov As 'Comercio',
        Comercio.razon_social As 'Razon_Social',
        Comercio.rfc As 'RFC',
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When Comercio = '23CBX00958' Then 'Hidalgo'
        When Comercio = '23CBX00980' Then 'Jalisco'
        --
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
        CONVERT(Date, Fecha) As 'Fecha',
        ImpTotal As 'Monto',
        Case
        When Producto = 'K303' Then 'Equipa_tu_Casa'
        When Producto = 'K281' Then 'Renueva'
        End As 'Nombre_de_Medidas'
      From
        [broxelpaymentsws].[PrePayStudioMovements_v] With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] With (Nolock) On DenMov = Comercio
      Where
        Producto In ('K303','K281') And CONVERT(Date,fecha) >= '2022-01-01' And AuthorizationCode Is Not Null And Comercio.comercio Not In
        (
        Select *
        From
          [broxelco_rdg].[ComercioNoReportar] With (Nolock)
        )

      Union All

      --Transacciones Repara
      Select
        id As 'Id_Movimiento',
        NroRuc As 'Cuenta',
        DenMov As 'Comercio',
        Comercio.razon_social As 'Razon_Social',
        Comercio.rfc As 'RFC',
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When Comercio = '23CBX00958' Then 'Hidalgo'
        When Comercio = '23CBX00980' Then 'Jalisco'
        --
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
        FClear As 'Fecha',
        ImpTotal As 'Monto',
        'Repara' As 'Nombre_de_Medidas'
      From
        [broxelco_rdg].[ind_movimientos] With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] On DenMov = Comercio
      Where
        CodPtoCuota = 'K671' and CONVERT(Date,FClear) >= '2022-01-01' And Comercio.comercio Not In
        (
        select *
        From
          [broxelco_rdg].[ComercioNoReportar] With (Nolock)
        )

      Union All

      --Transacciones Mejoravit
      Select
        IdMovimiento As 'Id_Movimiento',
        Cuenta,
        Comercio,
        RazonSocial As 'Razon_Social',
        RFC,
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When Comercio = '23CBX00958' Then 'Hidalgo'
        When Comercio = '23CBX00980' Then 'Jalisco'
        --
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
        CONVERT(Date,Fecha) As 'Fecha',
        Monto,
        'Mejoravit' As 'Nombre_de_Medidas'
      From
        [dev_originacion].[mejoravit_transacciones] With (Nolock)
      Where
        CONVERT(Date,Fecha) >= '2022-01-01' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: string
    sql: ${TABLE}.Id_Movimiento ;;
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
    sql: ${TABLE}.Razon_Social ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
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
    sql: ${TABLE}.Nombre_de_Medidas ;;
  }

  dimension:  mexico_layer {
    type: string
    map_layer_name:  mexico_layer
    sql: ${TABLE}.Estado_Comercial ;;
  }

  measure: sum_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${sum_monto}/${count} ;;
  }

  ###########################################

  dimension: fecha_txt {
    type: string
    sql: datetrunc(month,${TABLE}.Fecha) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  dimension: prueba {
    type: string
    sql: ${nombre_de_medidas} ;;
    html:
              {% if prueba._value == "Equipa_Tu_Casa" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg" height="170" width="255">
              {% elsif prueba._value == "New York" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/1200px-Flag_of_New_York.svg.png" height="170" width="255">
              {% elsif prueba._value == "Colorado" %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Flag_of_Colorado.svg/255px-Flag_of_Colorado.svg.png" height="170" width="255">
              {% elsif prueba._value == "Illinois"%}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Illinois.svg/1200px-Flag_of_Illinois.svg.png" height="170" width="255">
              {%  else %}
              <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png" height="170" width="170">
              {% endif %} ;;
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
