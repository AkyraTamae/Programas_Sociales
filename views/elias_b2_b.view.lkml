view: elias_b2_b {
  sql_table_name: dbo.Elias_B2B ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: edad {
    type: number
    sql: ${TABLE}.Edad ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }
  measure: count {
    type: count
  }
}
