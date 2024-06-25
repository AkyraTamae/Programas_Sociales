view: programas_transacciones_rechazadas_por_hora {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.ProgramasTransaccionesRechazadasPorHora` ;;

  dimension: 4ta_linea {
    type: string
    sql: ${TABLE}._4ta_linea ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
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
    value_format: "HH:MM"
    sql: ${TABLE}.Hora / 24 ;;
  }
  dimension: motivo_rechazo {
    type: string
    sql: ${TABLE}.MotivoRechazo ;;
  }
  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
  }
  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
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
  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }
  measure: count {
    type: count
  }
}
