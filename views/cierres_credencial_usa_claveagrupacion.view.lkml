
view: cierres_credencial_usa_claveagrupacion {
  derived_table: {
    sql: SELECT  ClaveGrupoCliente, 
                    Case when COUNT(DISTINCT clave_cliente) > 1 then concat(ClaveGrupoCliente, ' - ', NombreGrupoCliente)
                    else '1700BXL00000 - Mercado abierto' 
                    END as agrupacion_cliente1
            FROM broxelco_rdg.FiltrosGRL12USA  group by ClaveGrupoCliente, NombreGrupoCliente ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: clave_grupo_cliente {
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }

  dimension: agrupacion_cliente1 {
    type: string
    sql: ${TABLE}.agrupacion_cliente1 ;;
  }

  set: detail {
    fields: [
        clave_grupo_cliente,
	agrupacion_cliente1
    ]
  }
}
