view: clientes_credencias {
  sql_table_name: dbo.clientesCredencias ;;

  dimension: apellidos_cte {
    type: string
    sql: ${TABLE}."Apellidos cte" ;;
  }
  dimension: clave_de_cliente_ {
    type: string
    sql: ${TABLE}."Clave de cliente " ;;
  }
  dimension: ltimos_4_digitos_de_su_tarjeta_ {
    type: string
    sql: ${TABLE}."Ãšltimos 4 digitos de su tarjeta " ;;
  }
  dimension: nombre_s {
    type: string
    sql: ${TABLE}."Nombre (s)" ;;
  }
  dimension: producto_ {
    type: string
    sql: ${TABLE}."Producto " ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  measure: count {
    type: count
  }
}
