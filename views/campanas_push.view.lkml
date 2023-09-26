view: campanas_push {
  sql_table_name: dbo.CampanasPush ;;

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
  dimension: id_envio_campana {
    type: number
    sql: ${TABLE}.IdEnvioCampana ;;
  }
  dimension: identificador {
    type: string
    sql: ${TABLE}.Identificador ;;
  }
  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }
  dimension: msg {
    type: string
    sql: ${TABLE}.Msg ;;
  }
  measure: count {
    type: count
  }
}
