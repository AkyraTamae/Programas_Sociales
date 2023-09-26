view: asig_cxa {
  sql_table_name: dbo.Asig_CXA ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."AÑO" ;;
  }
  dimension: asignacion {
    type: number
    sql: ${TABLE}.asignacion ;;
  }
  dimension: comisionporasignacion {
    type: number
    sql: ${TABLE}.comisionporasignacion ;;
  }
  dimension_group: fechas {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.fechas ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.MES ;;
  }
  dimension: programas {
    type: string
    sql: ${TABLE}.programas ;;
  }
  measure: count {
    type: count
  }
}
