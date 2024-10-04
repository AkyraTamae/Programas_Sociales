
view: SMS_pachuca_leon {
  derived_table: {
    sql: SELECT DISTINCT
        A.clave_cliente,
        A.num_cuenta,
        CONCAT(CASE WHEN C.paisTel = 'US' THEN '+01' ELSE '+52'END, B.celular) AS Celular,
        CASE WHEN A.producto = 'K268' THEN 'Pachuca' WHEN A.producto = 'K269' THEN 'Leon' END AS Producto
      FROM
        `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.maquila` A
      INNER JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.accessos_clientes` B on A.num_cuenta = B.cuenta
      INNER JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.clientesBroxel` C on A.clave_cliente = C.claveCliente
      WHERE
        producto IN ('K268','K269')
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525514486653' AS celular,
        'Pachuca' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525514486653' AS celular,
        'Leon' AS Producto
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
        '+527772233498' AS celular,
        'Leon' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525514732593' AS celular,
        'Pachuca' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525514732593' AS celular,
        'Leon' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525543572580' AS celular,
        'Pachuca' AS Producto
      UNION ALL
      SELECT
        '-' AS clave_cliente,
        '-' AS num_cuenta,
        '+525543572580' AS celular,
        'Leon' AS Producto ;;
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
