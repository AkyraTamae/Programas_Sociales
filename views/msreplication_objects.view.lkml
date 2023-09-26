view: msreplication_objects {
  sql_table_name: dbo.MSreplication_objects ;;

  dimension: article {
    type: string
    sql: ${TABLE}.article ;;
  }
  dimension: object_name {
    type: string
    sql: ${TABLE}.object_name ;;
  }
  dimension: object_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }
  dimension: publication {
    type: string
    sql: ${TABLE}.publication ;;
  }
  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }
  dimension: publisher_db {
    type: string
    sql: ${TABLE}.publisher_db ;;
  }
  measure: count {
    type: count
    drill_fields: [object_name]
  }
}
