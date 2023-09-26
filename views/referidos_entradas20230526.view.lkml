view: referidos_entradas20230526 {
  sql_table_name: dbo.referidosEntradas20230526 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.claveCliente ;;
  }
  dimension: entradas {
    type: number
    sql: ${TABLE}.entradas ;;
  }
  dimension_group: fecha_calculo {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaCalculo ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.monto ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.numCuenta ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
