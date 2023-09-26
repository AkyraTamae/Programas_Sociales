view: cuentas_hvtemp {
  sql_table_name: dbo.CuentasHVTemp ;;

  dimension: cuenta {
    type: number
    sql: ${TABLE}.CUENTA ;;
  }
  measure: count {
    type: count
  }
}
