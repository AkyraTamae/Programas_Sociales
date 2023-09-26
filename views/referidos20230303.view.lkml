view: referidos20230303 {
  sql_table_name: dbo.referidos20230303 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: boom {
    type: string
    sql: ${TABLE}.boom ;;
  }
  dimension: codigo_referenciacion {
    type: string
    sql: ${TABLE}.codigoReferenciacion ;;
  }
  dimension_group: fecha_importado {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaImportado ;;
  }
  dimension_group: fecha_referenciado_pago {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaReferenciadoPago ;;
  }
  dimension_group: fecha_referenciador_pago {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaReferenciadorPago ;;
  }
  dimension: id_referenciador {
    type: string
    sql: ${TABLE}.idReferenciador ;;
  }
  dimension: referenciado_celular {
    type: string
    sql: ${TABLE}.referenciadoCelular ;;
  }
  dimension: referenciado_mail {
    type: string
    sql: ${TABLE}.referenciadoMail ;;
  }
  dimension: referenciado_pago {
    type: number
    sql: ${TABLE}.referenciadoPago ;;
  }
  dimension: referenciador_celular {
    type: string
    sql: ${TABLE}.referenciadorCelular ;;
  }
  dimension: referenciador_pago {
    type: number
    sql: ${TABLE}.referenciadorPago ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
