view: hc_cc_cierres {
  sql_table_name: dbo.HC_CC_CIERRES ;;

  dimension: cedula {
    type: string
    sql: ${TABLE}.CEDULA ;;
  }
  dimension: ext {
    type: number
    sql: ${TABLE}.EXT ;;
  }
  dimension_group: fecha_de_ingreso {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."FECHA DE INGRESO" ;;
  }
  dimension: grupo_avaya {
    type: string
    sql: ${TABLE}."GRUPO AVAYA" ;;
  }
  dimension: hora_de_entrada {
    type: string
    sql: ${TABLE}."HORA DE ENTRADA" ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE ;;
  }
  dimension: puesto {
    type: string
    sql: ${TABLE}.PUESTO ;;
  }
  dimension: qa {
    type: string
    sql: ${TABLE}.QA ;;
  }
  dimension: skill {
    type: string
    sql: ${TABLE}.SKILL ;;
  }
  dimension: supervisor {
    type: string
    sql: ${TABLE}.Supervisor ;;
  }
  dimension: team_leader {
    type: string
    sql: ${TABLE}."TEAM LEADER" ;;
  }
  dimension: turno {
    type: string
    sql: ${TABLE}.TURNO ;;
  }
  dimension: usuario_de_ops {
    type: string
    sql: ${TABLE}."USUARIO DE OPS" ;;
  }
  dimension: usuario_de_ops1 {
    type: string
    sql: ${TABLE}."USUARIO DE OPS1" ;;
  }
  measure: count {
    type: count
  }
}
