view: salario_rosa_info_broxel_cnombre {
  sql_table_name: dbo.SalarioRosaInfoBroxelCNombre ;;

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
  dimension: id_usuario_online_broxel {
    type: string
    sql: ${TABLE}.IdUsuarioOnlineBroxel ;;
  }
  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }
  measure: count {
    type: count
  }
}
