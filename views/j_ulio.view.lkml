view: j_ulio {
  sql_table_name: dbo.jULIO ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: codigo_producto {
    type: string
    sql: ${TABLE}.CodigoProducto ;;
  }
  dimension: cuentas {
    type: string
    sql: ${TABLE}.Cuentas ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }
  dimension: importe_pesos {
    type: string
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: marca {
    type: string
    sql: ${TABLE}.Marca ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: razon_social_cliente {
    type: string
    sql: ${TABLE}.RazonSocialCliente ;;
  }
  measure: count {
    type: count
  }
}
