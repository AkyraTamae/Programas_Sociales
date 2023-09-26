view: tabla_destino {
  sql_table_name: dbo.tabla_destino ;;

  dimension: activaciones {
    type: number
    sql: ${TABLE}.Activaciones ;;
  }
  dimension: anio {
    type: number
    sql: ${TABLE}.Anio ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }
  measure: count {
    type: count
  }
}
