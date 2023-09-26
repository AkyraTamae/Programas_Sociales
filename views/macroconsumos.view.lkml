view: macroconsumos {
  sql_table_name: dbo.macroconsumos ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."año" ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: consumo {
    type: number
    sql: ${TABLE}.consumo ;;
  }
  dimension: cuentas_de_la_clave {
    type: number
    sql: ${TABLE}.cuentas_de_la_clave ;;
  }
  dimension: cuentas_transaccionadas {
    type: number
    sql: ${TABLE}.cuentas_transaccionadas ;;
  }
  dimension_group: fechacompleta {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechacompleta ;;
  }
  dimension: intercambio {
    type: number
    sql: ${TABLE}.intercambio ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.mes ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
  }
}
