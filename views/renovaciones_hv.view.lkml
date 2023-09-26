view: renovaciones_hv {
  sql_table_name: dbo.Renovaciones_HV ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: vigencia {
    type: string
    sql: ${TABLE}.Vigencia ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
