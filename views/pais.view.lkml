view: pais {
  sql_table_name: dbo.pais ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Id ;;
  }
  dimension: nacionality {
    type: string
    sql: ${TABLE}.Nacionality ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
