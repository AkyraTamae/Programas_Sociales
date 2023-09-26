view: calculo_srgiro {
  sql_table_name: dbo.Calculo_SRGiro ;;

  dimension: clientes {
    type: number
    sql: ${TABLE}.Clientes ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }
  dimension: row_num {
    type: number
    sql: ${TABLE}.RowNum ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }
  measure: count {
    type: count
  }
}
