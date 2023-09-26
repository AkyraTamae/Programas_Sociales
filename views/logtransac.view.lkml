view: logtransac {
  sql_table_name: dbo.LOGTRANSAC ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension_group: enddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.enddate ;;
  }
  dimension: name_sp {
    type: string
    sql: ${TABLE}.NameSp ;;
  }
  dimension_group: startdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startdate ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
