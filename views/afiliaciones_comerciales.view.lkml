view: afiliaciones_comerciales {
  sql_table_name: dbo.AfiliacionesComerciales ;;

  dimension: afiliacion {
    type: string
    sql: ${TABLE}.Afiliacion ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: grupo {
    type: string
    sql: ${TABLE}.Grupo ;;
  }
  dimension: proyecto {
    type: string
    sql: ${TABLE}.Proyecto ;;
  }
  measure: count {
    type: count
  }
}
