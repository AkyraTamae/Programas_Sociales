view: itx_transaction {
  sql_table_name: dbo.ITX_TRANSACTION ;;

  dimension: acquiring_institution_code {
    type: string
    sql: ${TABLE}.ACQUIRING_INSTITUTION_CODE ;;
  }
  dimension: apply_tax_return {
    type: number
    sql: ${TABLE}.APPLY_TAX_RETURN ;;
  }
  dimension: arn {
    type: string
    sql: ${TABLE}.ARN ;;
  }
  dimension: arn_business_id {
    type: string
    sql: ${TABLE}.ARN_BUSINESS_ID ;;
  }
  dimension: au_characteristics_ind {
    type: string
    sql: ${TABLE}.AU_CHARACTERISTICS_IND ;;
  }
  dimension: authorization_code {
    type: string
    sql: ${TABLE}.AUTHORIZATION_CODE ;;
  }
  dimension: authorization_issuer {
    type: number
    sql: ${TABLE}.AUTHORIZATION_ISSUER ;;
  }
  dimension: authorization_response_code {
    type: string
    sql: ${TABLE}.AUTHORIZATION_RESPONSE_CODE ;;
  }
  dimension: authorization_source_code {
    type: string
    sql: ${TABLE}.AUTHORIZATION_SOURCE_CODE ;;
  }
  dimension: batch_number {
    type: string
    sql: ${TABLE}.BATCH_NUMBER ;;
  }
  dimension: branch_name {
    type: string
    sql: ${TABLE}.BRANCH_NAME ;;
  }
  dimension: brand_fee_amount {
    type: number
    sql: ${TABLE}.BRAND_FEE_AMOUNT ;;
  }
  dimension: brand_fee_tax_amount {
    type: number
    sql: ${TABLE}.BRAND_FEE_TAX_AMOUNT ;;
  }
  dimension: brand_settlement_amount {
    type: number
    sql: ${TABLE}.BRAND_SETTLEMENT_AMOUNT ;;
  }
  dimension: brand_settlement_currency_code {
    type: number
    sql: ${TABLE}.BRAND_SETTLEMENT_CURRENCY_CODE ;;
  }
  dimension: brand_settlement_date {
    type: string
    sql: ${TABLE}.BRAND_SETTLEMENT_DATE ;;
  }
  dimension: card_acceptor_id {
    type: string
    sql: ${TABLE}.CARD_ACCEPTOR_ID ;;
  }
  dimension: card_billing_conversion_rate {
    type: number
    sql: ${TABLE}.CARD_BILLING_CONVERSION_RATE ;;
  }
  dimension: card_number {
    type: string
    sql: ${TABLE}.CARD_NUMBER ;;
  }
  dimension: cashback {
    type: number
    sql: ${TABLE}.CASHBACK ;;
  }
  dimension: category {
    type: number
    sql: ${TABLE}.CATEGORY ;;
  }
  dimension_group: central_process {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CENTRAL_PROCESS_DATE ;;
  }
  dimension: currency_codes {
    type: string
    sql: ${TABLE}.CURRENCY_CODES ;;
  }
  dimension: currency_exponents {
    type: string
    sql: ${TABLE}.CURRENCY_EXPONENTS ;;
  }
  dimension: customer_id_method {
    type: string
    sql: ${TABLE}.CUSTOMER_ID_METHOD ;;
  }
  dimension: ecommerce_security_indicator {
    type: number
    sql: ${TABLE}.ECOMMERCE_SECURITY_INDICATOR ;;
  }
  dimension: entry_mode {
    type: number
    sql: ${TABLE}.ENTRY_MODE ;;
  }
  dimension: external_authorization_id {
    type: number
    sql: ${TABLE}.EXTERNAL_AUTHORIZATION_ID ;;
  }
  dimension: external_trace_number {
    type: number
    sql: ${TABLE}.EXTERNAL_TRACE_NUMBER ;;
  }
  dimension: fee_amount {
    type: number
    sql: ${TABLE}.FEE_AMOUNT ;;
  }
  dimension: forwarding_institution_code {
    type: string
    sql: ${TABLE}.FORWARDING_INSTITUTION_CODE ;;
  }
  dimension: has_chargeback {
    type: number
    sql: ${TABLE}.HAS_CHARGEBACK ;;
  }
  dimension: has_copy_request {
    type: number
    sql: ${TABLE}.HAS_COPY_REQUEST ;;
  }
  dimension: has_fraud_report {
    type: number
    sql: ${TABLE}.HAS_FRAUD_REPORT ;;
  }
  dimension: has_representation {
    type: number
    sql: ${TABLE}.HAS_REPRESENTATION ;;
  }
  dimension: id_acq_confirmed_transaction {
    type: number
    sql: ${TABLE}.ID_ACQ_CONFIRMED_TRANSACTION ;;
  }
  dimension: id_acquirer {
    type: number
    sql: ${TABLE}.ID_ACQUIRER ;;
  }
  dimension: id_branch {
    type: number
    sql: ${TABLE}.ID_BRANCH ;;
  }
  dimension: id_brand {
    type: number
    sql: ${TABLE}.ID_BRAND ;;
  }
  dimension: id_brand_fee_currency {
    type: number
    sql: ${TABLE}.ID_BRAND_FEE_CURRENCY ;;
  }
  dimension: id_country {
    type: number
    sql: ${TABLE}.ID_COUNTRY ;;
  }
  dimension: id_customer {
    type: number
    sql: ${TABLE}.ID_CUSTOMER ;;
  }
  dimension: id_geo_state {
    type: number
    sql: ${TABLE}.ID_GEO_STATE ;;
  }
  dimension: id_issuer {
    type: number
    sql: ${TABLE}.ID_ISSUER ;;
  }
  dimension: id_issuer_currency {
    type: number
    sql: ${TABLE}.ID_ISSUER_CURRENCY ;;
  }
  dimension: id_mcc {
    type: number
    sql: ${TABLE}.ID_MCC ;;
  }
  dimension: id_payment_media {
    type: number
    sql: ${TABLE}.ID_PAYMENT_MEDIA ;;
  }
  dimension: id_product {
    type: number
    sql: ${TABLE}.ID_PRODUCT ;;
  }
  dimension: id_sale_currency {
    type: number
    sql: ${TABLE}.ID_SALE_CURRENCY ;;
  }
  dimension: id_sale_plan {
    type: number
    sql: ${TABLE}.ID_SALE_PLAN ;;
  }
  dimension: id_tx {
    type: number
    sql: ${TABLE}.ID_TX ;;
  }
  dimension: installment_number {
    type: number
    sql: ${TABLE}.INSTALLMENT_NUMBER ;;
  }
  dimension: installment_quantity {
    type: number
    sql: ${TABLE}.INSTALLMENT_QUANTITY ;;
  }
  dimension: ird {
    type: string
    sql: ${TABLE}.IRD ;;
  }
  dimension: issuer_amount {
    type: number
    sql: ${TABLE}.ISSUER_AMOUNT ;;
  }
  dimension: issuer_amount_recibido {
    type: number
    sql: ${TABLE}.issuer_amount_RECIBIDO ;;
  }
  dimension: late_presentment {
    type: string
    sql: ${TABLE}.LATE_PRESENTMENT ;;
  }
  dimension: market_specific_data_id {
    type: string
    sql: ${TABLE}.MARKET_SPECIFIC_DATA_ID ;;
  }
  dimension: merchant_address {
    type: string
    sql: ${TABLE}.MERCHANT_ADDRESS ;;
  }
  dimension: merchant_city {
    type: string
    sql: ${TABLE}.MERCHANT_CITY ;;
  }
  dimension: merchant_country_code {
    type: string
    sql: ${TABLE}.MERCHANT_COUNTRY_CODE ;;
  }
  dimension: merchant_name {
    type: string
    sql: ${TABLE}.MERCHANT_NAME ;;
  }
  dimension: merchant_province_code {
    type: string
    sql: ${TABLE}.MERCHANT_PROVINCE_CODE ;;
  }
  dimension: merchant_tax_id {
    type: string
    sql: ${TABLE}.MERCHANT_TAX_ID ;;
  }
  dimension: merchant_zip_code {
    type: string
    sql: ${TABLE}.MERCHANT_ZIP_CODE ;;
  }
  dimension: motoeci {
    type: string
    sql: ${TABLE}.MOTOECI ;;
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
  dimension: origin {
    type: number
    sql: ${TABLE}.ORIGIN ;;
  }
  dimension: original_issuer_amount {
    type: number
    sql: ${TABLE}.ORIGINAL_ISSUER_AMOUNT ;;
  }
  dimension: original_response_code {
    type: string
    sql: ${TABLE}.ORIGINAL_RESPONSE_CODE ;;
  }
  dimension: original_trx_total_amount {
    type: number
    sql: ${TABLE}.ORIGINAL_TRX_TOTAL_AMOUNT ;;
  }
  dimension: overdraft_amount {
    type: number
    sql: ${TABLE}.OVERDRAFT_AMOUNT ;;
  }
  dimension: pos_data {
    type: string
    sql: ${TABLE}.POS_DATA ;;
  }
  dimension: pos_terminal_capability {
    type: string
    sql: ${TABLE}.POS_TERMINAL_CAPABILITY ;;
  }
  dimension_group: posting {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.POSTING_DATE ;;
  }
  dimension: posting_status {
    type: number
    sql: ${TABLE}.POSTING_STATUS ;;
  }
  dimension_group: processed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.PROCESSED_DATE ;;
  }
  dimension: processing_code {
    type: string
    sql: ${TABLE}.PROCESSING_CODE ;;
  }
  dimension: product {
    type: string
    sql: ${TABLE}.PRODUCT ;;
  }
  dimension_group: purchase {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.PURCHASE_DATE ;;
  }
  dimension: rate_usada {
    type: number
    sql: ${TABLE}.rate_USADA ;;
  }
  dimension: requested_payment_service {
    type: string
    sql: ${TABLE}.REQUESTED_PAYMENT_SERVICE ;;
  }
  dimension: response_code {
    type: string
    sql: ${TABLE}.RESPONSE_CODE ;;
  }
  dimension: response_originator {
    type: number
    sql: ${TABLE}.RESPONSE_ORIGINATOR ;;
  }
  dimension: rrn {
    type: string
    sql: ${TABLE}.RRN ;;
  }
  dimension: sale_amount {
    type: number
    sql: ${TABLE}.SALE_AMOUNT ;;
  }
  dimension: scope {
    type: number
    sql: ${TABLE}.SCOPE ;;
  }
  dimension: subclass {
    type: number
    sql: ${TABLE}.SUBCLASS ;;
  }
  dimension: terminal_code {
    type: string
    sql: ${TABLE}.TERMINAL_CODE ;;
  }
  dimension: terminal_entry_capability {
    type: number
    sql: ${TABLE}.TERMINAL_ENTRY_CAPABILITY ;;
  }
  dimension: terminal_type {
    type: string
    sql: ${TABLE}.TERMINAL_TYPE ;;
  }
  dimension: tip_amount {
    type: string
    sql: ${TABLE}.TIP_AMOUNT ;;
  }
  dimension_group: transaction_begin_time_aas {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TRANSACTION_BEGIN_TIME_AAS ;;
  }
  dimension: transaction_bin {
    type: string
    sql: ${TABLE}.TRANSACTION_BIN ;;
  }
  dimension: transaction_identifier {
    type: string
    sql: ${TABLE}.TRANSACTION_IDENTIFIER ;;
  }
  dimension: transaction_masked_pan {
    type: string
    sql: ${TABLE}.TRANSACTION_MASKED_PAN ;;
  }
  dimension: tx_type {
    type: number
    sql: ${TABLE}.TX_TYPE ;;
  }
  dimension: used_sale_plan_type {
    type: number
    sql: ${TABLE}.USED_SALE_PLAN_TYPE ;;
  }
  measure: count {
    type: count
    drill_fields: [merchant_name, branch_name]
  }
}
