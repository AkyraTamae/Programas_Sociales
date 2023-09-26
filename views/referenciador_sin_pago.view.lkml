view: referenciador_sin_pago {
  sql_table_name: dbo.referenciadorSinPago ;;

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
  dimension: id_referenciador {
    type: string
    sql: ${TABLE}.idReferenciador ;;
  }
  measure: count {
    type: count
  }
}
