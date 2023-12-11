view: filtros_grl12 {
  sql_table_name: broxelco_rdg.FiltrosGRL12 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.ClasificacionCliente ;;
  }
  dimension: clasificacion_ctes_broxel {
    type: string
    sql: ${TABLE}.ClasificacionCtesBroxel ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }
  dimension: clave_grupo_cliente {
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }
  dimension: clientes {
    type: string
    sql: ${TABLE}.Clientes ;;
  }
  dimension: cohorte {
    type: string
    sql: ${TABLE}.Cohorte ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension_group: fecha_h {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaH ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.MontoIntercambio ;;
  }
  dimension: nombre_grupo_cliente {
    type: string
    sql: ${TABLE}.NombreGrupoCliente ;;
  }
  dimension: operaciones {
    type: number
    sql: ${TABLE}.Operaciones ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: productos {
    type: string
    sql: ${TABLE}.Productos ;;
  }
  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  ######################Measures######################

  measure: operaciones_sum {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones ;;
  }
  measure: cuenta_sum {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Cuenta ;;
  }
  measure: importe_pesos_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImportePesos ;;
  }
  measure: monto_intercambio_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio ;;
  }



  measure: count {
    type: count
    drill_fields: [id]
  }
}
