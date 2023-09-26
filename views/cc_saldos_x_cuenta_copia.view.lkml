view: cc_saldos_x_cuenta_copia {
  sql_table_name: dbo.cc_saldos_x_cuenta_copia ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: cod_empresa {
    type: string
    sql: ${TABLE}.Cod_Empresa ;;
  }
  dimension: cod_saldo {
    type: string
    sql: ${TABLE}.Cod_Saldo ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: mon_saldo {
    type: number
    sql: ${TABLE}.Mon_saldo ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.Num_Cuenta ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
