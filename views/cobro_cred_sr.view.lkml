view: cobro_cred_sr {
  sql_table_name: dbo.Cobro_Cred_SR ;;

  dimension: cobrototal {
    type: number
    sql: ${TABLE}.cobrototal ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: numerocobros {
    type: number
    sql: ${TABLE}.numerocobros ;;
  }
  measure: count {
    type: count
  }
}
