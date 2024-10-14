
view: prueba_llamadas {
derived_table: {
  sql: SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525514486653' AS celular,
        'Pachuca' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+527772233498' AS celular,
        'Pachuca' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525569056515' AS celular,
        'Pachuca' AS Producto;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: clave_cliente {
  type: string
  sql: ${TABLE}.clave_cliente ;;
}

dimension: num_cuenta {
  type: string
  sql: ${TABLE}.num_cuenta ;;
}

dimension: celular {
  type: string
  sql: ${TABLE}.Celular ;;
}

dimension: producto {
  type: string
  sql: ${TABLE}.Producto ;;
}

dimension: celular_tag {
  type: string
  tags: ["phone","undefined"]
  sql: ${TABLE}.Celular ;;
}

dimension_group: fecha {
  type: time
  timeframes: [raw, date, week, month, month_name, quarter, year]
  convert_tz: no
  datatype: datetime
  sql: cast(datetime_add(current_datetime, interval -6 hour) as date) ;;
}

set: detail {
  fields: [
    clave_cliente,
    num_cuenta,
    celular,
    producto
  ]
}
}
