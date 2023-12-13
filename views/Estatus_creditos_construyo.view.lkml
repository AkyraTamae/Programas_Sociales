
view: estatus_creditos_construyo {
  derived_table: {
    sql: Select
        A.*,
        B.fechaCreacion,
        B.fechaAprobacion,
        B.fechaEjecucion
      From
        [dbo].[EstatusCreditosConstruyo] A With (Nolock)
      Left Join
        [broxelco_rdg].[dispersionesSolicitudes] B With (Nolock) On A.FolioAsignacionLinea = B.folio ;;
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

  dimension: fecha_recepcin_credito {
    type: date
    sql: ${TABLE}."FechaRecepciónCredito" ;;
  }

  dimension: fecha_sftp {
    type: string
    sql: ${TABLE}.FechaSftp ;;
  }

  dimension: fecha_respuesta_ef {
    type: string
    sql: ${TABLE}.FechaRespuestaEF ;;
  }

  dimension: fecha_envo_ef {
    type: string
    sql: ${TABLE}."FechaEnvíoEF" ;;
  }

  dimension_group: fecha_creacion {
    type: time
    sql: ${TABLE}.fechaCreacion ;;
  }

  dimension_group: fecha_aprobacion {
    type: time
    sql: ${TABLE}.fechaAprobacion ;;
  }

  dimension_group: fecha_ejecucion {
    type: time
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
  fecha_recepcin_credito,
  fecha_sftp,
  fecha_respuesta_ef,
  fecha_envo_ef,
  fecha_creacion_time,
  fecha_aprobacion_time,
  fecha_ejecucion_time
    ]
  }
}
