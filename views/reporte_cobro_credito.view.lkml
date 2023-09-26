view: reporte_cobro_credito {
  sql_table_name: dbo.ReporteCobroCredito ;;

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension: estatus_id {
    type: number
    sql: ${TABLE}.EstatusId ;;
  }
  dimension: folio_asignacion {
    type: string
    sql: ${TABLE}.FolioAsignacion ;;
  }
  dimension: importe {
    type: number
    sql: ${TABLE}.Importe ;;
  }
  dimension: nombre_archivo {
    type: string
    sql: ${TABLE}.NombreArchivo ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  measure: count {
    type: count
  }
}
