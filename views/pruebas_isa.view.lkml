
view: pruebas_isa {
  derived_table: {
    sql: Select top 100 *
      From
        dbo.ExpedientesDigitales ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }

  dimension_group: fecha_hora_recepcion {
    type: time
    sql: ${TABLE}.FechaHoraRecepcion ;;
  }

  dimension_group: fecha_recepcion {
    type: time
    sql: ${TABLE}.FechaRecepcion ;;
  }

  dimension_group: fecha_hora_respuesta {
    type: time
    sql: ${TABLE}.FechaHoraRespuesta ;;
  }

  dimension_group: fecha_respuesta {
    type: time
    sql: ${TABLE}.FechaRespuesta ;;
  }

  dimension: estatus {
    type: string
    sql: ${TABLE}.Estatus ;;
  }

  dimension: motivo {
    type: string
    sql: ${TABLE}.Motivo ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }

  dimension: proveedor {
    type: string
    sql: ${TABLE}.Proveedor ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension: originador {
    type: string
    sql: ${TABLE}.Originador ;;
  }

  dimension: cobertura {
    type: string
    sql: ${TABLE}.Cobertura ;;
  }

  dimension: ubicacion {
    type: string
    sql: ${TABLE}.Ubicacion ;;
  }

  dimension: motivo_limpo {
    type: string
    sql: ${TABLE}.MotivoLimpo ;;
  }

  set: detail {
    fields: [
        id,
	credito,
	fecha_hora_recepcion_time,
	fecha_recepcion_time,
	fecha_hora_respuesta_time,
	fecha_respuesta_time,
	estatus,
	motivo,
	usuario,
	proveedor,
	nombre,
	originador,
	cobertura,
	ubicacion,
	motivo_limpo
    ]
  }
}
