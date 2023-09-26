view: salario_rosa_info_broxel {
  sql_table_name: dbo.SalarioRosaInfoBroxel ;;

  dimension: celular {
    type: string
    sql: ${TABLE}.celular ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: id_maquila {
    type: string
    sql: ${TABLE}.IdMaquila ;;
  }
  dimension: id_procesador {
    type: string
    sql: ${TABLE}.IdProcesador ;;
  }
  dimension: id_usuario_online_broxel {
    type: string
    sql: ${TABLE}.IdUsuarioOnlineBroxel ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }
  measure: count {
    type: count
  }
}
