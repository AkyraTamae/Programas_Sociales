view: movimientos_terminado {
  sql_table_name: dbo.MovimientosTerminado ;;

  dimension: acquirer_country_code {
    type: number
    sql: ${TABLE}.ACQUIRER_COUNTRY_CODE ;;
  }
  dimension: acquiring_institution_code {
    type: string
    sql: ${TABLE}.ACQUIRING_INSTITUTION_CODE ;;
  }
  dimension: additional_pos_info {
    type: string
    sql: ${TABLE}.ADDITIONAL_POS_INFO ;;
  }
  dimension: additional_response_data {
    type: string
    sql: ${TABLE}.ADDITIONAL_RESPONSE_DATA ;;
  }
  dimension: au_characteristics_ind {
    type: string
    sql: ${TABLE}.AU_CHARACTERISTICS_IND ;;
  }
  dimension: authorization_code {
    type: string
    sql: ${TABLE}.AUTHORIZATION_CODE ;;
  }
  dimension: card_acceptor_code {
    type: string
    sql: ${TABLE}.CARD_ACCEPTOR_CODE ;;
  }
  dimension: card_acceptor_name {
    type: string
    sql: ${TABLE}.CARD_ACCEPTOR_NAME ;;
  }
  dimension: card_acceptor_terminal_code {
    type: string
    sql: ${TABLE}.CARD_ACCEPTOR_TERMINAL_CODE ;;
  }
  dimension: card_billing_amnt {
    type: number
    sql: ${TABLE}.CARD_BILLING_AMNT ;;
  }
  dimension: card_billing_currency_code {
    type: number
    sql: ${TABLE}.CARD_BILLING_CURRENCY_CODE ;;
  }
  dimension: cashback {
    type: number
    sql: ${TABLE}.CASHBACK ;;
  }
  dimension: chargeback_right_indicator {
    type: string
    sql: ${TABLE}.CHARGEBACK_RIGHT_INDICATOR ;;
  }
  dimension: charged_amount {
    type: number
    sql: ${TABLE}.CHARGED_AMOUNT ;;
  }
  dimension: commercial_and_financing_data {
    type: string
    sql: ${TABLE}.COMMERCIAL_AND_FINANCING_DATA ;;
  }
  dimension: ecommerce_goods_indicator {
    type: string
    sql: ${TABLE}.ECOMMERCE_GOODS_INDICATOR ;;
  }
  dimension: ecommerce_indicators {
    type: string
    sql: ${TABLE}.ECOMMERCE_INDICATORS ;;
  }
  dimension: excluded_transaction_id_reason {
    type: string
    sql: ${TABLE}.EXCLUDED_TRANSACTION_ID_REASON ;;
  }
  dimension: expiration_date {
    type: number
    sql: ${TABLE}.EXPIRATION_DATE ;;
  }
  dimension: external_trace_number_code {
    type: number
    sql: ${TABLE}.EXTERNAL_TRACE_NUMBER_CODE ;;
  }
  dimension: fee_amount {
    type: number
    sql: ${TABLE}.FEE_AMOUNT ;;
  }
  dimension: forwarding_institution_code {
    type: string
    sql: ${TABLE}.FORWARDING_INSTITUTION_CODE ;;
  }
  dimension: id_message_channel {
    type: string
    sql: ${TABLE}.ID_MESSAGE_CHANNEL ;;
  }
  dimension: id_original_response_code {
    type: string
    sql: ${TABLE}.ID_ORIGINAL_RESPONSE_CODE ;;
  }
  dimension: id_original_trx {
    type: number
    sql: ${TABLE}.ID_ORIGINAL_TRX ;;
  }
  dimension: id_response_code {
    type: string
    sql: ${TABLE}.ID_RESPONSE_CODE ;;
  }
  dimension: id_transaction {
    type: number
    sql: ${TABLE}.ID_TRANSACTION ;;
  }
  dimension: id_transaction_status {
    type: number
    sql: ${TABLE}.ID_TRANSACTION_STATUS ;;
  }
  dimension: installment_sequence_count {
    type: number
    sql: ${TABLE}.INSTALLMENT_SEQUENCE_COUNT ;;
  }
  dimension: installment_sequence_number {
    type: number
    sql: ${TABLE}.INSTALLMENT_SEQUENCE_NUMBER ;;
  }
  dimension: is_magstripe_data_present {
    type: number
    sql: ${TABLE}.IS_MAGSTRIPE_DATA_PRESENT ;;
  }
  dimension: is_recurring_payment {
    type: number
    sql: ${TABLE}.IS_RECURRING_PAYMENT ;;
  }
  dimension: is_sms {
    type: number
    sql: ${TABLE}.IS_SMS ;;
  }
  dimension_group: local {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LOCAL_DATE ;;
  }
  dimension: market_specific_data_id {
    type: string
    sql: ${TABLE}.MARKET_SPECIFIC_DATA_ID ;;
  }
  dimension: mcc_code {
    type: number
    sql: ${TABLE}.MCC_CODE ;;
  }
  dimension: merchant_verification_value {
    type: string
    sql: ${TABLE}.MERCHANT_VERIFICATION_VALUE ;;
  }
  dimension: message_amnt {
    type: number
    sql: ${TABLE}.MESSAGE_AMNT ;;
  }
  dimension: message_currency_code {
    type: number
    sql: ${TABLE}.MESSAGE_CURRENCY_CODE ;;
  }
  dimension: mti_code {
    type: number
    sql: ${TABLE}.MTI_CODE ;;
  }
  dimension: mult_clearing_sequence_count {
    type: number
    sql: ${TABLE}.MULT_CLEARING_SEQUENCE_COUNT ;;
  }
  dimension: mult_clearing_sequence_number {
    type: number
    sql: ${TABLE}.MULT_CLEARING_SEQUENCE_NUMBER ;;
  }
  dimension: network_id {
    type: string
    sql: ${TABLE}.NETWORK_ID ;;
  }
  dimension: node_id {
    type: string
    sql: ${TABLE}.NODE_ID ;;
  }
  dimension: original_external_trace_number {
    type: number
    sql: ${TABLE}.ORIGINAL_EXTERNAL_TRACE_NUMBER ;;
  }
  dimension: original_message_amnt {
    type: number
    sql: ${TABLE}.ORIGINAL_MESSAGE_AMNT ;;
  }
  dimension: pan_sequence_number {
    type: number
    sql: ${TABLE}.PAN_SEQUENCE_NUMBER ;;
  }
  dimension: partially_confirmed_amount {
    type: number
    sql: ${TABLE}.PARTIALLY_CONFIRMED_AMOUNT ;;
  }
  dimension: pin_entry_capability {
    type: number
    sql: ${TABLE}.PIN_ENTRY_CAPABILITY ;;
  }
  dimension: pin_service_code {
    type: string
    sql: ${TABLE}.PIN_SERVICE_CODE ;;
  }
  dimension: pos_condition_code {
    type: number
    sql: ${TABLE}.POS_CONDITION_CODE ;;
  }
  dimension: pos_data {
    type: string
    sql: ${TABLE}.POS_DATA ;;
  }
  dimension: pos_entry_mode {
    type: number
    sql: ${TABLE}.POS_ENTRY_MODE ;;
  }
  dimension: processing_code {
    type: string
    sql: ${TABLE}.PROCESSING_CODE ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}.PRODUCT_ID ;;
  }
  dimension: program_id {
    type: string
    sql: ${TABLE}.PROGRAM_ID ;;
  }
  dimension: rejection_rule_id {
    type: number
    sql: ${TABLE}.REJECTION_RULE_ID ;;
  }
  dimension: response_originator {
    type: number
    sql: ${TABLE}.RESPONSE_ORIGINATOR ;;
  }
  dimension: rrn {
    type: string
    sql: ${TABLE}.RRN ;;
  }
  dimension: service_code {
    type: string
    sql: ${TABLE}.SERVICE_CODE ;;
  }
  dimension: settlement_amount {
    type: number
    sql: ${TABLE}.SETTLEMENT_AMOUNT ;;
  }
  dimension: settlement_currency_code {
    type: number
    sql: ${TABLE}.SETTLEMENT_CURRENCY_CODE ;;
  }
  dimension_group: settlement {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.SETTLEMENT_DATE ;;
  }
  dimension: source_connection {
    type: string
    sql: ${TABLE}.SOURCE_CONNECTION ;;
  }
  dimension: terminal_entry_capability {
    type: number
    sql: ${TABLE}.TERMINAL_ENTRY_CAPABILITY ;;
  }
  dimension: tip_amount {
    type: number
    sql: ${TABLE}.TIP_AMOUNT ;;
  }
  dimension_group: transaction_begin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TRANSACTION_BEGIN_TIME ;;
  }
  dimension: transaction_bin {
    type: string
    sql: ${TABLE}.TRANSACTION_BIN ;;
  }
  dimension: transaction_category {
    type: number
    sql: ${TABLE}.TRANSACTION_CATEGORY ;;
  }
  dimension: transaction_category_code {
    type: string
    sql: ${TABLE}.TRANSACTION_CATEGORY_CODE ;;
  }
  dimension: transaction_city_name {
    type: string
    sql: ${TABLE}.TRANSACTION_CITY_NAME ;;
  }
  dimension: transaction_country_code {
    type: string
    sql: ${TABLE}.TRANSACTION_COUNTRY_CODE ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TRANSACTION_DATE ;;
  }
  dimension_group: transaction_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TRANSACTION_END_TIME ;;
  }
  dimension: transaction_geo_state_name {
    type: string
    sql: ${TABLE}.TRANSACTION_GEO_STATE_NAME ;;
  }
  dimension: transaction_identifier {
    type: string
    sql: ${TABLE}.TRANSACTION_IDENTIFIER ;;
  }
  dimension: transaction_masked_pan {
    type: string
    sql: ${TABLE}.TRANSACTION_MASKED_PAN ;;
  }
  dimension: transaction_pan {
    type: string
    sql: ${TABLE}.TRANSACTION_PAN ;;
  }
  dimension: transaction_type {
    type: number
    sql: ${TABLE}.TRANSACTION_TYPE ;;
  }
  dimension: ucaf {
    type: string
    sql: ${TABLE}.UCAF ;;
  }
  dimension: validation_code {
    type: string
    sql: ${TABLE}.VALIDATION_CODE ;;
  }
  measure: count {
    type: count
    drill_fields: [card_acceptor_name, transaction_geo_state_name, transaction_city_name]
  }
}
