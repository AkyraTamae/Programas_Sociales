view: clave_cliente_gasolina {
  sql_table_name: dbo.ClaveClienteGasolina ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  measure: count {
    type: count
  }
}
