
view: cierres_credencial_usa_agrupacion {
  derived_table: {
    sql: Select
            A.*,
            CONCAT(A.Producto, ' - ', C.descripcion) As Productos,
            CONCAT(A.Clave_Cliente, ' - ', B.NombreCorto) As Clientes,
            DATE_ADD(CURRENT_DATETIME(), Interval -5 HOUR) As FechaH,
            ClasificacionCtesBroxel,
            B.GrupoCliente As ClaveGrupoCliente,
            D.NombreCorto As NombreGrupoCliente
          From
            `mgcp-10078073-bxl-dwh-prod.bi_recursos.CierreTransaccionesUSA` A
          Left Join
            `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.clientesBroxel` B On A.Clave_Cliente = B.claveCliente
          Left Join
            `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.productos_broxel` C On A.Producto = C.codigo
          Left Join
            `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.AgrupacionClientes` D On B.GrupoCliente = D.ClaveAgrupacion ;;
            }

  dimension_group: fecha{
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, month_name]
    datatype: datetime
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

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: nomenclatura {
    type: string
    sql: substring(${TABLE}.Clave_Cliente,patindex('%[A-Z]%', ${TABLE}.Clave_Cliente),3) ;;
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

  measure: cuentas {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.Cuentas ;;
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

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  dimension: descripcion_usuario {
    type: string
    sql: ${TABLE}.DescripcionUsuario ;;
  }

  dimension: productos {
    type: string
    sql: ${TABLE}.Productos ;;
  }

  measure: numero_productos {
    type: count_distinct
    sql: ${TABLE}.Productos ;;
  }

  dimension: clientes {
    type: string
    sql: ${TABLE}.Clientes ;;
  }

  dimension: clasificacion_ctes_broxel {
    type: number
    sql: ${TABLE}.ClasificacionCtesBroxel ;;
  }

  dimension: clave_grupo_cliente {
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }

  dimension: nombre_grupo_cliente {
    type: string
    sql: ${TABLE}.NombreGrupoCliente ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      producto,
      clave_cliente,
      operaciones,
      cuentas,
      importe_pesos,
      monto_intercambio,
      clasificacion_cliente,
      tipo_movimiento,
      procesador,
      descripcion_usuario,
      productos,
      clientes,
      clasificacion_ctes_broxel,
      clave_grupo_cliente,
      nombre_grupo_cliente
    ]
  }
}
