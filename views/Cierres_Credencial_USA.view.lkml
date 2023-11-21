view: cierres_credencial_usa {
 sql_table_name: 'broxelco_rdg.FiltrosGRL12USA' ;;

dimension_group: fecha{
  type: time
  timeframes: [raw, time, date, week, month, quarter, year]
  datatype: datetime
  sql: ${TABLE}.Fecha ;;
}

dimension: producto {
  type: string
  sql: ${TABLE}.Producti ;;
}

dimension: clave_cliente{
  type: string
  sql: ${TABLE}.Clave_Cliente ;;
}

measure: operaciones {
  type: sum
  value_format: "#,##0.00"
  sql: ${TABLE}.Operaciones ;;
}

  measure: cuenta {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.Cuenta ;;
}

measure: importe_pesos {
  type: sum
  value_format: "$#,##0.00;-$#,##0.00"
  sql: ${TABLE}.ImportePesos ;;
}

measure: monto_intercambio{
  type: sum
  value_format: "$#,##0.00;-$#,##0.00"
  sql: ${TABLE}.MontoIntercambio ;;
}


}
