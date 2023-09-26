view: cargaryborrar {
  sql_table_name: dbo.cargaryborrar ;;

  dimension: column1 {
    type: string
    sql: ${TABLE}.Column1 ;;
  }
  measure: count {
    type: count
  }
}
