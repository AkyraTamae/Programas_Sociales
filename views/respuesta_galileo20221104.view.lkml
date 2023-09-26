view: respuesta_galileo20221104 {
  sql_table_name: dbo.respuestaGalileo20221104 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: respuesta {
    type: string
    sql: ${TABLE}.respuesta ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
