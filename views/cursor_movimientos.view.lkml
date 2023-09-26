view: cursor_movimientos {
  sql_table_name: dbo.Cursor_Movimientos ;;

  dimension: activaciones {
    type: number
    sql: ${TABLE}.Activaciones ;;
  }
  dimension: anio {
    type: number
    sql: ${TABLE}.Anio ;;
  }
  dimension: desactivaciones {
    type: number
    sql: ${TABLE}.Desactivaciones ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }
  dimension: resta_activaciones {
    type: number
    sql: ${TABLE}.RestaActivaciones ;;
  }
  dimension: suma_activaciones {
    type: number
    sql: ${TABLE}.SumaActivaciones ;;
  }
  measure: count {
    type: count
  }
}
