
view: yy08_construrama {
  derived_table: {
    sql: WITH
        TransaccionesMonto AS
          (
          SELECT
            COUNT(1) AS Transacciones,
            SUM(Monto) AS MontoTransaccionado,
            Cuenta,
            RazonSocial,
            Comercio,
            Municipio,
            EstadoComercial
          FROM
            `mgcp-10078073-bxl-bi-snd.BIPlata.borrarProgramasSocialesTransacciones`
          GROUP BY
            Cuenta,
            RazonSocial,
            Comercio,
            Municipio,
            EstadoComercial
          ),
        RepRenuevaRepara AS
          (
          SELECT
            NumeroCredito,
            NombreCompleto,
            CURP,
            FolioB2B,
            CuentaB2B,
            FolioB2C,
            CuentaB2C
          FROM
            `mgcp-10078073-bxl-bi-snd.BIOro.RepRenuevaRepara`
          WHERE
            EstatusCredito = 'OK, ASIGNACION' AND EstatusB2C <> 3
          ),
        RepEquipaTuCasa AS
          (
          SELECT
            NumeroCredito,
            NombreCompleto,
            CURP,
            FolioB2B,
            CuentaB2B,
            FolioB2C,
            CuentaB2C
          FROM
            `mgcp-10078073-bxl-bi-snd.BIOro.RepEquipaTuCasa`
          WHERE
            EstatusB2B = 12 AND EstatusB2C <> 3
          ),
        CuentasRenueva_Repara_Repara_EquipaTuCasa AS
          (
          SELECT DISTINCT
            NumeroCredito,
            CuentaB2B,
            CuentaB2C,
            CURP,
            'RenuevaRepara' AS Origen
          FROM
            RepRenuevaRepara
          UNION ALL
          SELECT DISTINCT
            NumeroCredito,
            CuentaB2B,
            CuentaB2C,
            CURP,
            'EquipaTuCasa' AS Origen
          FROM
            RepEquipaTuCasa
          ),
        DatosPersonales AS
          (
          SELECT
          razonSocial AS NombreCompleto,
          INITCAP(SPLIT(nombreRepLegal, ' ') [SAFE_OFFSET(0)]) AS PrimerNombre,
          INITCAP(ARRAY_TO_STRING(ARRAY_SLICE(SPLIT(nombreRepLegal, ' '), 1, ARRAY_LENGTH(SPLIT(nombreRepLegal, ' '))), ' ')) AS SegundoNombre,
          aPaternoRegLegal AS PrimerApellido,
          aMaternoRepLegal AS SegundoApellido,
          fechaConstitucion,
          fechaNacimientoRepLegal,
          rfc,
          rfcRepLegal,
          curpRepLegal,
          tipoIdRepLegal,
          numIdentificacionRepLegal,
          clavePais,
          colonia,
          calle,
          numExt,
          numInt,
          Estado,
          Localidad,
          MunicipioDelegacion,
          codigoPostal,
          tel,
          LOWER(CorreoContacto) AS Email
        FROM
          `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.clientesBroxel`
        )

      --41,298
      SELECT
        *
      FROM
        (
        SELECT DISTINCT
          ROW_NUMBER() OVER(PARTITION BY A.Cuenta ORDER BY E.tipoIdRepLegal DESC) AS Id,
          B.NumeroCredito,
          A.Cuenta AS CuentaB2B,
          B.CuentaB2C,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(SPLIT(C.Nombre, ' ') [SAFE_OFFSET(0)])
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(SPLIT(E.PrimerNombre, ' ') [SAFE_OFFSET(0)])
          ELSE NULL
          END AS PrimerNombre,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(ARRAY_TO_STRING(ARRAY_SLICE(SPLIT(C.Nombre, ' '), 1, ARRAY_LENGTH(SPLIT(C.Nombre, ' '))), ' '))
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(ARRAY_TO_STRING(ARRAY_SLICE(SPLIT(E.SegundoNombre, ' '), 1, ARRAY_LENGTH(SPLIT(E.SegundoNombre, ' '))), ' '))
          ELSE NULL
          END  AS SegundoNombre,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.ApellidoPaterno)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.PrimerApellido)
          ELSE NULL
          END AS ApellidoPaterno,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.ApellidoMaterno)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.SegundoApellido)
          ELSE NULL
          END AS ApellidoMaterno,
          E.tipoIdRepLegal AS TipoDeIdentificacion,
          numIdentificacionRepLegal AS NumeroDeIdentificacion,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN RIGHT(LEFT(C.CURP, 11), 1)
          WHEN B.Origen = 'EquipaTuCasa' THEN RIGHT(LEFT(D.CURP, 11), 1)
          ELSE NULL
          END AS Genero,
          E.clavePais AS Nacionalidad,
          E.fechaNacimientoRepLegal AS FechaDeNacimiento,
          DATE_DIFF(CURRENT_DATE('America/Mexico_City'), E.fechaNacimientoRepLegal, YEAR) AS Edad,
          CASE RIGHT(LEFT(B.CURP, 13), 2)
          WHEN 'AS' THEN 'Aguascalientes'
          WHEN 'BC' THEN 'Baja California'
          WHEN 'BS' THEN 'Baja California Sur'
          WHEN 'CC' THEN 'Campeche'
          WHEN 'CL' THEN 'Coahuila de Zaragoza'
          WHEN 'CM' THEN 'Colima'
          WHEN 'CS' THEN 'Chiapas'
          WHEN 'CH' THEN 'Chihuahua'
          WHEN 'DF' THEN 'Ciudad de Mexico'
          WHEN 'DG' THEN 'Durango'
          WHEN 'GT' THEN 'Guanajuato'
          WHEN 'GR' THEN 'Guerrero'
          WHEN 'HG' THEN 'Hidalgo'
          WHEN 'JC' THEN 'Jalisco'
          WHEN 'MC' THEN 'Mexico'
          WHEN 'MN' THEN 'Michoacan de Ocampo'
          WHEN 'MS' THEN 'Morelos'
          WHEN 'NT' THEN 'Nayarit'
          WHEN 'NL' THEN 'Nuevo Leon'
          WHEN 'OC' THEN 'Oaxaca'
          WHEN 'PL' THEN 'Puebla'
          WHEN 'QT' THEN 'Queretaro'
          WHEN 'QR' THEN 'Quintana Roo'
          WHEN 'SP' THEN 'San Luis Potosi'
          WHEN 'SL' THEN 'Sinaloa'
          WHEN 'SR' THEN 'Sonora'
          WHEN 'TC' THEN 'Tabasco'
          WHEN 'TS' THEN 'Tamaulipas'
          WHEN 'TL' THEN 'Tlaxcala'
          WHEN 'VZ' THEN 'Veracruz'
          WHEN 'YN' THEN 'Yucatan'
          WHEN 'ZS' THEN 'Zacatecas'
          ELSE NULL
          END AS LugarDeNacimiento,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.RFC
          WHEN B.Origen = 'EquipaTuCasa' THEN E.rfc
          ELSE NULL
          END AS RFC,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.CURP
          WHEN B.Origen = 'EquipaTuCasa' THEN D.CURP
          ELSE NULL
          END AS CURP,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN LOWER(C.CorreoElectronico)
          WHEN B.Origen = 'EquipaTuCasa' THEN LOWER(D.CorreoElectronico)
          ELSE NULL
          END AS CorreoElectronico,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.NumeroCelular
          WHEN B.Origen = 'EquipaTuCasa' THEN D.NumeroCelular
          ELSE NULL
          END AS NumeroDeTelefono,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.Calle)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.calle)
          ELSE NULL
          END AS Calle,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.NumeroExterior
          WHEN B.Origen = 'EquipaTuCasa' THEN E.numExt
          ELSE NULL
          END AS NumeroExterior,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.NumeroInterior
          WHEN B.Origen = 'EquipaTuCasa' THEN E.numInt
          ELSE NULL
          END AS NumeroInterior,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.Colonia)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.colonia)
          ELSE NULL
          END AS Colonia,
          'Mexico' AS Pais,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.Estado)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.Estado)
          ELSE NULL
          END AS EntidadFederativa,
          E.Localidad AS Ciudad,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN INITCAP(C.Municipio)
          WHEN B.Origen = 'EquipaTuCasa' THEN INITCAP(E.MunicipioDelegacion)
          ELSE NULL
          END AS Municipio,
          CASE
          WHEN B.Origen = 'RenuevaRepara' THEN C.CodigoPostal
          WHEN B.Origen = 'EquipaTuCasa' THEN E.codigoPostal
          ELSE NULL
          END AS CodigoPostal,
          B.Origen,
          F.Transacciones,
          F.MontoTransaccionado,
          F.RazonSocial,
          F.Comercio,
          F.Municipio AS MunicipioComercial,
          F.EstadoComercial
        FROM
          `mgcp-10078073-bxl-bi-snd.BIPlata.borrarProgramasSocialesTransacciones` A
        INNER JOIN
          CuentasRenueva_Repara_Repara_EquipaTuCasa B ON A.Cuenta = B.CuentaB2B
        LEFT JOIN
          `mgcp-10078073-bxl-dwh-prod.cdc_Broxel_MyR.TOriginacionCreditosMejoraRenueva` C ON B.NumeroCredito = C.NumeroCredito
        LEFT JOIN
          `mgcp-10078073-bxl-dwh-prod.cdc_Broxel_MyR.TOriginacionCreditosEquipaTuCasa` D ON B.NumeroCredito = D.NumeroCredito
        LEFT JOIN
          DatosPersonales E ON B.CURP = E.curpRepLegal
        INNER JOIN
          TransaccionesMonto F ON A.Cuenta = F.Cuenta
        )
      WHERE
        Id = 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }

  dimension: cuenta_b2_b {
    type: string
    sql: ${TABLE}.CuentaB2B ;;
  }

  dimension: cuenta_b2_c {
    type: string
    sql: ${TABLE}.CuentaB2C ;;
  }

  dimension: primer_nombre {
    type: string
    sql: ${TABLE}.PrimerNombre ;;
  }

  dimension: segundo_nombre {
    type: string
    sql: ${TABLE}.SegundoNombre ;;
  }

  dimension: apellido_paterno {
    type: string
    sql: ${TABLE}.ApellidoPaterno ;;
  }

  dimension: apellido_materno {
    type: string
    sql: ${TABLE}.ApellidoMaterno ;;
  }

  dimension: tipo_de_identificacion {
    type: string
    sql: ${TABLE}.TipoDeIdentificacion ;;
  }

  dimension: numero_de_identificacion {
    type: string
    sql: ${TABLE}.NumeroDeIdentificacion ;;
  }

  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }

  dimension: nacionalidad {
    type: string
    sql: ${TABLE}.Nacionalidad ;;
  }

  dimension: fecha_de_nacimiento {
    type: date
    datatype: date
    sql: ${TABLE}.FechaDeNacimiento ;;
  }

  dimension: edad {
    type: number
    sql: ${TABLE}.Edad ;;
  }

  dimension: lugar_de_nacimiento {
    type: string
    sql: ${TABLE}.LugarDeNacimiento ;;
  }

  dimension: rfc {
    type: string
    label: "RFC"
    sql: ${TABLE}.RFC ;;
  }

  dimension: curp {
    type: string
    label: "CURP"
    sql: ${TABLE}.CURP ;;
  }

  dimension: correo_electronico {
    type: string
    sql: ${TABLE}.CorreoElectronico ;;
  }

  dimension: numero_de_telefono {
    type: string
    sql: ${TABLE}.NumeroDeTelefono ;;
  }

  dimension: calle {
    type: string
    sql: ${TABLE}.Calle ;;
  }

  dimension: numero_exterior {
    type: string
    sql: ${TABLE}.NumeroExterior ;;
  }

  dimension: numero_interior {
    type: string
    sql: ${TABLE}.NumeroInterior ;;
  }

  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }

  dimension: entidad_federativa {
    type: string
    sql: ${TABLE}.EntidadFederativa ;;
  }

  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }

  dimension: municipio {
    type: string
    sql: ${TABLE}.Municipio ;;
  }

  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.CodigoPostal ;;
  }

  dimension: origen {
    type: string
    sql: ${TABLE}.Origen ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: monto_transaccionado {
    type: number
    sql: ${TABLE}.MontoTransaccionado ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: municipio_comercial {
    type: string
    sql: ${TABLE}.MunicipioComercial ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.EstadoComercial ;;
  }

  measure: monto_total_transaccionado {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoTransaccionado ;;
  }

  set: detail {
    fields: [
        id,
  numero_credito,
  cuenta_b2_b,
  cuenta_b2_c,
  primer_nombre,
  segundo_nombre,
  apellido_paterno,
  apellido_materno,
  tipo_de_identificacion,
  numero_de_identificacion,
  genero,
  nacionalidad,
  fecha_de_nacimiento,
  edad,
  lugar_de_nacimiento,
  rfc,
  curp,
  correo_electronico,
  numero_de_telefono,
  calle,
  numero_exterior,
  numero_interior,
  colonia,
  pais,
  entidad_federativa,
  ciudad,
  municipio,
  codigo_postal,
  origen,
  transacciones,
  monto_transaccionado,
  razon_social,
  comercio,
  municipio_comercial,
  estado_comercial
    ]
  }
}
