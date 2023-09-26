view: mssavedforeignkeycolumns {
  sql_table_name: dbo.MSsavedforeignkeycolumns ;;

  dimension: constraint_column_id {
    type: number
    sql: ${TABLE}.constraint_column_id ;;
  }
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
  dimension: referenced_column_name {
    type: string
    sql: ${TABLE}.referenced_column_name ;;
  }
  dimension: referencing_column_name {
    type: string
    sql: ${TABLE}.referencing_column_name ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [program_name, constraint_name, referencing_column_name, referenced_column_name]
  }
}
