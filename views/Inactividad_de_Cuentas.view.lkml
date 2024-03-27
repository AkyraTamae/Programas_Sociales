view: inactividad_de_cuentas {
  derived_table: {
    sql: Select
        clave_cliente,
        producto,
        num_cuenta,
        disponible,
        fecha_ultimo_movimiento
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.maquila`
      Where
        fecha_ultimo_movimiento >= '2021-06-30' And (estado_operativo <> 'Baja' Or estado_operativo Is Null) And disponible Is Not Null ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }

  dimension: disponible {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.disponible ;;
  }

  dimension: fecha_ultimo_movimiento {
    type: date
    datatype: date
    sql: ${TABLE}.fecha_ultimo_movimiento ;;
  }

  set: detail {
    fields: [
        clave_cliente,
  producto,
  num_cuenta,
  disponible,
  fecha_ultimo_movimiento
    ]
  }
}
