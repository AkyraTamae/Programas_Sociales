include: "/views/Transacciones_mensual_all.view"
view: include_transacciones_mensual_all {
  extends: [transacciones_mensual_all]

  dimension_group: fecha_compra {
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    type: time
    sql: ${TABLE}.fecha_compra ;;
  }
  measure: sum_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }
}
