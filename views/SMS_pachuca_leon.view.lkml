
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
        producto IN ('K268','K269') ;;
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

  set: detail {
    fields: [
        clave_cliente,
  num_cuenta,
  celular,
  producto
    ]
  }
}
