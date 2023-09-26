view: dispositivos_v5 {
  sql_table_name: dbo.DispositivosV5 ;;

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }
  dimension: id_user {
    type: string
    sql: ${TABLE}.idUser ;;
  }
  measure: count {
    type: count
  }
}
