view: folios_ops {
  sql_table_name: dbo.FoliosOPS ;;

  dimension: folio_ops {
    type: string
    sql: ${TABLE}."Folio OPS" ;;
  }
  measure: count {
    type: count
  }
}
