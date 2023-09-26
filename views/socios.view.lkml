view: socios {
  sql_table_name: dbo.SOCIOS ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: sirvo {
    type: number
    sql: ${TABLE}.Sirvo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
