view: mssavedforeignkeyextendedproperties {
  sql_table_name: dbo.MSsavedforeignkeyextendedproperties ;;

  dimension: constraint_name {
    type: string
    sql: ${TABLE}.constraint_name ;;
  }
  dimension: parent_schema {
    type: string
    sql: ${TABLE}.parent_schema ;;
  }
  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }
  dimension: property_name {
    type: string
    sql: ${TABLE}.property_name ;;
  }
  dimension: property_value {
    type: string
    sql: ${TABLE}.property_value ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [program_name, constraint_name, property_name]
  }
}
