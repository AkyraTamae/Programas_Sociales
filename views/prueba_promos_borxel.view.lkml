view: prueba_promos_broxel {
  derived_table: {
    sql: SELECT gr.Fecha,gr.Productos, gr.ImportePesos ImportTotal, gr.TipoMovimiento, gr.ClaveGrupoCliente
      FROM [broxelco_rdg].[FiltrosGRL12] m (nolock)
      where Fecha >= '2023-08-15' and m.producto = 'S150' ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }

  dimension: nombre_titular {
    hidden: yes
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }

  dimension: num_cuenta {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }

  dimension: clave_cliente {
    hidden: yes
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }

  dimension: productos {
    hidden: yes
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
