
view: finabien_repatriacion {
  derived_table: {
    sql: SELECT
      
          GENERATE_UUID() Id, 
          JSON_EXTRACT_SCALAR(JSonParametro, '$.NombreCompleto') NombreCompleto,
          JSON_EXTRACT_SCALAR(JSonParametro, '$.FechaNacimiento') FechaNacimiento,
         concat(JSON_EXTRACT_SCALAR(JSonParametro, '$.CodigoPais'),
          JSON_EXTRACT_SCALAR(JSonParametro, '$.Celular')) Telefono ,
          JSON_EXTRACT_SCALAR(JSonParametro, '$.Correo') Correo
      
      FROM
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelApiConfiguracion.PeticionesValidas` PeticionesValidas
        left join `mgcp-10078073-bxl-dwh-prod.cdc_BroxelApiConfiguracion.PeticionRespuesta` PeticionRespuesta ON PeticionesValidas.Id= PeticionRespuesta.Id WHERE IdMetodo in (596) and PeticionRespuesta.Codigo = 'Exito' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.Id ;;
  }

  dimension: nombre_completo {
    type: string
    sql: ${TABLE}.NombreCompleto ;;
  }

  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.FechaNacimiento ;;
  }

  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }

  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }

  set: detail {
    fields: [
        id,
	nombre_completo,
	fecha_nacimiento,
	telefono,
	correo
    ]
  }
}
