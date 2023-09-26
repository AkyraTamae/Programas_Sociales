view: tmp_ccc {
  sql_table_name: dbo.tmpCCC ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
