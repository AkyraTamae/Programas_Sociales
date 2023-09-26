view: tiempos_avaya_2023 {
  sql_table_name: dbo.Tiempos_Avaya_2023 ;;

  dimension: agente {
    type: string
    sql: ${TABLE}.Agente ;;
  }
  dimension: campaa {
    type: string
    sql: ${TABLE}."Campaña" ;;
  }
  dimension: eng_min {
    type: number
    sql: ${TABLE}.Eng_min ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: grupo_avaya {
    type: string
    sql: ${TABLE}."Grupo AVAYA" ;;
  }
  dimension: identif_de_conexin {
    type: number
    sql: ${TABLE}."Identif# de conexión" ;;
  }
  dimension: int_aban {
    type: number
    sql: ${TABLE}.Int_Aban ;;
  }
  dimension: int_av {
    type: number
    sql: ${TABLE}.Int_AV ;;
  }
  dimension: int_chat {
    type: number
    sql: ${TABLE}.Int_Chat ;;
  }
  dimension: jornada {
    type: number
    sql: ${TABLE}.Jornada ;;
  }
  dimension: llamadas_aban {
    type: number
    sql: ${TABLE}."Llamadas aban#" ;;
  }
  dimension: llamadas_acd {
    type: number
    sql: ${TABLE}."Llamadas ACD" ;;
  }
  dimension: llamadas_de_entrada_a_la_extn {
    type: number
    sql: ${TABLE}."Llamadas de entrada a la extn" ;;
  }
  dimension: llamadas_de_salida_de_la_extn {
    type: number
    sql: ${TABLE}."Llamadas de salida de la extn" ;;
  }
  dimension: nombre_del_agente {
    type: string
    sql: ${TABLE}."Nombre del agente" ;;
  }
  dimension: supervisor {
    type: string
    sql: ${TABLE}.Supervisor ;;
  }
  dimension: tiempo_acd {
    type: number
    sql: ${TABLE}."Tiempo ACD" ;;
  }
  dimension: tiempo_acw {
    type: number
    sql: ${TABLE}."Tiempo ACW" ;;
  }
  dimension: tiempo_aux {
    type: number
    sql: ${TABLE}."Tiempo AUX" ;;
  }
  dimension: tiempo_con_personal {
    type: number
    sql: ${TABLE}."Tiempo con personal" ;;
  }
  dimension: tiempo_de_entrada_a_la_extn {
    type: number
    sql: ${TABLE}."Tiempo de entrada a la extn" ;;
  }
  dimension: tiempo_de_llamado_del_agente {
    type: number
    sql: ${TABLE}."Tiempo de llamado del agente" ;;
  }
  dimension: tiempo_de_salida_de_la_extn {
    type: number
    sql: ${TABLE}."Tiempo de salida de la extn" ;;
  }
  dimension: tiempo_dispon {
    type: number
    sql: ${TABLE}."Tiempo dispon#" ;;
  }
  dimension: usuario_ops {
    type: string
    sql: ${TABLE}."Usuario OPS" ;;
  }
  measure: count {
    type: count
  }
}
