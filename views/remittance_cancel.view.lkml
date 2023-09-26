view: remittance_cancel {
  sql_table_name: dbo.RemittanceCancel ;;

  dimension: beneficiary_amount {
    type: number
    sql: ${TABLE}.BeneficiaryAmount ;;
  }
  dimension: commision_cancel {
    type: number
    sql: ${TABLE}.CommisionCancel ;;
  }
  dimension: commision_percentage {
    type: number
    sql: ${TABLE}.CommisionPercentage ;;
  }
  dimension_group: date_modify {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.DateModify ;;
  }
  dimension_group: date_register {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.DateRegister ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }
  dimension: final_exchange_amount_cancel {
    type: number
    sql: ${TABLE}.FinalExchangeAmountCancel ;;
  }
  dimension: id_commission_type {
    type: number
    sql: ${TABLE}.IdCommissionType ;;
  }
  dimension: id_currency_destination_cancel {
    type: string
    sql: ${TABLE}.IdCurrencyDestinationCancel ;;
  }
  dimension: id_currency_origin_cancel {
    type: string
    sql: ${TABLE}.IdCurrencyOriginCancel ;;
  }
  dimension: id_exchange_type_cancel {
    type: number
    sql: ${TABLE}.IdExchangeTypeCancel ;;
  }
  dimension: id_operation_status {
    type: number
    sql: ${TABLE}.IdOperationStatus ;;
  }
  dimension: id_producto {
    type: string
    sql: ${TABLE}.IdProducto ;;
  }
  dimension: id_remittance_cancel {
    type: number
    sql: ${TABLE}.IdRemittanceCancel ;;
  }
  dimension: id_remittance_type {
    type: number
    sql: ${TABLE}.IdRemittanceType ;;
  }
  dimension: id_user_destination_cancel {
    type: string
    sql: ${TABLE}.IdUserDestinationCancel ;;
  }
  dimension: id_user_origin_cancel {
    type: string
    sql: ${TABLE}.IdUserOriginCancel ;;
  }
  dimension: initial_exchange_amount {
    type: number
    sql: ${TABLE}.InitialExchangeAmount ;;
  }
  dimension: real_commission {
    type: number
    sql: ${TABLE}.RealCommission ;;
  }
  dimension: remittance_amount_cancel {
    type: number
    sql: ${TABLE}.RemittanceAmountCancel ;;
  }
  dimension: remittance_key {
    type: string
    sql: ${TABLE}.RemittanceKey ;;
  }
  dimension: spread {
    type: number
    sql: ${TABLE}.Spread ;;
  }
  dimension: spread_increase {
    type: number
    sql: ${TABLE}.SpreadIncrease ;;
  }
  dimension: tcmarket {
    type: number
    sql: ${TABLE}.TCMarket ;;
  }
  dimension: tcplote {
    type: number
    sql: ${TABLE}.TCPLote ;;
  }
  dimension: user_modify {
    type: string
    sql: ${TABLE}.UserModify ;;
  }
  dimension: user_register {
    type: string
    sql: ${TABLE}.UserRegister ;;
  }
  measure: count {
    type: count
  }
}
