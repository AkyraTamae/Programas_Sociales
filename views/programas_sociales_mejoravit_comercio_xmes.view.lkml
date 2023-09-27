
view: programas_sociales_mejoravit_comercio_xmes {
  derived_table: {
    sql: Select *
      From
      (
      Select
      Comercio,
      razon_social,
      Estado_Comercial,
      [2016-07-01] As 'July 2016',[2016-08-01] As 'August 2016',[2016-09-01] As 'September 2016',[2016-10-01] As 'October 2016',[2016-11-01] As 'November 2016',[2016-12-01] As 'December 2016',[2017-01-01] As 'January 2017',[2017-02-01] As 'February 2017',[2017-03-01] As 'March 2017',[2017-04-01] As 'April 2017',[2017-05-01] As 'May 2017',[2017-06-01] As 'June 2017',[2017-07-01] As 'July 2017',[2017-08-01] As 'August 2017',[2017-09-01] As 'September 2017',[2017-10-01] As 'October 2017',[2017-11-01] As 'November 2017',[2017-12-01] As 'December 2017',[2018-01-01] As 'January 2018',[2018-02-01] As 'February 2018',[2018-03-01] As 'March 2018',[2018-04-01] As 'April 2018',[2018-05-01] As 'May 2018',[2018-06-01] As 'June 2018',[2018-07-01] As 'July 2018',[2018-08-01] As 'August 2018',[2018-09-01] As 'September 2018',[2018-10-01] As 'October 2018',[2018-11-01] As 'November 2018',[2018-12-01] As 'December 2018',[2019-01-01] As 'January 2019',[2019-02-01] As 'February 2019',[2019-03-01] As 'March 2019',[2019-04-01] As 'April 2019',[2019-05-01] As 'May 2019',[2019-06-01] As 'June 2019',[2019-07-01] As 'July 2019',[2019-08-01] As 'August 2019',[2019-09-01] As 'September 2019',[2019-10-01] As 'October 2019',[2019-11-01] As 'November 2019',[2019-12-01] As 'December 2019',[2020-01-01] As 'January 2020',[2020-02-01] As 'February 2020',[2020-03-01] As 'March 2020',[2020-04-01] As 'April 2020',[2020-05-01] As 'May 2020',[2020-06-01] As 'June 2020',[2020-07-01] As 'July 2020',[2020-08-01] As 'August 2020',[2020-09-01] As 'September 2020',[2020-10-01] As 'October 2020',[2020-11-01] As 'November 2020',[2020-12-01] As 'December 2020',[2021-01-01] As 'January 2021',[2021-02-01] As 'February 2021',[2021-03-01] As 'March 2021',[2021-04-01] As 'April 2021',[2021-05-01] As 'May 2021',[2021-06-01] As 'June 2021',[2021-07-01] As 'July 2021',[2021-08-01] As 'August 2021',[2021-09-01] As 'September 2021',[2021-10-01] As 'October 2021',[2021-11-01] As 'November 2021',[2021-12-01] As 'December 2021',[2022-01-01] As 'January 2022',[2022-02-01] As 'February 2022',[2022-03-01] As 'March 2022',[2022-04-01] As 'April 2022',[2022-05-01] As 'May 2022',[2022-06-01] As 'June 2022',[2022-07-01] As 'July 2022',[2022-08-01] As 'August 2022',[2022-09-01] As 'September 2022',[2022-10-01] As 'October 2022',[2022-11-01] As 'November 2022',[2022-12-01] As 'December 2022',[2023-01-01] As 'January 2023',[2023-02-01] As 'February 2023',[2023-03-01] As 'March 2023',[2023-04-01] As 'April 2023',[2023-05-01] As 'May 2023',[2023-06-01] As 'June 2023',[2023-07-01] As 'July 2023',[2023-08-01] As 'August 2023',[2023-09-01] As 'September 2023'
      From
      (
      Select
      D.Comercio,
      D.Mes_txt,
      UPPER(E.razon_social) As 'razon_social',
      E.Estado_Comercial,
      D.ventas
      From
      (
      Select
      Comercio,
      Fecha,
      Mes_txt,
      Case
      When
      NombreMedidas = 'Renueva' Then NombreMedidas
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
      Where NombreMedidas Like '%Mejoravit%'
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
      A.fecha >= '2023-09-01' And A.idPrograma In ('5') And C.Comercio Is Null
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
      ) F
      Pivot
      (
      SUM(Ventas)
      For Mes_txt In ([2016-07-01],[2016-08-01],[2016-09-01],[2016-10-01],[2016-11-01],[2016-12-01],[2017-01-01],[2017-02-01],[2017-03-01],[2017-04-01],[2017-05-01],[2017-06-01],[2017-07-01],[2017-08-01],[2017-09-01],[2017-10-01],[2017-11-01],[2017-12-01],[2018-01-01],[2018-02-01],[2018-03-01],[2018-04-01],[2018-05-01],[2018-06-01],[2018-07-01],[2018-08-01],[2018-09-01],[2018-10-01],[2018-11-01],[2018-12-01],[2019-01-01],[2019-02-01],[2019-03-01],[2019-04-01],[2019-05-01],[2019-06-01],[2019-07-01],[2019-08-01],[2019-09-01],[2019-10-01],[2019-11-01],[2019-12-01],[2020-01-01],[2020-02-01],[2020-03-01],[2020-04-01],[2020-05-01],[2020-06-01],[2020-07-01],[2020-08-01],[2020-09-01],[2020-10-01],[2020-11-01],[2020-12-01],[2021-01-01],[2021-02-01],[2021-03-01],[2021-04-01],[2021-05-01],[2021-06-01],[2021-07-01],[2021-08-01],[2021-09-01],[2021-10-01],[2021-11-01],[2021-12-01],[2022-01-01],[2022-02-01],[2022-03-01],[2022-04-01],[2022-05-01],[2022-06-01],[2022-07-01],[2022-08-01],[2022-09-01],[2022-10-01],[2022-11-01],[2022-12-01],[2023-01-01],[2023-02-01],[2023-03-01],[2023-04-01],[2023-05-01],[2023-06-01],[2023-07-01],[2023-08-01],[2023-09-01])
      ) G
      ) H ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
  }

  dimension: july_2016 {
    type: number
    label: "July 2016"
    sql: ${TABLE}."July 2016" ;;
  }

  dimension: august_2016 {
    type: number
    label: "August 2016"
    sql: ${TABLE}."August 2016" ;;
  }

  dimension: september_2016 {
    type: number
    label: "September 2016"
    sql: ${TABLE}."September 2016" ;;
  }

  dimension: october_2016 {
    type: number
    label: "October 2016"
    sql: ${TABLE}."October 2016" ;;
  }

  dimension: november_2016 {
    type: number
    label: "November 2016"
    sql: ${TABLE}."November 2016" ;;
  }

  dimension: december_2016 {
    type: number
    label: "December 2016"
    sql: ${TABLE}."December 2016" ;;
  }

  dimension: january_2017 {
    type: number
    label: "January 2017"
    sql: ${TABLE}."January 2017" ;;
  }

  dimension: february_2017 {
    type: number
    label: "February 2017"
    sql: ${TABLE}."February 2017" ;;
  }

  dimension: march_2017 {
    type: number
    label: "March 2017"
    sql: ${TABLE}."March 2017" ;;
  }

  dimension: april_2017 {
    type: number
    label: "April 2017"
    sql: ${TABLE}."April 2017" ;;
  }

  dimension: may_2017 {
    type: number
    label: "May 2017"
    sql: ${TABLE}."May 2017" ;;
  }

  dimension: june_2017 {
    type: number
    label: "June 2017"
    sql: ${TABLE}."June 2017" ;;
  }

  dimension: july_2017 {
    type: number
    label: "July 2017"
    sql: ${TABLE}."July 2017" ;;
  }

  dimension: august_2017 {
    type: number
    label: "August 2017"
    sql: ${TABLE}."August 2017" ;;
  }

  dimension: september_2017 {
    type: number
    label: "September 2017"
    sql: ${TABLE}."September 2017" ;;
  }

  dimension: october_2017 {
    type: number
    label: "October 2017"
    sql: ${TABLE}."October 2017" ;;
  }

  dimension: november_2017 {
    type: number
    label: "November 2017"
    sql: ${TABLE}."November 2017" ;;
  }

  dimension: december_2017 {
    type: number
    label: "December 2017"
    sql: ${TABLE}."December 2017" ;;
  }

  dimension: january_2018 {
    type: number
    label: "January 2018"
    sql: ${TABLE}."January 2018" ;;
  }

  dimension: february_2018 {
    type: number
    label: "February 2018"
    sql: ${TABLE}."February 2018" ;;
  }

  dimension: march_2018 {
    type: number
    label: "March 2018"
    sql: ${TABLE}."March 2018" ;;
  }

  dimension: april_2018 {
    type: number
    label: "April 2018"
    sql: ${TABLE}."April 2018" ;;
  }

  dimension: may_2018 {
    type: number
    label: "May 2018"
    sql: ${TABLE}."May 2018" ;;
  }

  dimension: june_2018 {
    type: number
    label: "June 2018"
    sql: ${TABLE}."June 2018" ;;
  }

  dimension: july_2018 {
    type: number
    label: "July 2018"
    sql: ${TABLE}."July 2018" ;;
  }

  dimension: august_2018 {
    type: number
    label: "August 2018"
    sql: ${TABLE}."August 2018" ;;
  }

  dimension: september_2018 {
    type: number
    label: "September 2018"
    sql: ${TABLE}."September 2018" ;;
  }

  dimension: october_2018 {
    type: number
    label: "October 2018"
    sql: ${TABLE}."October 2018" ;;
  }

  dimension: november_2018 {
    type: number
    label: "November 2018"
    sql: ${TABLE}."November 2018" ;;
  }

  dimension: december_2018 {
    type: number
    label: "December 2018"
    sql: ${TABLE}."December 2018" ;;
  }

  dimension: january_2019 {
    type: number
    label: "January 2019"
    sql: ${TABLE}."January 2019" ;;
  }

  dimension: february_2019 {
    type: number
    label: "February 2019"
    sql: ${TABLE}."February 2019" ;;
  }

  dimension: march_2019 {
    type: number
    label: "March 2019"
    sql: ${TABLE}."March 2019" ;;
  }

  dimension: april_2019 {
    type: number
    label: "April 2019"
    sql: ${TABLE}."April 2019" ;;
  }

  dimension: may_2019 {
    type: number
    label: "May 2019"
    sql: ${TABLE}."May 2019" ;;
  }

  dimension: june_2019 {
    type: number
    label: "June 2019"
    sql: ${TABLE}."June 2019" ;;
  }

  dimension: july_2019 {
    type: number
    label: "July 2019"
    sql: ${TABLE}."July 2019" ;;
  }

  dimension: august_2019 {
    type: number
    label: "August 2019"
    sql: ${TABLE}."August 2019" ;;
  }

  dimension: september_2019 {
    type: number
    label: "September 2019"
    sql: ${TABLE}."September 2019" ;;
  }

  dimension: october_2019 {
    type: number
    label: "October 2019"
    sql: ${TABLE}."October 2019" ;;
  }

  dimension: november_2019 {
    type: number
    label: "November 2019"
    sql: ${TABLE}."November 2019" ;;
  }

  dimension: december_2019 {
    type: number
    label: "December 2019"
    sql: ${TABLE}."December 2019" ;;
  }

  dimension: january_2020 {
    type: number
    label: "January 2020"
    sql: ${TABLE}."January 2020" ;;
  }

  dimension: february_2020 {
    type: number
    label: "February 2020"
    sql: ${TABLE}."February 2020" ;;
  }

  dimension: march_2020 {
    type: number
    label: "March 2020"
    sql: ${TABLE}."March 2020" ;;
  }

  dimension: april_2020 {
    type: number
    label: "April 2020"
    sql: ${TABLE}."April 2020" ;;
  }

  dimension: may_2020 {
    type: number
    label: "May 2020"
    sql: ${TABLE}."May 2020" ;;
  }

  dimension: june_2020 {
    type: number
    label: "June 2020"
    sql: ${TABLE}."June 2020" ;;
  }

  dimension: july_2020 {
    type: number
    label: "July 2020"
    sql: ${TABLE}."July 2020" ;;
  }

  dimension: august_2020 {
    type: number
    label: "August 2020"
    sql: ${TABLE}."August 2020" ;;
  }

  dimension: september_2020 {
    type: number
    label: "September 2020"
    sql: ${TABLE}."September 2020" ;;
  }

  dimension: october_2020 {
    type: number
    label: "October 2020"
    sql: ${TABLE}."October 2020" ;;
  }

  dimension: november_2020 {
    type: number
    label: "November 2020"
    sql: ${TABLE}."November 2020" ;;
  }

  dimension: december_2020 {
    type: number
    label: "December 2020"
    sql: ${TABLE}."December 2020" ;;
  }

  dimension: january_2021 {
    type: number
    label: "January 2021"
    sql: ${TABLE}."January 2021" ;;
  }

  dimension: february_2021 {
    type: number
    label: "February 2021"
    sql: ${TABLE}."February 2021" ;;
  }

  dimension: march_2021 {
    type: number
    label: "March 2021"
    sql: ${TABLE}."March 2021" ;;
  }

  dimension: april_2021 {
    type: number
    label: "April 2021"
    sql: ${TABLE}."April 2021" ;;
  }

  dimension: may_2021 {
    type: number
    label: "May 2021"
    sql: ${TABLE}."May 2021" ;;
  }

  dimension: june_2021 {
    type: number
    label: "June 2021"
    sql: ${TABLE}."June 2021" ;;
  }

  dimension: july_2021 {
    type: number
    label: "July 2021"
    sql: ${TABLE}."July 2021" ;;
  }

  dimension: august_2021 {
    type: number
    label: "August 2021"
    sql: ${TABLE}."August 2021" ;;
  }

  dimension: september_2021 {
    type: number
    label: "September 2021"
    sql: ${TABLE}."September 2021" ;;
  }

  dimension: october_2021 {
    type: number
    label: "October 2021"
    sql: ${TABLE}."October 2021" ;;
  }

  dimension: november_2021 {
    type: number
    label: "November 2021"
    sql: ${TABLE}."November 2021" ;;
  }

  dimension: december_2021 {
    type: number
    label: "December 2021"
    sql: ${TABLE}."December 2021" ;;
  }

  dimension: january_2022 {
    type: number
    label: "January 2022"
    sql: ${TABLE}."January 2022" ;;
  }

  dimension: february_2022 {
    type: number
    label: "February 2022"
    sql: ${TABLE}."February 2022" ;;
  }

  dimension: march_2022 {
    type: number
    label: "March 2022"
    sql: ${TABLE}."March 2022" ;;
  }

  dimension: april_2022 {
    type: number
    label: "April 2022"
    sql: ${TABLE}."April 2022" ;;
  }

  dimension: may_2022 {
    type: number
    label: "May 2022"
    sql: ${TABLE}."May 2022" ;;
  }

  dimension: june_2022 {
    type: number
    label: "June 2022"
    sql: ${TABLE}."June 2022" ;;
  }

  dimension: july_2022 {
    type: number
    label: "July 2022"
    sql: ${TABLE}."July 2022" ;;
  }

  dimension: august_2022 {
    type: number
    label: "August 2022"
    sql: ${TABLE}."August 2022" ;;
  }

  dimension: september_2022 {
    type: number
    label: "September 2022"
    sql: ${TABLE}."September 2022" ;;
  }

  dimension: october_2022 {
    type: number
    label: "October 2022"
    sql: ${TABLE}."October 2022" ;;
  }

  dimension: november_2022 {
    type: number
    label: "November 2022"
    sql: ${TABLE}."November 2022" ;;
  }

  dimension: december_2022 {
    type: number
    label: "December 2022"
    sql: ${TABLE}."December 2022" ;;
  }

  dimension: january_2023 {
    type: number
    label: "January 2023"
    sql: ${TABLE}."January 2023" ;;
  }

  dimension: february_2023 {
    type: number
    label: "February 2023"
    sql: ${TABLE}."February 2023" ;;
  }

  dimension: march_2023 {
    type: number
    label: "March 2023"
    sql: ${TABLE}."March 2023" ;;
  }

  dimension: april_2023 {
    type: number
    label: "April 2023"
    sql: ${TABLE}."April 2023" ;;
  }

  dimension: may_2023 {
    type: number
    label: "May 2023"
    sql: ${TABLE}."May 2023" ;;
  }

  dimension: june_2023 {
    type: number
    label: "June 2023"
    sql: ${TABLE}."June 2023" ;;
  }

  dimension: july_2023 {
    type: number
    label: "July 2023"
    sql: ${TABLE}."July 2023" ;;
  }

  dimension: august_2023 {
    type: number
    label: "August 2023"
    sql: ${TABLE}."August 2023" ;;
  }

  dimension: september_2023 {
    type: number
    label: "September 2023"
    sql: ${TABLE}."September 2023" ;;
  }

  set: detail {
    fields: [
      comercio,
      razon_social,
      estado_comercial,
      july_2016,
      august_2016,
      september_2016,
      october_2016,
      november_2016,
      december_2016,
      january_2017,
      february_2017,
      march_2017,
      april_2017,
      may_2017,
      june_2017,
      july_2017,
      august_2017,
      september_2017,
      october_2017,
      november_2017,
      december_2017,
      january_2018,
      february_2018,
      march_2018,
      april_2018,
      may_2018,
      june_2018,
      july_2018,
      august_2018,
      september_2018,
      october_2018,
      november_2018,
      december_2018,
      january_2019,
      february_2019,
      march_2019,
      april_2019,
      may_2019,
      june_2019,
      july_2019,
      august_2019,
      september_2019,
      october_2019,
      november_2019,
      december_2019,
      january_2020,
      february_2020,
      march_2020,
      april_2020,
      may_2020,
      june_2020,
      july_2020,
      august_2020,
      september_2020,
      october_2020,
      november_2020,
      december_2020,
      january_2021,
      february_2021,
      march_2021,
      april_2021,
      may_2021,
      june_2021,
      july_2021,
      august_2021,
      september_2021,
      october_2021,
      november_2021,
      december_2021,
      january_2022,
      february_2022,
      march_2022,
      april_2022,
      may_2022,
      june_2022,
      july_2022,
      august_2022,
      september_2022,
      october_2022,
      november_2022,
      december_2022,
      january_2023,
      february_2023,
      march_2023,
      april_2023,
      may_2023,
      june_2023,
      july_2023,
      august_2023,
      september_2023
    ]
  }
}
