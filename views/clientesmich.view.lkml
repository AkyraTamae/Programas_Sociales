view: clientesmich {
  sql_table_name: dbo.clientesmich ;;

  dimension: numcuenta {
    type: string
    sql: ${TABLE}.numcuenta ;;
  }
  measure: count {
    type: count
  }
}
