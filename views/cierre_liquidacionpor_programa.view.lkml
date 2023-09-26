view: cierre_liquidacionpor_programa {
  sql_table_name: dbo.CierreLiquidacionporPrograma ;;

  dimension: devoluciones {
    type: number
    sql: ${TABLE}.Devoluciones ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: idprograma {
    type: number
    sql: ${TABLE}.IDPrograma ;;
  }
  dimension: importe_descuento {
    type: number
    sql: ${TABLE}.ImporteDescuento ;;
  }
  dimension: importe_ventas {
    type: number
    sql: ${TABLE}.ImporteVentas ;;
  }
  dimension: liquidacion_comercio {
    type: number
    sql: ${TABLE}.LiquidacionComercio ;;
  }
  dimension: monto_pagado {
    type: number
    sql: ${TABLE}.MontoPagado ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }
  dimension: ventas {
    type: number
    sql: ${TABLE}.Ventas ;;
  }
  measure: count {
    type: count
  }
}
