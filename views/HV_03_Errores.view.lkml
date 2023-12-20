view: hv_03_errores {
  sql_table_name: dbo.HvDocumentLogByLine ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: credit_number {
    type: string
    sql: ${TABLE}.CreditNumber ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: error_code {
    type: string
    sql: ${TABLE}.ErrorCode ;;
  }
  dimension: file_name {
    type: string
    sql: ${TABLE}.FileName ;;
  }
  dimension: line {
    type: number
    sql: ${TABLE}.Line ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: nss {
    type: string
    sql: ${TABLE}.NSS ;;
  }
  dimension_group: processed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ProcessedDate ;;
  }
  dimension: reason {
    type: string
    sql: ${TABLE}.Reason ;;
  }
  dimension: sin_fe_nac {
    type: number
    sql: ${TABLE}.SinFeNac ;;
  }
  dimension: telephone_number {
    type: string
    sql: ${TABLE}.TelephoneNumber ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, file_name]
  }
}
