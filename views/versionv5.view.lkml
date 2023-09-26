view: versionv5 {
  sql_table_name: dbo.Versionv5 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.fecha ;;
  }
  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
