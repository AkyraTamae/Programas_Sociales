
view: astro_main {
  derived_table: {
    sql: Select
        F.DescripcionTipoEnvio,
        B.DescripcionCanal,
        C.DescripcionIntento,
        Case
        When C.IntentoID In ('2', '10', '38', '39', '40', '51') Then ''
        When C.IntentoID = '1' Then 'unknow'
        Else C.DescripcionIntento
        End As 'Contact_Reason',
        D.ClienteID,
        E.TelefonoCelular,
        CONCAT(A.MensajeID, '_', A.ConversacionID) As 'KeyID',
        IIF(Case When C.IntentoID In ('2', '10', '38', '39', '40', '51') Then '' When C.IntentoID = '1' Then 'unknow' Else C.DescripcionIntento End = '', '', CONCAT(Case When C.IntentoID In ('2', '10', '38', '39', '40', '51') Then '' When C.IntentoID = '1' Then 'unknow' Else C.DescripcionIntento End, '_', A.ConversacionID)) As 'Primary_Key',
        A.*
      From
        [Core].[TMensaje] A With (Nolock)
      Left Join
        [Core].[CatCanal] B With (Nolock) On A.CanalID = B.CanalID
      Left Join
        [Core].[CatIntento] C With (Nolock) On A.IntentoID = C.IntentoID
      Left Join
        [Core].[TConversacion_Hist] D With (Nolock) On A.ConversacionID = D.ConversacionID
      Left Join
        [Core].[TCliente] E With (Nolock) On D.ClienteID = E.ClienteID
      Left Join
        [Core].[CatTipoEnvio] F With (Nolock) On A.TipoEnvioID = F.TipoEnvioID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: descripcion_tipo_envio {
    type: string
    sql: ${TABLE}.DescripcionTipoEnvio ;;
  }

  dimension: descripcion_canal {
    type: string
    sql: ${TABLE}.DescripcionCanal ;;
  }

  dimension: descripcion_intento {
    type: string
    sql: ${TABLE}.DescripcionIntento ;;
  }

  dimension: contact_reason {
    type: string
    sql: ${TABLE}.Contact_Reason ;;
  }

  dimension: cliente_id {
    type: number
    sql: ${TABLE}.ClienteID ;;
  }

  dimension: telefono_celular {
    type: string
    sql: ${TABLE}.TelefonoCelular ;;
  }

  dimension: key_id {
    type: string
    sql: ${TABLE}.KeyID ;;
  }

  dimension: primary_key {
    type: string
    hidden: yes
    sql: ${TABLE}.Primary_Key ;;
  }

  dimension: mensaje_id {
    type: number
    sql: ${TABLE}.MensajeID ;;
  }

  dimension: conversacion_id {
    type: string
    sql: ${TABLE}.ConversacionID ;;
  }

  dimension: canal_id {
    type: number
    sql: ${TABLE}.CanalID ;;
  }

  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }

  dimension: intento_id {
    type: number
    sql: ${TABLE}.IntentoID ;;
  }

  dimension: autorizacion_operacion {
    type: number
    sql: ${TABLE}.AutorizacionOperacion ;;
  }

  dimension: agente_id {
    type: number
    sql: ${TABLE}.AgenteID ;;
  }

  dimension: tipo_envio_id {
    type: number
    sql: ${TABLE}.TipoEnvioID ;;
  }

  dimension: solicita_respuesta {
    type: number
    sql: ${TABLE}.SolicitaRespuesta ;;
  }

  dimension_group: fecha_registro {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    datatype: datetime
    sql: ${TABLE}.FechaRegistro ;;
  }

  dimension: mensaje_proveedor_id {
    type: string
    sql: ${TABLE}.MensajeProveedorID ;;
  }

  dimension: estatus_mensaje_id {
    type: number
    sql: ${TABLE}.EstatusMensajeID ;;
  }

  dimension: cantidad_mensajes {
    type: number
    sql: ${TABLE}.CantidadMensajes ;;
  }

###########################################


  measure: conteo_distinto_contact_reason {
    type: count_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${TABLE}.Primary_Key ;;
  }

  set: detail {
    fields: [
        descripcion_tipo_envio,
  descripcion_canal,
  descripcion_intento,
  contact_reason,
  cliente_id,
  telefono_celular,
  key_id,
  primary_key,
  mensaje_id,
  conversacion_id,
  canal_id,
  mensaje,
  intento_id,
  autorizacion_operacion,
  agente_id,
  tipo_envio_id,
  solicita_respuesta,
  mensaje_proveedor_id,
  estatus_mensaje_id,
  cantidad_mensajes
    ]
  }
}
