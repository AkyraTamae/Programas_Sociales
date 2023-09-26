view: b2_ccomunicacion_borrar {
  sql_table_name: dbo.B2CComunicacionBorrar ;;

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }
  dimension: producto_b2_c_mx {
    type: string
    sql: ${TABLE}.ProductoB2C_MX ;;
  }
  measure: count {
    type: count
  }
}
