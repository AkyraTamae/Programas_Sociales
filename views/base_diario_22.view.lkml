view: base_diario_22 {
  sql_table_name: dbo.BASE_DIARIO_22 ;;

  dimension: abandoned {
    type: number
    sql: ${TABLE}.Abandoned ;;
  }
  dimension: agente {
    type: number
    sql: ${TABLE}.Agente ;;
  }
  dimension: asa_calculado {
    type: number
    sql: ${TABLE}.ASA_Calculado ;;
  }
  dimension: call_answered_within_20sec {
    type: number
    sql: ${TABLE}."Call_Answered_within_20sec#" ;;
  }
  dimension: calls_answered {
    type: number
    sql: ${TABLE}.Calls_Answered ;;
  }
  dimension: demora_max {
    type: number
    sql: ${TABLE}.Demora_max ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: inbound_volume {
    type: number
    sql: ${TABLE}.Inbound_Volume ;;
  }
  dimension: interval {
    type: string
    sql: ${TABLE}.Interval ;;
  }
  dimension: interval_total {
    type: string
    sql: ${TABLE}.Interval_Total ;;
  }
  dimension: name_skill {
    type: string
    sql: ${TABLE}.Name_Skill ;;
  }
  dimension: skill {
    type: string
    sql: ${TABLE}.Skill ;;
  }
  dimension: talk_time {
    type: number
    sql: ${TABLE}.Talk_Time ;;
  }
  measure: count {
    type: count
  }
}
