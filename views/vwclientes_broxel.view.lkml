view: vwclientes_broxel {
  sql_table_name: dbo.VWClientesBroxel ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: actividad_economica {
    type: number
    sql: ${TABLE}.ActividadEconomica ;;
  }
  dimension: activo {
    type: string
    sql: ${TABLE}.Activo ;;
  }
  dimension: amaterno_rep_legal {
    type: string
    sql: ${TABLE}.AMaternoRepLegal ;;
  }
  dimension: apaterno_reg_legal {
    type: string
    sql: ${TABLE}.APaternoRegLegal ;;
  }
  dimension: autoridad_emite_rep_legal {
    type: string
    sql: ${TABLE}.AutoridadEmiteRepLegal ;;
  }
  dimension: calle {
    type: string
    sql: ${TABLE}.Calle ;;
  }
  dimension: clabedestino {
    type: string
    sql: ${TABLE}.CLABEDestino ;;
  }
  dimension: clasificacion_ctes_broxel {
    type: number
    sql: ${TABLE}.ClasificacionCtesBroxel ;;
  }
  dimension: clasificacion_id {
    type: number
    sql: ${TABLE}.ClasificacionId ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: clave_cliente_web {
    type: string
    sql: ${TABLE}.ClaveClienteWeb ;;
  }
  dimension: clave_pais {
    type: string
    sql: ${TABLE}.ClavePais ;;
  }
  dimension: cliente_individual {
    type: number
    sql: ${TABLE}.ClienteIndividual ;;
  }
  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.CodigoPostal ;;
  }
  dimension: codigo_postal_city {
    type: string
    sql: ${TABLE}.CodigoPostalCity ;;
  }
  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }
  dimension: colonia_city {
    type: string
    sql: ${TABLE}.ColoniaCity ;;
  }
  dimension: comentarios_validacion {
    type: string
    sql: ${TABLE}.ComentariosValidacion ;;
  }
  dimension: correo_contacto {
    type: string
    sql: ${TABLE}.CorreoContacto ;;
  }
  dimension: curp_rep_legal {
    type: string
    sql: ${TABLE}.CurpRepLegal ;;
  }
  dimension: emite_factura {
    type: number
    sql: ${TABLE}.EmiteFactura ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: estado_city {
    type: string
    sql: ${TABLE}.EstadoCity ;;
  }
  dimension: estatus_validacion {
    type: number
    sql: ${TABLE}.EstatusValidacion ;;
  }
  dimension_group: fecha_baja {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha_Baja ;;
  }
  dimension_group: fecha_constitucion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaConstitucion ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension_group: fecha_nacimiento_rep_legal {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaNacimientoRepLegal ;;
  }
  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GrupoCliente ;;
  }
  dimension: id_colonia {
    type: number
    sql: ${TABLE}.IdColonia ;;
  }
  dimension: id_estado {
    type: number
    sql: ${TABLE}.IdEstado ;;
  }
  dimension: id_localidad {
    type: number
    sql: ${TABLE}.IdLocalidad ;;
  }
  dimension: id_municipio {
    type: number
    sql: ${TABLE}.IdMunicipio ;;
  }
  dimension: id_pais {
    type: number
    sql: ${TABLE}.IdPais ;;
  }
  dimension: idcliente_entidad {
    type: number
    sql: ${TABLE}.IDClienteEntidad ;;
  }
  dimension: localidad {
    type: string
    sql: ${TABLE}.Localidad ;;
  }
  dimension: municipio_city {
    type: string
    sql: ${TABLE}.MunicipioCity ;;
  }
  dimension: municipio_delegacion {
    type: string
    sql: ${TABLE}.MunicipioDelegacion ;;
  }
  dimension: nombre_corto {
    type: string
    sql: ${TABLE}.NombreCorto ;;
  }
  dimension: nombre_rep_legal {
    type: string
    sql: ${TABLE}.NombreRepLegal ;;
  }
  dimension: num_ext {
    type: string
    sql: ${TABLE}.NumExt ;;
  }
  dimension: num_identificacion_rep_legal {
    type: string
    sql: ${TABLE}.NumIdentificacionRepLegal ;;
  }
  dimension: num_int {
    type: string
    sql: ${TABLE}.NumInt ;;
  }
  dimension: pais_tel {
    type: string
    sql: ${TABLE}.PaisTel ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
  }
  dimension: reporta_pld {
    type: number
    sql: ${TABLE}.ReportaPLD ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }
  dimension: rfc_rep_legal {
    type: string
    sql: ${TABLE}.RfcRepLegal ;;
  }
  dimension: status_migracion {
    type: number
    sql: ${TABLE}.StatusMigracion ;;
  }
  dimension: tel {
    type: string
    sql: ${TABLE}.Tel ;;
  }
  dimension: tipo_id_otro_rep_legal {
    type: string
    sql: ${TABLE}.TipoIdOtroRepLegal ;;
  }
  dimension: tipo_id_rep_legal {
    type: string
    sql: ${TABLE}.TipoIdRepLegal ;;
  }
  dimension: usuario_creacion {
    type: string
    sql: ${TABLE}.UsuarioCreacion ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
