view: calculo_sredad_edo_opera {
  sql_table_name: dbo.Calculo_SREdadEdoOPera ;;

  dimension: acceso {
    type: number
    sql: ${TABLE}.Acceso ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.CLaveCliente ;;
  }
  dimension: direccion {
    type: string
    sql: ${TABLE}.Direccion ;;
  }
  dimension: edad {
    type: number
    sql: ${TABLE}.Edad ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.EstadoOperativo ;;
  }
  dimension: municipio {
    type: string
    sql: ${TABLE}.Municipio ;;
  }
  measure: count {
    type: count
  }
}
