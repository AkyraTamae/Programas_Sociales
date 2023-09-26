view: srclaves_cliente_ycorreos {
  sql_table_name: dbo.SRclaves_clienteYcorreos ;;

  dimension: clave_cliente_s150 {
    type: string
    sql: ${TABLE}.clave_clienteS150 ;;
  }
  dimension: clave_clientek150 {
    type: string
    sql: ${TABLE}.clave_clientek150 ;;
  }
  dimension: cuenta_s150 {
    type: string
    sql: ${TABLE}.cuentaS150 ;;
  }
  dimension: cuentak150 {
    type: string
    sql: ${TABLE}.cuentak150 ;;
  }
  dimension: mail_k150_ac {
    type: string
    sql: ${TABLE}.mailK150AC ;;
  }
  dimension: mail_k150_excel {
    type: string
    sql: ${TABLE}.mailK150Excel ;;
  }
  dimension: mail_s150_ac {
    type: string
    sql: ${TABLE}.mailS150AC ;;
  }
  dimension: mail_s150_excel {
    type: string
    sql: ${TABLE}.mailS150Excel ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }
  measure: count {
    type: count
  }
}
