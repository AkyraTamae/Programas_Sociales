view: loop_cursor {
  sql_table_name: dbo.LOOP_Cursor ;;

  dimension: a {
    type: number
    sql: ${TABLE}."A%" ;;
  }
  dimension: adau {
    type: number
    sql: ${TABLE}.ADAU ;;
  }
  dimension: amau {
    type: number
    sql: ${TABLE}.AMAU ;;
  }
  dimension: atxn {
    type: number
    sql: ${TABLE}.ATXN ;;
  }
  dimension: ciclo {
    type: string
    sql: ${TABLE}.Ciclo ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }
  dimension: periodo {
    type: string
    sql: ${TABLE}.Periodo ;;
  }
  dimension: t {
    type: number
    sql: ${TABLE}."T%" ;;
  }
  dimension: txn {
    type: number
    sql: ${TABLE}.TXN ;;
  }
  measure: count {
    type: count
  }
}
