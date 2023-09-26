view: ado_net_destination {
  sql_table_name: dbo.ADO NET Destination ;;

  dimension: contrasea {
    type: string
    sql: ${TABLE}."ContraseÃ±a" ;;
  }
  dimension: instancia {
    type: string
    sql: ${TABLE}.Instancia ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }
  measure: count {
    type: count
  }
}
