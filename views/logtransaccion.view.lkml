view: logtransaccion {
  sql_table_name: dbo.logtransaccion ;;
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
  dimension: tabla {
    type: string
    sql: ${TABLE}.Tabla ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
