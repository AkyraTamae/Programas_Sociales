view: cuentas_sr {
  sql_table_name: dbo.Cuentas_SR ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: dcclave_cliente {
    type: string
    sql: ${TABLE}.DCClaveCliente ;;
  }
  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.estado_operativo ;;
  }
  dimension_group: maquila {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.maquila ;;
  }
  dimension: nombre_tarjethabiente {
    type: string
    sql: ${TABLE}.nombre_tarjethabiente ;;
  }
  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }
  dimension: num_cuenta {
    type: number
    sql: ${TABLE}.num_cuenta ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
  }
}
