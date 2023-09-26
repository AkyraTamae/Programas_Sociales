view: pronosticos_brox {
  sql_table_name: dbo.PronosticosBrox ;;

  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: descripcion_forma_de_pago {
    type: string
    sql: ${TABLE}.DescripcionFormaDePago ;;
  }
  dimension: descripcion_producto {
    type: string
    sql: ${TABLE}.DescripcionProducto ;;
  }
  dimension_group: fecha_venta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaVenta ;;
  }
  dimension: forma_de_pago_id {
    type: number
    sql: ${TABLE}.FormaDePagoID ;;
  }
  dimension: monto_total_venta {
    type: number
    sql: ${TABLE}.MontoTotalVenta ;;
  }
  dimension: numero_cuenta_id {
    type: string
    sql: ${TABLE}.NumeroCuentaID ;;
  }
  dimension: producto {
    type: number
    sql: ${TABLE}.Producto ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }
  dimension: v_lugar_tot {
    type: number
    sql: ${TABLE}.v_LugarTot ;;
  }
  dimension: venta_id {
    type: number
    sql: ${TABLE}.VentaID ;;
  }
  measure: count {
    type: count
  }
}
