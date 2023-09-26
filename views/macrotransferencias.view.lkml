view: macrotransferencias {
  sql_table_name: dbo.macrotransferencias ;;

  dimension: clasificacion {
    type: number
    sql: ${TABLE}.clasificacion ;;
  }
  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: dispersiones {
    type: number
    sql: ${TABLE}.dispersiones ;;
  }
  dimension: entrada {
    type: string
    sql: ${TABLE}.entrada ;;
  }
  dimension: estatusdispersion {
    type: string
    sql: ${TABLE}.estatusdispersion ;;
  }
  dimension_group: maxfechadispersion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.maxfechadispersion ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
  }
}
