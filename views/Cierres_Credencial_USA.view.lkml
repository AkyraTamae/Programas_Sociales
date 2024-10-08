view: cierres_credencial_usa {
  sql_table_name: `mgcp-10078073-bxl-dwh-prod.bi_broxelco_rdg.FiltrosGRL12USA` ;;

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }


  dimension: date_month {
    type: date_month_name
    sql: ${TABLE}.Fecha ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: clave_cliente{
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: nomenclatura {
    type: string
    sql: regexp_extract(${TABLE}.Clave_Cliente,r'[A-Z]{3}') ;;
  }

  measure: clientes_unicos{
    type: count_distinct
    value_format: "#,##0;-#,##0"
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: operaciones_dim {
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones ;;
  }

  measure: cuenta {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: importe_pesos_dim {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImportePesos ;;
  }

  measure: importe_d {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql:
      Case
      When ${TABLE}.TipoMovimiento = 'Devoluciones' Then -1 * ${TABLE}.ImportePesos
      Else ${TABLE}.ImportePesos
      End ;;
  }

  measure: importe_sin_IVA {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImportePesos/1.16 ;;
  }

  measure: comision_sin_IVA {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql:
      Case
      When ${TABLE}.TipoMovimiento = 'ATM' Then 1.9
      When ${TABLE}.TipoMovimiento = 'SegurosAsistencia' Then ${TABLE}.ImportePesos*0.21
      When ${TABLE}.TipoMovimiento = 'Comisiones' Then ${TABLE}.ImportePesos/1.16
      Else 0
      End ;;
  }

  measure: ingreso_total {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: (${TABLE}.MontoIntercambio/1.16) + (Case When ${TABLE}.TipoMovimiento = 'ATM' Then 1.9 When ${TABLE}.TipoMovimiento = 'SegurosAsistencia' Then ${TABLE}.ImportePesos*0.21  When ${TABLE}.TipoMovimiento = 'Comisiones' Then ${TABLE}.ImportePesos/1.16 Else 0 End);;
  }

  measure: monto_intercambio{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio ;;
  }

  dimension: monto_intercambio_dim{
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio ;;
  }

  measure: monto_intercambio_sin_IVA{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoIntercambio/1.16 ;;
  }

  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.ClasificacionCliente ;;
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

  measure: numero_productos {
    type: count_distinct
    sql: ${TABLE}.Productos ;;
  }

  dimension: cliente{
    type: string
    sql: ${TABLE}.Clientes ;;
  }

  dimension_group: fecha_h{
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
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

  measure: importe_pesos {
    label: "Monto"
    type: sum
    value_format_name: usd
    sql: ${importe_pesos_dim}  ;;
  }

  measure: operaciones {
    label: "Operaciones"
    type: sum
    value_format_name: decimal_0
    sql: ${operaciones_dim} ;;
  }

  dimension: banco {
    type: string
    sql: ${TABLE}.Banco ;;
  }

#############################Filtros#############################

  parameter: field_variable {
    type: unquoted
    label: "Filtro monto & operaciones"

    allowed_value: {
      value: "Monto"
      label: "Monto"
    }
    allowed_value: {
      value: "Operaciones"
      label: "Operaciones"
    }
  }

  measure: sum_variable{
    label: "{% parameter field_variable %}"
    type: number
    sql:
      {% if field_variable._parameter_value == 'Monto' %} ${importe_pesos}
      {% elsif field_variable._parameter_value == 'Operaciones' %} ${operaciones}
      {% endif %} ;;
  }


#############################Filtros#############################

  measure: count {
    type: count
  }
}
