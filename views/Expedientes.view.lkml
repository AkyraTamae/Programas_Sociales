view: distribución_y_predicción_de_las_vueltas {
  sql_table_name: dev_originacion.expedientes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: categoria1 {
    type: string
    sql: ${TABLE}.Categoria1 ;;
  }
  dimension: categoria2 {
    type: string
    sql: ${TABLE}.Categoria2 ;;
  }
  dimension: categoria3 {
    type: string
    sql: ${TABLE}.Categoria3 ;;
  }
  dimension: cobertura {
    type: string
    sql: ${TABLE}.Cobertura ;;
  }
  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.CodigoPostal ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: estatus {
    type: string
    sql: ${TABLE}.Estatus ;;
  }
  dimension: estatus_usuario {
    type: string
    sql: ${TABLE}.EstatusUsuario ;;
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
  dimension_group: fecha_fin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaFin ;;
  }
  dimension_group: fecha_inicio {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaInicio ;;
  }
  dimension_group: fecha_respuesta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaRespuesta ;;
  }
  dimension: latitud {
    type: string
    sql: ${TABLE}.Latitud ;;
  }
  dimension: longitud {
    type: string
    sql: ${TABLE}.Longitud ;;
  }
  dimension: motivo {
    type: string
    sql: ${TABLE}.Motivo ;;
  }
  dimension: movil {
    type: string
    sql: ${TABLE}.Movil ;;
  }
  dimension: municipio {
    type: string
    sql: ${TABLE}.Municipio ;;
  }
  dimension: nivel_economico {
    type: number
    sql: ${TABLE}.NivelEconomico ;;
  }
  dimension: nombre_usuario {
    type: string
    sql: ${TABLE}.NombreUsuario ;;
  }
  dimension: originador {
    type: string
    sql: ${TABLE}.Originador ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: ubicacion {
    type: string
    sql: ${TABLE}.Ubicacion ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
  ###########################
  dimension_group: week_fecha_respuesta {
    type: time
    timeframes: [week]
    sql: ${TABLE}.FechaRespuesta ;;
    html: {{ rendered_value | date: "%B %Y" }};;

  }





}
