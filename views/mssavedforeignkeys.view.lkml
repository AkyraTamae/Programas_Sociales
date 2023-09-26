view: mssavedforeignkeys {
  sql_table_name: dbo.MSsavedforeignkeys ;;

  dimension: constraint_name {
    type: string
    sql: ${TABLE}.constraint_name ;;
  }
  dimension: delete_referential_action {
    type: number
    sql: ${TABLE}.delete_referential_action ;;
  }
  dimension: is_disabled {
    type: string
    sql: ${TABLE}.is_disabled ;;
  }
  dimension: is_not_for_replication {
    type: string
    sql: ${TABLE}.is_not_for_replication ;;
  }
  dimension: is_not_trusted {
    type: string
    sql: ${TABLE}.is_not_trusted ;;
  }
  dimension: parent_name {
    type: string
    sql: ${TABLE}.parent_name ;;
  }
  dimension: parent_schema {
    type: string
    sql: ${TABLE}.parent_schema ;;
  }
  dimension: program_name {
    type: string
    sql: ${TABLE}.program_name ;;
  }
  dimension: referenced_object_name {
    type: string
    sql: ${TABLE}.referenced_object_name ;;
  }
  dimension: referenced_object_schema {
    type: string
    sql: ${TABLE}.referenced_object_schema ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: update_referential_action {
    type: number
    sql: ${TABLE}.update_referential_action ;;
  }
  measure: count {
    type: count
    drill_fields: [program_name, constraint_name, parent_name, referenced_object_name]
  }
}
