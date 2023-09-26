view: astro_copia_antigua {
  sql_table_name: dbo.AstroCopiaAntigua ;;

  dimension: agente_id {
    type: number
    sql: ${TABLE}.AgenteID ;;
  }
  dimension: asistente_personal_id {
    type: number
    sql: ${TABLE}.AsistentePersonalID ;;
  }
  dimension: autorizacion_operacion {
    type: number
    sql: ${TABLE}.AutorizacionOperacion ;;
  }
  dimension: canal_id {
    type: number
    sql: ${TABLE}.CanalID ;;
  }
  dimension: cantidad_mensajes {
    type: number
    sql: ${TABLE}.CantidadMensajes ;;
  }
  dimension: cliente_id {
    type: number
    sql: ${TABLE}.ClienteID ;;
  }
  dimension: conversacion_agente_id {
    type: string
    sql: ${TABLE}.ConversacionAgenteID ;;
  }
  dimension: conversacion_id {
    type: string
    sql: ${TABLE}.ConversacionID ;;
  }
  dimension: correo_electronico {
    type: string
    sql: ${TABLE}.CorreoElectronico ;;
  }
  dimension: cuenta_clabe {
    type: string
    sql: ${TABLE}.CuentaClabe ;;
  }
  dimension: descripcion_canal {
    type: string
    sql: ${TABLE}.DescripcionCanal ;;
  }
  dimension: descripcion_intento {
    type: string
    sql: ${TABLE}.DescripcionIntento ;;
  }
  dimension: estatus_mensaje_id {
    type: number
    sql: ${TABLE}.EstatusMensajeID ;;
  }
  dimension_group: fecha_conversacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaConversacion ;;
  }
  dimension_group: fecha_mensaje {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaMensaje ;;
  }
  dimension_group: fecha_registro {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaRegistro ;;
  }
  dimension: final_de_conversacion {
    type: number
    sql: ${TABLE}.FinalDeConversacion ;;
  }
  dimension: intento_id {
    type: number
    sql: ${TABLE}.IntentoID ;;
  }
  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }
  dimension: mensaje_id {
    type: number
    sql: ${TABLE}.MensajeID ;;
  }
  dimension: nombre_cliente {
    type: string
    sql: ${TABLE}.NombreCliente ;;
  }
  dimension: onboarding_cliente_estatus_id {
    type: number
    sql: ${TABLE}.OnboardingClienteEstatusID ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.SessionID ;;
  }
  dimension: solicita_respuesta {
    type: number
    sql: ${TABLE}.SolicitaRespuesta ;;
  }
  dimension: status_cliente_id {
    type: number
    sql: ${TABLE}.StatusClienteID ;;
  }
  dimension: telefono_celular {
    type: string
    sql: ${TABLE}.TelefonoCelular ;;
  }
  dimension: tipo_cliente_id {
    type: number
    sql: ${TABLE}.TipoClienteID ;;
  }
  dimension: tipo_envio_id {
    type: number
    sql: ${TABLE}.TipoEnvioID ;;
  }
  dimension: ultima_conversacion_id {
    type: string
    sql: ${TABLE}.UltimaConversacionID ;;
  }
  dimension: ultimo_canal_id {
    type: number
    sql: ${TABLE}.UltimoCanalID ;;
  }
  dimension: ultimo_mensaje_cliente_id {
    type: number
    sql: ${TABLE}.UltimoMensajeClienteID ;;
  }
  measure: count {
    type: count
  }
}
