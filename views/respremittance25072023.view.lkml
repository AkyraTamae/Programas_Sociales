view: respremittance25072023 {
  sql_table_name: dbo.respremittance25072023 ;;

  dimension: authorization_number {
    type: string
    sql: ${TABLE}.authorizationNumber ;;
  }
  dimension: beneficiary_amount {
    type: number
    sql: ${TABLE}.BeneficiaryAmount ;;
  }
  dimension: commision {
    type: number
    sql: ${TABLE}.Commision ;;
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
  dimension: final_exchange_amount {
    type: number
    sql: ${TABLE}.FinalExchangeAmount ;;
  }
  dimension: id_commission_type {
    type: number
    sql: ${TABLE}.IdCommissionType ;;
  }
  dimension: id_currency_destination {
    type: string
    sql: ${TABLE}.IdCurrencyDestination ;;
  }
  dimension: id_currency_origin {
    type: string
    sql: ${TABLE}.IdCurrencyOrigin ;;
  }
  dimension: id_exchange_type {
    type: number
    sql: ${TABLE}.IdExchangeType ;;
  }
  dimension: id_operation_status {
    type: number
    sql: ${TABLE}.IdOperationStatus ;;
  }
  dimension: id_producto {
    type: string
    sql: ${TABLE}.IdProducto ;;
  }
  dimension: id_remittance {
    type: number
    sql: ${TABLE}.IdRemittance ;;
  }
  dimension: id_remittance_type {
    type: number
    sql: ${TABLE}.IdRemittanceType ;;
  }
  dimension: id_user_destination {
    type: string
    sql: ${TABLE}.IdUserDestination ;;
  }
  dimension: id_user_origin {
    type: string
    sql: ${TABLE}.IdUserOrigin ;;
  }
  dimension: initial_exchange_amount {
    type: number
    sql: ${TABLE}.InitialExchangeAmount ;;
  }
  dimension: real_commission {
    type: number
    sql: ${TABLE}.RealCommission ;;
  }
  dimension: remittance_amount {
    type: number
    sql: ${TABLE}.RemittanceAmount ;;
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
