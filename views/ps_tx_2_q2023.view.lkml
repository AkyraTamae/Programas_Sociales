view: ps_tx_2_q2023 {
  sql_table_name: dbo.PS_TX_2Q2023 ;;

  dimension: closed_loop {
    type: string
    sql: ${TABLE}.CLOSED_LOOP ;;
  }
  dimension: country_code {
    type: string
    sql: ${TABLE}.COUNTRY_CODE ;;
  }
  dimension: cp {
    type: string
    sql: ${TABLE}.CP ;;
  }
  dimension: debito_credito {
    type: string
    sql: ${TABLE}.DebitoCredito ;;
  }
  dimension: id_mcc {
    type: string
    sql: ${TABLE}.ID_MCC ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }
  dimension: operation_code {
    type: number
    sql: ${TABLE}.OPERATION_CODE ;;
  }
  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }
  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }
  dimension: type {
    type: number
    sql: ${TABLE}.TYPE ;;
  }
  measure: count {
    type: count
  }
}
