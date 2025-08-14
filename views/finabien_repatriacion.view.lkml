
view: finabien_repatriacion {
  derived_table: {
    sql: SELECT *

      FROM
         `mgcp-10078073-bxl-bi-snd.BIOro.FinabienRepatriacion`
         ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fechapeticion {
    type: date
    sql: ${TABLE}.FechaPeticion ;;
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
    type: date
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
