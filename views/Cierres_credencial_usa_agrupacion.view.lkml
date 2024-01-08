
view: cierres_credencial_usa_agrupacion {
  derived_table: {
    sql: Select
              A.*,
              CONCAT(A.Producto, ' - ', C.descripcion) As 'Productos',
              CONCAT(A.Clave_Cliente, ' - ', B.NombreCorto) As 'Clientes',
              CONVERT(VARCHAR(19), DATEADD(HOUR, -5, GETDATE()), 120) As 'FechaH',
              ClasificacionCtesBroxel,
              B.GrupoCliente As 'ClaveGrupoCliente',
              D.NombreCorto As 'NombreGrupoCliente'
            From
              CierreTransaccionesUSA A With (Nolock)
            Left Join
              broxelco_rdg.ClientesBroxel B With (Nolock) On A.Clave_Cliente = B.claveCliente
            Left Join
              broxelco_rdg.productos_broxel C With (Nolock) On A.Producto = C.codigo
            Left Join
              broxelco_rdg.AgrupacionClientes D With (Nolock) On B.GrupoCliente = D.ClaveAgrupacion ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: date
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

  dimension: operaciones {
    type: number
    sql: ${TABLE}.Operaciones ;;
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }

  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.MontoIntercambio ;;
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

  dimension: clientes {
    type: string
    sql: ${TABLE}.Clientes ;;
  }

  dimension: fecha_h {
    type: string
    sql: ${TABLE}.FechaH ;;
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

  set: detail {
    fields: [
      fecha,
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
      fecha_h,
      clasificacion_ctes_broxel,
      clave_grupo_cliente,
      nombre_grupo_cliente
    ]
  }
}
