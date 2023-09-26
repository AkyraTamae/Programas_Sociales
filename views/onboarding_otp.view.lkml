view: onboarding_otp {
  sql_table_name: dbo.OnboardingOTP ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: celular {
    type: string
    sql: ${TABLE}.Celular ;;
  }
  dimension: intentos_celular {
    type: number
    sql: ${TABLE}.IntentosCelular ;;
  }
  dimension: intentos_mail {
    type: number
    sql: ${TABLE}.IntentosMail ;;
  }
  dimension: mail {
    type: string
    sql: ${TABLE}.Mail ;;
  }
  dimension: valida_celular {
    type: number
    sql: ${TABLE}.ValidaCelular ;;
  }
  dimension: valida_mail {
    type: number
    sql: ${TABLE}.ValidaMail ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
