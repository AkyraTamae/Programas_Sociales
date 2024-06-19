view: alertas_programas_transacciones_por_hora {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.AlertasProgramasTransaccionesPorHora` ;;

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: hora {
    type: number
    sql: ${TABLE}.Hora ;;
  }
  dimension: monto_hora {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoHora ;;
  }
  dimension: nombre_de_medida {
    type: string
    sql: ${TABLE}.NombreDeMedida ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  dimension: transacciones_hora {
    type: number
    sql: ${TABLE}.TransaccionesHora ;;
  }
  measure: count {
    type: count
  }
}
