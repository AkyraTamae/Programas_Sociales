view: cierres_credencial_usa {
   sql_table_name: broxelco_rdg.FiltrosGRL12USA ;;

  dimension_group: fecha{
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.Fecha ;;
  }

  dimension: date_month {
    type: date_month_name
    sql: ${TABLE}.Feca ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producti ;;
  }

  dimension: clave_cliente{
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  measure: operaciones {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones ;;
  }

    measure: cuenta {
      type: sum
      value_format: "#,##0.00"
      sql: ${TABLE}.Cuenta ;;
  }

  measure: importe_pesos {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImportePesos ;;
  }

  measure: monto_intercambio{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio ;;
  }

  dimension: clasificacioncliente {
    type: string
    sql: ${TABLE}.clasificacion_cliente ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: procesador{
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  dimension: productos{
    type: string
    sql: ${TABLE}.Productos ;;
  }

  dimension: cliente{
    type: string
    sql: ${TABLE}.Clientes ;;
  }

  dimension_group: fecha_h{
    timeframes: [raw, time, date, week, month, quarter, year]
    type: time
    sql: ${TABLE}.FechaH ;;
  }

  dimension: clasificacion_ctes_broxel{
    type: string
    sql: ${TABLE}.ClasificacionCtesBroxel ;;
  }

  dimension: clave_grupo_cliente{
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }

  dimension: nombre_grupo_cliente{
    type: string
    sql: ${TABLE}.NombreGrupoCliente ;;
  }

  dimension: cohorte{
    type: string
    sql: ${TABLE}.Cohorte ;;
  }

  measure: count {
    type: count
  }
}
