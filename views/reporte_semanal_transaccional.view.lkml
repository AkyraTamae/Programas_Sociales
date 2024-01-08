view: reporte_semanal_transaccional {
  sql_table_name: dbo.ReporteSemanalTransaccional ;;

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: comercio_reportar {
    type: string
    sql: ${TABLE}.ComercioReportar ;;
  }
  dimension: devoluciones {
    type: number
    sql: ${TABLE}.devoluciones ;;
  }
  dimension: email_contacto {
    type: string
    sql: ${TABLE}.email_contacto ;;
  }
  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
  }
  dimension: estado_fiscal {
    type: string
    sql: ${TABLE}.EstadoFiscal ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: importe_descuento {
    type: number
    sql: ${TABLE}.importe_descuento ;;
  }
  dimension: importe_ventas {
    type: number
    sql: ${TABLE}.importe_ventas ;;
  }
  dimension: iva {
    type: number
    sql: ${TABLE}.iva ;;
  }
  dimension_group: mes_txt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Mes_txt ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }
  dimension: municipio_comercial {
    type: string
    sql: ${TABLE}.Municipio_Comercial ;;
  }
  dimension: nombre_medidas {
    type: string
    sql: ${TABLE}.NombreMedidas ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.transacciones ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.Usuario ;;
  }
  dimension: ventas {
    type: number
    sql: ${TABLE}.ventas ;;
  }
  measure: count {
    type: count
  }
}