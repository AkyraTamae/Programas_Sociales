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
    value_format: "$#,##0.00;-$#,##0.00"
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
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_descuento ;;
  }
  dimension: importe_ventas {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_ventas ;;
  }
  dimension: iva {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
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
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ventas ;;
  }


  dimension: mes_txt2 {
    type: string
    sql: ${TABLE}.mes_txt ;;
    html: {{ rendered_value | date: "%B %Y" }};;

  }

  measure: total_ventas{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_ventas ;;
  }

  measure: total_transacciones {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.Estado_Comercial ;;
  }


  measure: count {
    type: count
  }
}
