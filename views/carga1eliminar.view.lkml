view: carga1eliminar {
  sql_table_name: dbo.carga1eliminar ;;

  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: factura {
    type: string
    sql: ${TABLE}.factura ;;
  }
  dimension: monto {
    type: string
    sql: ${TABLE}.monto ;;
  }
  dimension: numero_oficio2 {
    type: string
    sql: ${TABLE}.NumeroOficio2 ;;
  }
  dimension: numerocuentas {
    type: string
    sql: ${TABLE}.numerocuentas ;;
  }
  measure: count {
    type: count
  }
}
