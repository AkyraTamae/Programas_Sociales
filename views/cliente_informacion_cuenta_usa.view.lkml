view: cliente_informacion_cuenta_usa {
  sql_table_name: dbo.ClienteInformacionCuentaUSA ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: account_number {
    type: number
    sql: ${TABLE}.AccountNumber ;;
  }
  dimension: card_id {
    type: number
    sql: ${TABLE}.CardId ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: idcliente_informacion_usa {
    type: number
    sql: ${TABLE}.IDClienteInformacionUSA ;;
  }
  dimension: idcuenta {
    type: number
    sql: ${TABLE}.IDCuenta ;;
  }
  dimension: prn {
    type: string
    sql: ${TABLE}.PRN ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.ProductId ;;
  }
  dimension: tarjeta_agregada {
    type: number
    sql: ${TABLE}.TarjetaAgregada ;;
  }
  dimension: transaccion_id {
    type: string
    sql: ${TABLE}.TransaccionId ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
