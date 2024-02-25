
view: presentaciones_ejecutivas_yy_v2 {
  derived_table: {
    sql: --Transacciones Equipa, Renueva
      Select
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
        COUNT(1) As 'Transacciones',
        AA.TransaccionesPrevio,
        SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) As 'Monto',
        AA.MontoPrevio,
        Case When A.Producto = 'K303' Then 'Equipa Tu Casa' When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas',
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
          Case When A.Producto = 'K303' Then 'Equipa Tu Casa' When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas',
          B.razon_social As 'RazonSocial',
          B.rfc As 'RFC'
        From
          [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
        Inner Join
          [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
        Where
          Producto In ('K303','K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
        Group By
          DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
          A.Producto,
          B.razon_social,
          B.rfc
        )AA On DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) = DATEADD(MONTH,1,AA.Fecha) And Case When A.Producto = 'K303' Then 'Equipa_tu_Casa' When A.Producto = 'K281' Then 'Renueva' End = AA.NombreDeMedidas And B.razon_social = AA.RazonSocial And B.rfc = AA.RFC
      Where
        Producto In ('K303','K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
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
        End
      Union All
      --Transacciones Repara
      Select
        DATETRUNC(MONTH, A.FClear) As 'Fecha',
        COUNT(1) As 'Transacciones',
        AA.TransaccionesPrevio,
        SUM(A.ImpTotal) As 'Monto',
        AA.MontoPrevio,
        'Repara' As 'NombreDeMedidas',
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
        End As 'EstadoComercial'
      From
        [broxelco_rdg].[ind_movimientos] A With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] B On DenMov = Comercio
      Left Join
        (
        Select
          DATETRUNC(MONTH, A.FClear) As 'Fecha',
          COUNT(1) As 'TransaccionesPrevio',
          SUM(A.ImpTotal) As 'MontoPrevio',
          'Repara' As 'NombreDeMedidas'
        From
          [broxelco_rdg].[ind_movimientos] A With (Nolock)
        Inner Join
          [broxelco_rdg].[Comercio] B On DenMov = Comercio
        Where
          A.CodPtoCuota = 'K671' And CONVERT(Date,A.FClear) >= '2023-01-01' And B.comercio Not In(Select * From [broxelco_rdg].[ComercioNoReportar] With (Nolock))
        Group By
          DATETRUNC(MONTH, A.FClear)
        )AA On DATETRUNC(MONTH, A.FClear) = DATEADD(MONTH,1,AA.Fecha)
      Where
        A.CodPtoCuota = 'K671' And CONVERT(Date,A.FClear) >= '2023-01-01' And B.comercio Not In(Select * From [broxelco_rdg].[ComercioNoReportar] With (Nolock))
      Group By
        DATETRUNC(MONTH, A.FClear),
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
        End
      Union All
      --Transacciones Mejoravit
      Select
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
        COUNT(1) As 'Transacciones',
        AA.TransaccionesPrevio,
        SUM(A.Monto) As 'Monto',
        AA.MontoPrevio,
        'Mejoravit' As 'NombreDeMedidas',
        A.RazonSocial,
        A.RFC,
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When A.Comercio = '23CBX00958' Then 'Hidalgo'
        When A.Comercio = '23CBX00980' Then 'Jalisco'
        --
        When A.estadoComercial Like '%cdmx%' Or A.estadoComercial Like '%ciudad de m%' Or A.estadoComercial Like '%CIUDAD DE M%' Or A.estadoComercial Like '%FEDERAL%' Or A.estadoComercial Like '%D.F.%' Or A.estadoComercial Like '%DF%' Or A.estadoComercial Like '%CMDX%' Then 'Distrito Federal'
        When A.estadoComercial Like '%xico%' Or A.estadoComercial Like '%Edo. Méx' Or A.estadoComercial Like '%EDO MEX%' Or A.estadoComercial = 'MEX' Or A.estadoComercial = 'MEX.' Or A.estadoComercial Like '%Edo. Mex.%'  Then 'México'
        When A.estadoComercial Like '%uebl%' Then 'Puebla'
        When A.estadoComercial Like '%guerr%' Then 'Guerrero'
        When A.estadoComercial Like '%quer%' Then 'Querétaro'
        When A.estadoComercial Like '%nuevo le%' Or A.estadoComercial Like '%nuevo le%' Or A.estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
        When A.estadoComercial = 'Baja California' Or A.estadoComercial = 'Baja California ' Or A.estadoComercial = 'BAJA CALIFORNA ' Or A.estadoComercial = 'Baja California Norte ' Or A.estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
        When A.estadoComercial Like '%sur%' Then 'Baja California Sur'
        When A.estadoComercial Like '%campech%' Then 'Campeche'
        When A.estadoComercial Like '%chiap%' Then 'Chiapas'
        When A.estadoComercial Like '%aulipa%' Then 'Tamaulipas'
        When A.estadoComercial Like '%jalis%' Then 'Jalisco'
        When A.estadoComercial Like '%sonor%' Then 'Sonora'
        When A.estadoComercial Like '%naya%' Then 'Nayarit'
        When A.estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
        When A.estadoComercial Like '%potos%' Then 'San Luis Potosí'
        When A.estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
        When A.estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
        When A.estadoComercial Like '%yuca%' Then 'Yucatán'
        When A.estadoComercial Like '%more%' Then 'Morelos'
        When A.estadoComercial Like '%chih%' Then 'Chihuahua'
        When A.estadoComercial Like '%zaca%' Then 'Zacatecas'
        When A.estadoComercial Like '%guana%' Then 'Guanajuato'
        When A.estadoComercial Like '%roo%' Then 'Quintana Roo'
        When A.estadoComercial Like '%coli%' Then 'Colima'
        When A.estadoComercial Like '%aguas%' Then 'Aguascalientes'
        When A.estadoComercial Like '%oax%' Then 'Oaxaca'
        When A.estadoComercial Like '%sina%' Then 'Sinaloa'
        When A.estadoComercial Like '%chia%' Then 'Chiapas'
        When A.estadoComercial Like '%dura%' Then 'Durango'
        When A.estadoComercial Like '%hidal%' Then 'Hidalgo'
        When A.estadoComercial Like '%tlax%' Then 'Tlaxcala'
        When A.estadoComercial Like '%taba%' Then 'Tabasco'
        Else 'México'
        End As 'EstadoComercial'
      From
        [dev_originacion].[mejoravit_transacciones] A With (Nolock)
      Left Join
        (
        Select
          DATETRUNC(MONTH, CONVERT(Date, Fecha)) As 'Fecha',
          COUNT(1) As 'TransaccionesPrevio',
          SUM(Monto) As 'MontoPrevio',
          'Mejoravit' As 'NombreDeMedidas'
        From
          [dev_originacion].[mejoravit_transacciones] With (Nolock)
        Where
          CONVERT(Date,Fecha) >= '2023-01-01'
        Group By
          DATETRUNC(MONTH, CONVERT(Date,Fecha))
        )AA On DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) = DATEADD(MONTH, 1, AA.Fecha)
      Where
        CONVERT(Date, A.Fecha) >= '2023-01-01'
      Group By
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
        AA.MontoPrevio,
        AA.TransaccionesPrevio,
        A.RazonSocial,
        A.RFC,
        Case
        --Modificación de regla solicitada el 29 de diciembre
        When A.Comercio = '23CBX00958' Then 'Hidalgo'
        When A.Comercio = '23CBX00980' Then 'Jalisco'
        --
        When A.estadoComercial Like '%cdmx%' Or A.estadoComercial Like '%ciudad de m%' Or A.estadoComercial Like '%CIUDAD DE M%' Or A.estadoComercial Like '%FEDERAL%' Or A.estadoComercial Like '%D.F.%' Or A.estadoComercial Like '%DF%' Or A.estadoComercial Like '%CMDX%' Then 'Distrito Federal'
        When A.estadoComercial Like '%xico%' Or A.estadoComercial Like '%Edo. Méx' Or A.estadoComercial Like '%EDO MEX%' Or A.estadoComercial = 'MEX' Or A.estadoComercial = 'MEX.' Or A.estadoComercial Like '%Edo. Mex.%'  Then 'México'
        When A.estadoComercial Like '%uebl%' Then 'Puebla'
        When A.estadoComercial Like '%guerr%' Then 'Guerrero'
        When A.estadoComercial Like '%quer%' Then 'Querétaro'
        When A.estadoComercial Like '%nuevo le%' Or A.estadoComercial Like '%nuevo le%' Or A.estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
        When A.estadoComercial = 'Baja California' Or A.estadoComercial = 'Baja California ' Or A.estadoComercial = 'BAJA CALIFORNA ' Or A.estadoComercial = 'Baja California Norte ' Or A.estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
        When A.estadoComercial Like '%sur%' Then 'Baja California Sur'
        When A.estadoComercial Like '%campech%' Then 'Campeche'
        When A.estadoComercial Like '%chiap%' Then 'Chiapas'
        When A.estadoComercial Like '%aulipa%' Then 'Tamaulipas'
        When A.estadoComercial Like '%jalis%' Then 'Jalisco'
        When A.estadoComercial Like '%sonor%' Then 'Sonora'
        When A.estadoComercial Like '%naya%' Then 'Nayarit'
        When A.estadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
        When A.estadoComercial Like '%potos%' Then 'San Luis Potosí'
        When A.estadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
        When A.estadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
        When A.estadoComercial Like '%yuca%' Then 'Yucatán'
        When A.estadoComercial Like '%more%' Then 'Morelos'
        When A.estadoComercial Like '%chih%' Then 'Chihuahua'
        When A.estadoComercial Like '%zaca%' Then 'Zacatecas'
        When A.estadoComercial Like '%guana%' Then 'Guanajuato'
        When A.estadoComercial Like '%roo%' Then 'Quintana Roo'
        When A.estadoComercial Like '%coli%' Then 'Colima'
        When A.estadoComercial Like '%aguas%' Then 'Aguascalientes'
        When A.estadoComercial Like '%oax%' Then 'Oaxaca'
        When A.estadoComercial Like '%sina%' Then 'Sinaloa'
        When A.estadoComercial Like '%chia%' Then 'Chiapas'
        When A.estadoComercial Like '%dura%' Then 'Durango'
        When A.estadoComercial Like '%hidal%' Then 'Hidalgo'
        When A.estadoComercial Like '%tlax%' Then 'Tlaxcala'
        When A.estadoComercial Like '%taba%' Then 'Tabasco'
        Else 'México'
        End ;;
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
    sql:
    case
    when month(${fecha_date}) = 1 then 'Enero'
    when month(${fecha_date}) = 2 then'Febrero'
    when month(${fecha_date}) = 3 then'Marzo'
    when month(${fecha_date}) = 4 then'Abril'
    when month(${fecha_date}) = 5 then 'Mayo'
    when month(${fecha_date}) = 6 then 'Junio'
    when month(${fecha_date}) = 7 then 'Julio'
    when month(${fecha_date}) = 8 then 'Agosto'
    when month(${fecha_date}) = 9 then 'Septiembre'
    when month(${fecha_date}) = 10 then 'Octubre'
    when month(${fecha_date}) = 11 then 'Noviembre'
    when month(${fecha_date}) = 12 then 'Diciembre'
    end ;;
  }

  measure: transacciones_sum {
    type: sum
    value_format: "0.00%"
    sql: ${transacciones} ;;
  }

#  measure: transacciones_previo_avg  {
#    type: average
#    value_format: "0.00%"
#    sql: ${transacciones_previo} ;;
#  }

  measure: monto_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto} ;;
  }

#  measure: monto_previo_avg {
#    type: average
#    value_format: "$#,##0.00;-$#,##0.00"
#    sql: ${monto_previo} ;;
#  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: sum(${TABLE}.Monto) / sum(${TABLE}.Transacciones) ;;
  }

  dimension: month_over_month_monto {
    type: number
    value_format: "0.00%"
    sql: (sum(${TABLE}.Monto) / avg(${TABLE}.MontoPrevio)) -1 ;;
  }

  dimension: month_over_month_transacciones {
    type: number
    value_format: "0.00%"
    sql: (sum(${TABLE}.Transacciones) / avg(${TABLE}.TransaccionesPrevio)) -1 ;;
  }

  dimension: estatus_mom_monto {
    type: string
    sql: case when ${month_over_month_monto} < 0 then 'decremento' else 'incremento' end ;;
  }

  dimension: estatus_mom_transacciones {
    type: string
    sql: case when ${month_over_month_transacciones} < 0 then 'decremento' else 'incremento' end ;;
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
