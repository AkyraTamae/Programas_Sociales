view: migraciones_hv {
  sql_table_name: dbo.MigracionesHV ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }
  dimension: apellido_materno {
    type: string
    sql: ${TABLE}.ApellidoMaterno ;;
  }
  dimension: apellido_paterno {
    type: string
    sql: ${TABLE}.ApellidoPaterno ;;
  }
  dimension: celular {
    type: string
    sql: ${TABLE}.Celular ;;
  }
  dimension: codigo_estado_municipio {
    type: string
    sql: ${TABLE}."Codigo Estado Municipio" ;;
  }
  dimension: codigo_municipio {
    type: string
    sql: ${TABLE}.CodigoMunicipio ;;
  }
  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.CodigoPostal ;;
  }
  dimension: codigo_validacion {
    type: string
    sql: ${TABLE}.CodigoValidacion ;;
  }
  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }
  dimension: domicilio {
    type: string
    sql: ${TABLE}.Domicilio ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: email_anterior {
    type: string
    sql: ${TABLE}.EmailAnterior ;;
  }
  dimension: email_origen {
    type: string
    sql: ${TABLE}.EmailOrigen ;;
  }
  dimension: enrolador {
    type: string
    sql: ${TABLE}.Enrolador ;;
  }
  dimension: es_primera_compra {
    type: string
    sql: ${TABLE}.EsPrimeraCompra ;;
  }
  dimension: fecha_formalizacion_credito {
    type: string
    sql: ${TABLE}.FechaFormalizacionCredito ;;
  }
  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.FechaNacimiento ;;
  }
  dimension: fecha_proceso {
    type: string
    sql: ${TABLE}.FechaProceso ;;
  }
  dimension: fecha_registro {
    type: string
    sql: ${TABLE}.FechaRegistro ;;
  }
  dimension: folio_dispersion {
    type: string
    sql: ${TABLE}.FolioDispersion ;;
  }
  dimension: folio_renominacion {
    type: string
    sql: ${TABLE}.FolioRenominacion ;;
  }
  dimension: folio_status {
    type: string
    sql: ${TABLE}.FolioStatus ;;
  }
  dimension: id_archivo_hv {
    type: string
    sql: ${TABLE}.IdArchivoHV ;;
  }
  dimension: id_usuario_online_broxel {
    type: string
    sql: ${TABLE}.idUsuarioOnlineBroxel ;;
  }
  dimension: monto_credito {
    type: string
    sql: ${TABLE}.MontoCredito ;;
  }
  dimension: municipio {
    type: string
    sql: ${TABLE}.Municipio ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: nombre_archivo {
    type: string
    sql: ${TABLE}.NombreArchivo ;;
  }
  dimension: nss {
    type: string
    sql: ${TABLE}.nss ;;
  }
  dimension: numero_credito {
    type: string
    sql: ${TABLE}."Numero Credito" ;;
  }
  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }
  dimension: numero_principal {
    type: string
    sql: ${TABLE}.NumeroPrincipal ;;
  }
  dimension: numero_tarjeta {
    type: string
    sql: ${TABLE}.NumeroTarjeta ;;
  }
  dimension: procesado {
    type: string
    sql: ${TABLE}.Procesado ;;
  }
  dimension: sexo {
    type: string
    sql: ${TABLE}.Sexo ;;
  }
  dimension: token {
    type: string
    sql: ${TABLE}.Token ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
