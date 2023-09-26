view: disponibles_concentrado {
  sql_table_name: dbo.DisponiblesConcentrado ;;

  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: dispersiones {
    type: number
    sql: ${TABLE}.dispersiones ;;
  }
  dimension: disponible_post {
    type: number
    sql: ${TABLE}.disponiblePost ;;
  }
  dimension: monto_calculado {
    type: number
    sql: ${TABLE}.MontoCalculado ;;
  }
  dimension: movimientos {
    type: number
    sql: ${TABLE}.Movimientos ;;
  }
  dimension: pagos {
    type: number
    sql: ${TABLE}.Pagos ;;
  }
  dimension: pre_disponible {
    type: number
    sql: ${TABLE}.PreDisponible ;;
  }
  measure: count {
    type: count
  }
}
