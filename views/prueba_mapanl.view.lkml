view: simulacion_nl_programa_social {
  derived_table: {
    sql: SELECT *, CASE
                WHEN  Municipio = 'Cadereyta' THEN 'México'
                WHEN  Municipio = 'Apodaca' THEN 'México'
                WHEN  Municipio = 'Santa Catarina' THEN 'México'
                WHEN  Municipio = 'San Nicolás' THEN 'Coyotepec'
                WHEN  Municipio = 'Juárez' THEN 'Coyotepec'
                WHEN  Municipio = 'Zuazua' THEN 'Coyotepec'
                WHEN  Municipio = 'García' THEN 'Coyotepec'
                WHEN  Municipio = 'Escobedo' THEN 'Gral. Escobedo'
                WHEN  Municipio = 'Pesquería' THEN 'Pesquería'
                WHEN  Municipio = 'Santiago' THEN 'Santiago'
                WHEN  Municipio = 'Linares' THEN 'Linares'
                WHEN  Municipio = 'Guadalupe' THEN 'Guadalupe'
                WHEN  Municipio = 'Montemorelos' THEN 'Montemorelos'
                WHEN  Municipio = 'Allende' THEN 'Allende'
                WHEN  Municipio = 'Monterrey' THEN 'Monterrey'
                ELSE  Municipio -- Para los que no coincidan
            END AS municipio_map FROM `mgcp-10078073-bxl-bi-snd.BIOro.simulacion_NL_ProgramaSocial` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_solicitante {
    type: string
    sql: ${TABLE}.ID_Solicitante ;;
  }

  dimension: municipio {
    type: string
    sql: ${TABLE}.Municipio ;;
  }

  dimension: edad {
    type: number
    sql: ${TABLE}.Edad ;;
  }

  dimension: preregistrado {
    type: number
    sql: ${TABLE}.`Pre-registrado` ;;
  }

  dimension: registrado {
    type: number
    sql: ${TABLE}.Registrado ;;
  }

  dimension: registro_terminado {
    type: number
    label: "Registro terminado"
    sql: ${TABLE}.`Registro terminado` ;;
  }

  dimension: con_beneficio {
    type: number
    label: "Con beneficio"
    sql: ${TABLE}.`Con beneficio` ;;
  }

  dimension: municipio_map {
    type: string
    map_layer_name: edo_mex_layer
    sql: ${TABLE}.municipio_map ;;
  }

  set: detail {
    fields: [
      id_solicitante,
      municipio,
      edad,
      preregistrado,
      registrado,
      registro_terminado,
      con_beneficio,
      municipio_map
    ]
  }
}
