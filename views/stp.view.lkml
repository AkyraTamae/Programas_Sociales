view: stp {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.STP` ;;

  dimension: cuentas_folio20 {
    type: number
    sql: ${TABLE}.CuentasFolio20 ;;
  }
  dimension: cuentas_folio20_1 {
    type: number
    sql: ${TABLE}.CuentasFolio20_1 ;;
  }
  dimension: cuentas_folio80 {
    type: number
    sql: ${TABLE}.CuentasFolio80 ;;
  }
  dimension: cuentas_folio80_1 {
    type: number
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
    sql: ${TABLE}.Monto20 ;;
  }
  dimension: monto80 {
    type: number
    sql: ${TABLE}.Monto80 ;;
  }
  dimension: monto_de_asignacion20 {
    type: number
    sql: ${TABLE}.MontoDeAsignacion20 ;;
  }
  dimension: monto_de_asignacion80 {
    type: number
    sql: ${TABLE}.MontoDeAsignacion80 ;;
  }
  dimension: tipo_credito20 {
    type: string
    sql: ${TABLE}.TipoCredito20 ;;
  }
  dimension: tipo_credito80 {
    type: string
    sql: ${TABLE}.TipoCredito80 ;;
  }
  measure: count {
    type: count
  }
}
