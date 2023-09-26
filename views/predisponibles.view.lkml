view: predisponibles {
  sql_table_name: dbo.Predisponibles ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: pre_disponible {
    type: number
    sql: ${TABLE}.PreDisponible ;;
  }
  measure: count {
    type: count
  }
}
