view: macroembozos {
  sql_table_name: dbo.macroembozos ;;

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
  dimension: claveynombre {
    type: string
    sql: ${TABLE}.claveynombre ;;
  }
  dimension: embozos {
    type: number
    sql: ${TABLE}.embozos ;;
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
  dimension: procesador {
    type: number
    sql: ${TABLE}.procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  dimension: productodescripcion {
    type: string
    sql: ${TABLE}.productodescripcion ;;
  }
  measure: count {
    type: count
  }
}
