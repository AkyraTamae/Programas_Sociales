view: srnombres2veces_zell {
  sql_table_name: dbo.SRNombres2vecesZell ;;

  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }
  measure: count {
    type: count
  }
}
