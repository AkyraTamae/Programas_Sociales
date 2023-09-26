view: motivo_rechazo_expediente {
  sql_table_name: dbo.MotivoRechazoExpediente ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: motivo {
    type: string
    sql: ${TABLE}.Motivo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
