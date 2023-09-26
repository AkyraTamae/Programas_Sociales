view: datosclientes {
  sql_table_name: dbo.datosclientes ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.CodigoPostal ;;
  }
  dimension: curp {
    type: string
    sql: ${TABLE}.Curp ;;
  }
  dimension: edad {
    type: string
    sql: ${TABLE}.Edad ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}."Fecha Nacimiento" ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: sexo {
    type: string
    sql: ${TABLE}.Sexo ;;
  }
  measure: count {
    type: count
  }
}
