view: melate {
  sql_table_name: dbo.Melate ;;

  dimension: bolsa {
    type: string
    sql: ${TABLE}.BOLSA ;;
  }
  dimension: concurso {
    type: string
    sql: ${TABLE}.CONCURSO ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.FECHA ;;
  }
  dimension: nproducto {
    type: string
    sql: ${TABLE}.NPRODUCTO ;;
  }
  dimension: r1 {
    type: number
    sql: ${TABLE}.R1 ;;
  }
  dimension: r2 {
    type: number
    sql: ${TABLE}.R2 ;;
  }
  dimension: r3 {
    type: number
    sql: ${TABLE}.R3 ;;
  }
  dimension: r4 {
    type: number
    sql: ${TABLE}.R4 ;;
  }
  dimension: r5 {
    type: number
    sql: ${TABLE}.R5 ;;
  }
  dimension: r6 {
    type: number
    sql: ${TABLE}.R6 ;;
  }
  dimension: r7 {
    type: number
    sql: ${TABLE}.R7 ;;
  }
  measure: count {
    type: count
  }
}
