view: pagos_galileo20221104 {
  sql_table_name: dbo.pagosGalileo20221104 ;;
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
  dimension: monto {
    type: number
    sql: ${TABLE}.monto ;;
  }
  dimension: tx {
    type: string
    sql: ${TABLE}.tx ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
