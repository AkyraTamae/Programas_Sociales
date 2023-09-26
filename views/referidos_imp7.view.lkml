view: referidos_imp7 {
  sql_table_name: dbo.ReferidosImp7 ;;

  dimension: codigo_referenciacion {
    type: string
    sql: ${TABLE}.CodigoReferenciacion ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: idreferenciador {
    type: string
    sql: ${TABLE}.IDReferenciador ;;
  }
  dimension: number {
    type: string
    sql: ${TABLE}.Number ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  dimension: telefono_referenciador {
    type: string
    sql: ${TABLE}.TelefonoReferenciador ;;
  }
  measure: count {
    type: count
  }
}
