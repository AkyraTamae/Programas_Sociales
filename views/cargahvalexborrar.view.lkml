view: cargahvalexborrar {
  sql_table_name: dbo.cargahvalexborrar ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  measure: count {
    type: count
  }
}
