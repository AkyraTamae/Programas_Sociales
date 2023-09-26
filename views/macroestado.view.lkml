view: macroestado {
  sql_table_name: dbo.MACROESTADO ;;

  dimension: baja {
    type: number
    sql: ${TABLE}.baja ;;
  }
  dimension: bloqueada {
    type: number
    sql: ${TABLE}.bloqueada ;;
  }
  dimension: clasificacion_ctes_broxel {
    type: string
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
  dimension: operativa {
    type: number
    sql: ${TABLE}.operativa ;;
  }
  dimension: procesador {
    type: string
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
  dimension: sinestado {
    type: number
    sql: ${TABLE}.sinestado ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }
  measure: count {
    type: count
  }
}
