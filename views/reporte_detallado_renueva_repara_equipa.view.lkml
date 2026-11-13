view: reporte_detallado_renueva_repara_equipa {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.ReporteDetalladoRenuevaReparaEquipa` ;;

  dimension: bloqueo_por_asignacion {
    type: string
    sql: ${TABLE}.BloqueoPorAsignacion ;;
  }
  dimension: cuenta_b2_b {
    type: string
    sql: ${TABLE}.CuentaB2B ;;
  }
  dimension: cuenta_b2_c {
    type: string
    sql: ${TABLE}.CuentaB2C ;;
  }
  dimension: curp {
    type: string
    sql: ${TABLE}.CURP ;;
  }
  dimension: disponible {
    type: number
    sql: ${TABLE}.Disponible ;;
  }
  dimension: estatus_b2_b {
    type: number
    sql: ${TABLE}.EstatusB2B ;;
  }
  dimension: estatus_b2_c {
    type: number
    sql: ${TABLE}.EstatusB2C ;;
  }
  dimension: estatus_onboarding {
    type: string
    sql: ${TABLE}.EstatusOnboarding ;;
  }
  dimension_group: fecha_ejecucion20 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaEjecucion20 ;;
  }
  dimension_group: fecha_ejecucion80 {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaEjecucion80 ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: folio_asignacion20 {
    type: string
    sql: ${TABLE}.FolioAsignacion20 ;;
  }
  dimension: folio_asignacion80 {
    type: string
    sql: ${TABLE}.FolioAsignacion80 ;;
  }
  dimension: folio_enrolamiento {
    type: string
    sql: ${TABLE}.FolioEnrolamiento ;;
  }
  dimension: inactividad_preventiva {
    type: number
    sql: ${TABLE}.InactividadPreventiva ;;
  }
  dimension: ombre_completo{
    type: number
    sql: ${TABLE}.NombreCompleto ;;
  }
  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }
  dimension: producto_b2_b {
    type: string
    sql: ${TABLE}.ProductoB2B ;;
  }
  dimension: producto_b2_c {
    type: string
    sql: ${TABLE}.ProductoB2C ;;
  }
  dimension: producto_enrolado {
    type: string
    sql: ${TABLE}.ProductoEnrolado ;;
  }
  measure: count {
    type: count
  }
}
