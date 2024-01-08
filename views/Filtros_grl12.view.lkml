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
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension_group: fecha_h {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
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
    sql:  case when ${TABLE}.TipoMovimiento like '%evol%' then 'Devoluciones' when ${TABLE}.TipoMovimiento in ('%plica%', 'otro') then 'Excluir' when ${TABLE}.TipoMovimiento in ('Comisione', 'Comisiones') Then 'Comisiones'  else ${TABLE}.TipoMovimiento end  ;;
  }

  ######################Measures/Dimensions######################

  dimension: agrupacion_cliente {
    type: string
    sql: concat(${TABLE}.ClaveGrupoCliente,"-",${TABLE}.NombreGrupoCliente) ;;
  }

  dimension: nomenclatura_cliente {
    type: string
    sql: substring(${TABLE}.clave_cliente,patindex('%[A-Z]%', Clave_Cliente),3) ;;
  }

  dimension: grupo_cliente {
    type: string
    sql: case when ${nomenclatura_cliente} is null then trim(${TABLE}.clave_cliente) else ${nomenclatura_cliente} end ;;
  }

  measure: clave_cliente_distinct {
    type: count_distinct
    value_format: "#,##0"
    sql: ${TABLE}.Clave_Cliente ;;
  }
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
    sql: ${importe_pesos} ;;
  }
  measure: monto_intercambio_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio ;;
  }
  measure: producto_distinct {
    type: count_distinct
    sql: ${TABLE}.Producto ;;
  }
  measure: monto_intercambio_sin_IVA {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio/1.16 ;;
  }
  measure: comision_sin_IVA {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: case when ${tipo_movimiento} = 'ATM' then 1.9 when ${tipo_movimiento} = 'SegurosAsistencia' then ${importe_pesos}*0.21 when ${tipo_movimiento} = 'Comisiones' then  ${monto_intercambio}/1.16 else 0 end ;;
  }
  measure: ingreso_total {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto_intercambio_sin_IVA}+${comision_sin_IVA} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
