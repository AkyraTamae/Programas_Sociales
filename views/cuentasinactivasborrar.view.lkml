view: cuentasinactivasborrar {
  sql_table_name: dbo.cuentasinactivasborrar ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: cve_cte {
    type: string
    sql: ${TABLE}.cve_cte ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  measure: count {
    type: count
  }
}
