view: sesiones_usuario {
  sql_table_name: dbo.SesionesUsuario ;;

  dimension: date_insert {
    type: string
    sql: ${TABLE}.DateInsert ;;
  }
  dimension: dispositivo {
    type: string
    sql: ${TABLE}.dispositivo ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: id_user_brox {
    type: number
    sql: ${TABLE}.IdUserBrox ;;
  }
  dimension: ip {
    type: string
    sql: ${TABLE}.Ip ;;
  }
  dimension: lastnamefather {
    type: string
    sql: ${TABLE}.lastnamefather ;;
  }
  dimension: lastnamemother {
    type: string
    sql: ${TABLE}.lastnamemother ;;
  }
  dimension: log_login_methods_id {
    type: string
    sql: ${TABLE}.LogLoginMethodsId ;;
  }
  dimension: method {
    type: string
    sql: ${TABLE}.Method ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }
  dimension: success {
    type: string
    sql: ${TABLE}.Success ;;
  }
  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
