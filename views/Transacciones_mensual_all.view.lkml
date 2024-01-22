
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
