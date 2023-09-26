view: acceso_usuarios {
  sql_table_name: dbo.AccesoUsuarios ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: banco {
    type: string
    sql: ${TABLE}.Banco ;;
  }
  dimension: contrasena {
    type: string
    sql: ${TABLE}.contrasena ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension_group: falta {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Falta ;;
  }
  dimension_group: fmodifica {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fmodifica ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
