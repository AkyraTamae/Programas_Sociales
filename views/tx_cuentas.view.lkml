view: tx_cuentas {
  sql_table_name: dbo.TX_Cuentas ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: codigo_producto {
    type: string
    sql: ${TABLE}.CodigoProducto ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
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
