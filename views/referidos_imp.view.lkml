view: referidos_imp {
  sql_table_name: dbo.ReferidosImp ;;

  dimension: codigo_referenciacion {
    type: string
    sql: ${TABLE}.CodigoReferenciacion ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: id_referenciador {
    type: string
    sql: ${TABLE}.IdReferenciador ;;
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
