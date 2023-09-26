view: macrodispersionpromedio {
  sql_table_name: dbo.macrodispersionpromedio ;;

  dimension: clasificacion {
    type: number
    sql: ${TABLE}.clasificacion ;;
  }
  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: dispersiontotal {
    type: number
    sql: ${TABLE}.dispersiontotal ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  dimension: promediodispersionpormes {
    type: number
    sql: ${TABLE}.promediodispersionpormes ;;
  }
  dimension: tipo_entrada {
    type: string
    sql: ${TABLE}.tipo_entrada ;;
  }
  measure: count {
    type: count
  }
}
