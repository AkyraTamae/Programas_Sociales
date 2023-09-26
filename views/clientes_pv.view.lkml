view: clientes_pv {
  sql_table_name: dbo.Clientes_PV ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  measure: count {
    type: count
  }
}
