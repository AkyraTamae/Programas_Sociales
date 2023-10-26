view: prueba_promos_broxel {
  derived_table: {
    sql: SELECT gr.Fecha, m.nombre_titular, m.num_cuenta, m.clave_cliente, gr.Productos, gr.ImportePesos ImportTotal, gr.TipoMovimiento, gr.ClaveGrupoCliente
      FROM [broxelco_rdg].[FiltrosGRL12] gr (nolock)
      left join broxelco_rdg.maquila m (nolock)
      on m.clave_cliente=gr.Clave_Cliente
      where Fecha >= '2023-08-15' and m.producto = 'S150' --and  nombre_completo = 'EDUARDO  RODRIGUEZ JASSAN' ;;
  }


  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }

  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }

  dimension: num_cuenta {
    primary_key: yes
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }

  dimension: productos {
    type: string
    sql: ${TABLE}.Productos ;;
  }

  dimension: import_total {
    type: number
    sql: ${TABLE}.ImportTotal ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: clave_grupo_cliente {
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }

  set: detail {
    fields: [
      fecha,
      nombre_titular,
      num_cuenta,
      clave_cliente,
      productos,
      import_total,
      tipo_movimiento,
      clave_grupo_cliente
    ]
  }
}
