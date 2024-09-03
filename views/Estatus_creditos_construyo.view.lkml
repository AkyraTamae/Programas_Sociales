
view: estatus_creditos_construyo {
 derived_table: {
  sql: SELECT
        A.NumeroCredito,
        B.Descripcion AS Estatus,
        B.Id AS IdEstatus,
        A.ClaveModalidad,
        D.Descripcion AS ModalidadCompleta,
        A.MontoCredito,
        NombreDerechohabiente,
        ApellidoPaterno,
        ApellidoMaterno,
        A.ClaveEntidadFinanciera,
        E.TipoMovimiento,
        E.Monto AS MontoMov,
        E.Autorizacion,
        F.NombreArchivo,
        F.FolioAsignacionLinea,
        A.NSS,
        A.Folio,
        A.CorreoElectronico,
        A.NumeroCelular,
        A.ClabeBancaria,
        A.Token,
        A.FechaInsercion AS FechaRecepcionCredito,
        F.FechaSftp,
        F.FechaCreacionRegistro AS FechaRespuestaEF,
        G.FechaInsercion AS FechaEnvioEF,
        H.fechaCreacion,
        H.fechaAprobacion,
        H.fechaEjecucion
      FROM
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.CreditoYoConstruyo` A
      INNER JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_YoConstruyo.CatalogoEstatusProceso` B ON a.IdEstatusProceso = b.Id
      INNER JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.ClaveModalidadYoConstruyo` C ON a.ClaveModalidad = c.ClaveModalidad
      INNER JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.CatalogoModalidad` D ON c.IdModalidad = d.IdModalidad
      LEFT JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.MovimientoYoConstruyo` E ON a.Id=e.IdCreditoYoConstruyo AND e.Success = TRUE
      LEFT JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.RespuestaFondeador` F on a.Id=f.IdCreditoYoConstruyo
      LEFT JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_YoConstruyo.LayoutGenerado` G ON a.Id = g.IdCreditoConstruyo
      LEFT JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.dispersionesSolicitudes` H ON F.FolioAsignacionLinea = H.folio ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: numero_credito {
  type: string
  sql: ${TABLE}.NumeroCredito ;;
}

dimension: estatus {
  type: string
  sql: ${TABLE}.Estatus ;;
}

dimension: id_estatus {
  type: number
  sql: ${TABLE}.IdEstatus ;;
}

dimension: clave_modalidad {
  type: string
  sql: ${TABLE}.ClaveModalidad ;;
}

dimension: modalidad_completa {
  type: string
  sql: ${TABLE}.ModalidadCompleta ;;
}

dimension: monto_credito {
  type: number
  value_format: "$#,##0.00;-$#,##0.00"
  sql: ${TABLE}.MontoCredito ;;
}

dimension: nombre_derechohabiente {
  type: string
  sql: ${TABLE}.NombreDerechohabiente ;;
}

dimension: apellido_paterno {
  type: string
  sql: ${TABLE}.ApellidoPaterno ;;
}

dimension: apellido_materno {
  type: string
  sql: ${TABLE}.ApellidoMaterno ;;
}

dimension: clave_entidad_financiera {
  type: string
  sql: ${TABLE}.ClaveEntidadFinanciera ;;
}

dimension: tipo_movimiento {
  type: string
  sql: ${TABLE}.TipoMovimiento ;;
}

dimension: monto_mov {
  type: number
  value_format: "$#,##0.00;-$#,##0.00"
  sql: ${TABLE}.MontoMov ;;
}

dimension: autorizacion {
  type: string
  sql: ${TABLE}.Autorizacion ;;
}

dimension: nombre_archivo {
  type: string
  sql: ${TABLE}.NombreArchivo ;;
}

dimension: folio_asignacion_linea {
  type: string
  sql: ${TABLE}.FolioAsignacionLinea ;;
}

dimension: nss {
  type: string
  sql: ${TABLE}.NSS ;;
}

dimension: folio {
  type: string
  sql: ${TABLE}.Folio ;;
}

dimension: correo_electronico {
  type: string
  sql: ${TABLE}.CorreoElectronico ;;
}

dimension: numero_celular {
  type: string
  sql: ${TABLE}.NumeroCelular ;;
}

dimension: clabe_bancaria {
  type: string
  sql: ${TABLE}.ClabeBancaria ;;
}

dimension: token {
  type: string
  sql: ${TABLE}.Token ;;
}

dimension: fecha_recepcion_credito {
  type: date
  datatype: date
  sql: ${TABLE}.FechaRecepcionCredito ;;
}

dimension: fecha_sftp {
  type: string
  sql: ${TABLE}.FechaSftp ;;
}

dimension_group: fecha_respuesta_ef {
  type: time
  datatype: datetime
  sql: ${TABLE}.FechaRespuestaEF ;;
}

dimension_group: fecha_envio_ef {
  type: time
  datatype: datetime
  sql: ${TABLE}.FechaEnvioEF ;;
}

dimension_group: fecha_creacion {
  type: time
  datatype: datetime
  sql: ${TABLE}.fechaCreacion ;;
}

dimension_group: fecha_aprobacion {
  type: time
  datatype: datetime
  sql: ${TABLE}.fechaAprobacion ;;
}

dimension_group: fecha_ejecucion {
  type: time
  datatype: datetime
  sql: ${TABLE}.fechaEjecucion ;;
}

set: detail {
  fields: [
    numero_credito,
    estatus,
    id_estatus,
    clave_modalidad,
    modalidad_completa,
    monto_credito,
    nombre_derechohabiente,
    apellido_paterno,
    apellido_materno,
    clave_entidad_financiera,
    tipo_movimiento,
    monto_mov,
    autorizacion,
    nombre_archivo,
    folio_asignacion_linea,
    nss,
    folio,
    correo_electronico,
    numero_celular,
    clabe_bancaria,
    token,
    fecha_recepcion_credito,
    fecha_sftp,
    fecha_respuesta_ef_time,
    fecha_envio_ef_time,
    fecha_creacion_time,
    fecha_aprobacion_time,
    fecha_ejecucion_time
  ]
}
}
