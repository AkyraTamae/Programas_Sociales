view: cuentas_secre_campo {
  sql_table_name: dbo.Cuentas_Secre_Campo ;;

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: clave_grupo_cliente {
    type: string
    sql: ${TABLE}.ClaveGrupoCliente ;;
  }
  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.estado_operativo ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  measure: count {
    type: count
  }
}
