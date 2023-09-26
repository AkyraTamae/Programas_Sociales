view: macrotransferenciaspormes {
  sql_table_name: dbo.macrotransferenciaspormes ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."año" ;;
  }
  dimension: clasificacion_ctes_broxel {
    type: number
    sql: ${TABLE}.ClasificacionCtesBroxel ;;
  }
  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: dispersion {
    type: number
    sql: ${TABLE}.dispersion ;;
  }
  dimension: entrada {
    type: string
    sql: ${TABLE}.entrada ;;
  }
  dimension_group: fechas {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechas ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.mes ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
  }
}
