view: srbroxel_zell_correos {
  sql_table_name: dbo.SRBroxelZellCorreos ;;

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
  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }
  dimension: usuario_ac {
    type: string
    sql: ${TABLE}.usuarioAC ;;
  }
  dimension: usuario_excel {
    type: string
    sql: ${TABLE}.usuarioExcel ;;
  }
  measure: count {
    type: count
  }
}
