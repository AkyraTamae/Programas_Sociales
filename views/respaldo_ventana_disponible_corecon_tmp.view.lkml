view: respaldo_ventana_disponible_corecon_tmp {
  sql_table_name: dbo.RespaldoVentanaDisponibleCoreconTMP ;;

  dimension: disponible {
    type: number
    sql: ${TABLE}.Disponible ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  measure: count {
    type: count
  }
}
