view: tmp_comercio {
  sql_table_name: dbo.tmpComercio ;;

  dimension: categoria {
    type: number
    sql: ${TABLE}.Categoria ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: id_comercio {
    type: number
    sql: ${TABLE}.idComercio ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }
  measure: count {
    type: count
  }
}
