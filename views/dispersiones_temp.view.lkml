view: dispersiones_temp {
  sql_table_name: dbo.DispersionesTemp ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: disponible {
    type: number
    sql: ${TABLE}.Disponible ;;
  }
  measure: count {
    type: count
  }
}
