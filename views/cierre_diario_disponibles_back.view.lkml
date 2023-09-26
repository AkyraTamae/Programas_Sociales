view: cierre_diario_disponibles_back {
  sql_table_name: dbo.CierreDiarioDisponibles_back ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: cliente {
    type: string
    sql: ${TABLE}.Cliente ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }
  dimension: cuentas_dev {
    type: number
    sql: ${TABLE}.CuentasDev ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: limite_credito {
    type: number
    sql: ${TABLE}.LimiteCredito ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: saldo_disponible {
    type: number
    sql: ${TABLE}.SaldoDisponible ;;
  }
  dimension: saldo_disponible_dev {
    type: number
    sql: ${TABLE}.SaldoDisponibleDev ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
