view: datos_mariana {
  sql_table_name: dbo.Datos_Mariana ;;

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
    type: number
    sql: ${TABLE}.Edad ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension_group: fecha_nacimiento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha_Nacimiento ;;
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
