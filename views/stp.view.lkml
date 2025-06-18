view: stp {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.STP` ;;

  dimension: cuentas_folio20 {
    type: number
    sql: ${TABLE}.CuentasFolio20 ;;
  }
  dimension: cuentas_folio20_1 {
    type: number
    label: "Cuentas Asignadas 20"
    sql: ${TABLE}.CuentasFolio20_1 ;;
  }
  dimension: cuentas_folio80 {
    type: number
    sql: ${TABLE}.CuentasFolio80 ;;
  }
  dimension: cuentas_folio80_1 {
    type: number
    label: "Cuentas Asignadas 80"
    sql: ${TABLE}.CuentasFolio80_1 ;;
  }
  dimension: entidad {
    type: string
    sql: ${TABLE}.Entidad ;;
  }
  dimension_group: fecha_asignacion20 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaAsignacion20 ;;
  }
  dimension_group: fecha_asignacion80 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaAsignacion80 ;;
  }
  dimension_group: fecha_ingreso_stp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaIngresoSTP ;;
  }
  dimension: folio_asignacion20 {
    type: string
    sql: ${TABLE}.FolioAsignacion20 ;;
  }
  dimension: folio_asignacion80 {
    type: string
    sql: ${TABLE}.FolioAsignacion80 ;;
  }
  dimension: id_stp {
    type: string
    sql: ${TABLE}.idSTP ;;
  }
  dimension: importe {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Importe ;;
  }
  dimension_group: mes_insercion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MesInsercion ;;
  }
  dimension: monto20 {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto20 ;;
  }
  dimension: monto80 {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto80 ;;
  }
  dimension: monto_de_asignacion20 {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDeAsignacion20 ;;
  }
  dimension: monto_de_asignacion80 {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDeAsignacion80 ;;
  }
  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }
  dimension: tipo_credito20 {
    type: string
    sql: ${TABLE}.TipoCredito20 ;;
  }
  dimension: tipo_credito80 {
    type: string
    sql: ${TABLE}.TipoCredito80 ;;
  }
  measure: saldo_al_corte {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: round(${TABLE}.Importe, 2) - (round(round(ifnull(${TABLE}.Monto80, 0), 2) + round(ifnull(${TABLE}.Monto20, 0), 2), 2)) ;;
  }

  measure: count {
    type: count
  }
}
