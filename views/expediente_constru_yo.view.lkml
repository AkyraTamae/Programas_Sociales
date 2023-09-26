view: expediente_constru_yo {
  sql_table_name: dbo.ExpedienteConstruYo ;;

  dimension: cat_modalidad_credito_id {
    type: number
    sql: ${TABLE}.CatModalidadCreditoID ;;
  }
  dimension: cat_paso_id {
    type: number
    sql: ${TABLE}.CatPasoID ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension: expediente_constru_yo_id {
    type: number
    sql: ${TABLE}.ExpedienteConstruYoID ;;
  }
  dimension_group: fecha_alta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaAlta ;;
  }
  dimension_group: fecha_envio_revision {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaEnvioRevision ;;
  }
  dimension_group: fecha_respuesta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaRespuesta ;;
  }
  dimension: id_usuario_alta {
    type: number
    sql: ${TABLE}.IdUsuarioAlta ;;
  }
  dimension: intento {
    type: number
    sql: ${TABLE}.Intento ;;
  }
  dimension: motivo {
    type: string
    sql: ${TABLE}.Motivo ;;
  }
  dimension: movil {
    type: number
    sql: ${TABLE}.Movil ;;
  }
  dimension: nombre_expediente {
    type: string
    sql: ${TABLE}.NombreExpediente ;;
  }
  dimension: proveedor {
    type: number
    sql: ${TABLE}.Proveedor ;;
  }
  dimension: proveedor_respuesta {
    type: number
    sql: ${TABLE}.ProveedorRespuesta ;;
  }
  dimension: token {
    type: string
    sql: ${TABLE}.Token ;;
  }
  dimension: url_externo {
    type: string
    sql: ${TABLE}.UrlExterno ;;
  }
  dimension: usuario_respuesta {
    type: string
    sql: ${TABLE}.UsuarioRespuesta ;;
  }
  measure: count {
    type: count
  }
}
