view: tmp_cb {
  sql_table_name: dbo.tmpCb ;;

  dimension: clasificacion {
    type: string
    sql: ${TABLE}.Clasificacion ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.claveCliente ;;
  }
  dimension: codigo {
    type: number
    sql: ${TABLE}.Codigo ;;
  }
  measure: count {
    type: count
  }
}
