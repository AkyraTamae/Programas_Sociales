view: excepcion_nomina {
  sql_table_name: dbo.ExcepcionNomina ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
