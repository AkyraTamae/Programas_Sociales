view: macrodisponibles {
  sql_table_name: dbo.macrodisponibles ;;

  dimension: clasificacion {
    type: string
    sql: ${TABLE}.clasificacion ;;
  }
  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: claveynombre {
    type: string
    sql: ${TABLE}.claveynombre ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.cuentas ;;
  }
  dimension: disponibles {
    type: number
    sql: ${TABLE}.disponibles ;;
  }
  dimension: estatus {
    type: string
    sql: ${TABLE}.estatus ;;
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
  measure: count {
    type: count
  }
}
