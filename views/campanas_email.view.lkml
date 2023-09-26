view: campanas_email {
  sql_table_name: dbo.CampanasEmail ;;

  dimension: campaa {
    type: string
    sql: ${TABLE}."Campaña" ;;
  }
  dimension: canal {
    type: string
    sql: ${TABLE}.Canal ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: estatus_envio_campana {
    type: number
    sql: ${TABLE}.EstatusEnvioCampana ;;
  }
  dimension_group: fecha_envio {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaEnvio ;;
  }
  dimension: html {
    type: string
    sql: ${TABLE}.Html ;;
  }
  dimension: id_campana {
    type: number
    sql: ${TABLE}.IdCampana ;;
  }
  dimension: id_envio_campana {
    type: number
    sql: ${TABLE}.IdEnvioCampana ;;
  }
  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }
  dimension: msg {
    type: string
    sql: ${TABLE}.Msg ;;
  }
  dimension: n_envio {
    type: number
    sql: ${TABLE}.N_Envio ;;
  }
  measure: count {
    type: count
  }
}
