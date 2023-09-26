view: renovaciones {
  sql_table_name: dbo.renovaciones ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.credito ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: vigencia {
    type: string
    sql: ${TABLE}.vigencia ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
