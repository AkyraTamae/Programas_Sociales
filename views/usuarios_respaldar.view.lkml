view: usuarios_respaldar {
  sql_table_name: dbo.UsuariosRespaldar ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: activo_cuenta {
    type: string
    sql: ${TABLE}.ActivoCuenta ;;
  }
  dimension: alias {
    type: string
    sql: ${TABLE}.Alias ;;
  }
  dimension: cantidaddecuentasporcliente {
    type: string
    sql: ${TABLE}.Cantidaddecuentasporcliente ;;
  }
  dimension: cantidaddecuentasporusuario {
    type: string
    sql: ${TABLE}.Cantidaddecuentasporusuario ;;
  }
  dimension: celular {
    type: string
    sql: ${TABLE}.celular ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }
  dimension: cliente {
    type: string
    sql: ${TABLE}.Cliente ;;
  }
  dimension: clientecon_sofipo {
    type: string
    sql: ${TABLE}.ClienteconSOFIPO ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.cuenta ;;
  }
  dimension: cuenta2 {
    type: string
    sql: ${TABLE}.Cuenta2 ;;
  }
  dimension: cuenta_madre {
    type: string
    sql: ${TABLE}.CuentaMadre ;;
  }
  dimension: disponible {
    type: string
    sql: ${TABLE}.Disponible ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.EstadoOperativo ;;
  }
  dimension: fecha_alta {
    type: string
    sql: ${TABLE}.FechaAlta ;;
  }
  dimension: fecha_baja {
    type: string
    sql: ${TABLE}.FechaBaja ;;
  }
  dimension: fecha_disponible {
    type: string
    sql: ${TABLE}.FechaDisponible ;;
  }
  dimension: fecha_hora_creacion {
    type: string
    sql: ${TABLE}.FechaHoraCreacion ;;
  }
  dimension: fecha_hora_creacioncopia {
    type: string
    sql: ${TABLE}."FechaHoraCreacion(copia)" ;;
  }
  dimension: fecha_max_c2_centrada {
    type: string
    sql: ${TABLE}.FechaMaxC2CEntrada ;;
  }
  dimension: fecha_max_c2_csalida {
    type: string
    sql: ${TABLE}.FechaMaxC2CSalida ;;
  }
  dimension: fecha_max_dispersion {
    type: string
    sql: ${TABLE}.FechaMaxDispersion ;;
  }
  dimension: fecha_max_pago {
    type: string
    sql: ${TABLE}.FechaMaxPago ;;
  }
  dimension: fecha_max_transaccion {
    type: string
    sql: ${TABLE}.FechaMaxTransaccion ;;
  }
  dimension: fecha_max_transferencia {
    type: string
    sql: ${TABLE}.FechaMaxTransferencia ;;
  }
  dimension: fecha_min_c2_centrada {
    type: string
    sql: ${TABLE}.FechaMinC2CEntrada ;;
  }
  dimension: fecha_min_c2_csalida {
    type: string
    sql: ${TABLE}.FechaMinC2CSalida ;;
  }
  dimension: fecha_min_dispersion {
    type: string
    sql: ${TABLE}.FechaMinDispersion ;;
  }
  dimension: fecha_min_pago {
    type: string
    sql: ${TABLE}.FechaMinPago ;;
  }
  dimension: fecha_min_transaccion {
    type: string
    sql: ${TABLE}.FechaMinTransaccion ;;
  }
  dimension: fecha_min_transferencia {
    type: string
    sql: ${TABLE}.FechaMinTransferencia ;;
  }
  dimension: fecha_modificacion {
    type: string
    sql: ${TABLE}.FechaModificacion ;;
  }
  dimension: fecha_primer_movimiento {
    type: string
    sql: ${TABLE}.FechaPrimerMovimiento ;;
  }
  dimension: fecha_registro {
    type: string
    sql: ${TABLE}.FechaRegistro ;;
  }
  dimension: fecha_ultimo_movimiento {
    type: string
    sql: ${TABLE}.FechaUltimoMovimiento ;;
  }
  dimension: id2 {
    type: string
    sql: ${TABLE}.Id2 ;;
  }
  dimension: id_cat_emisor_petrus {
    type: string
    sql: ${TABLE}.IdCatEmisorPetrus ;;
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
  dimension: identificador_tarjeta {
    type: string
    sql: ${TABLE}.identificadorTarjeta ;;
  }
  dimension: inactividad_por_anio {
    type: string
    sql: ${TABLE}.InactividadPorAnio ;;
  }
  dimension: inactividad_por_anioagrupacin {
    type: string
    sql: ${TABLE}."InactividadPorAnio(agrupación)" ;;
  }
  dimension: inactividad_por_aniogrupo {
    type: string
    sql: ${TABLE}."InactividadPorAnio(grupo)" ;;
  }
  dimension: limite_compras {
    type: string
    sql: ${TABLE}.LimiteCompras ;;
  }
  dimension: limite_credito {
    type: string
    sql: ${TABLE}.LimiteCredito ;;
  }
  dimension: meses_ultimo_movimiento {
    type: string
    sql: ${TABLE}.MesesUltimoMovimiento ;;
  }
  dimension: nivel_cuenta {
    type: string
    sql: ${TABLE}.NivelCuenta ;;
  }
  dimension: nmeroderegistros {
    type: string
    sql: ${TABLE}."Númeroderegistros" ;;
  }
  dimension: nombre_completo {
    type: string
    sql: ${TABLE}.nombre_completo ;;
  }
  dimension: p2_p_activo {
    type: string
    sql: ${TABLE}.P2P_Activo ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: promedio_vida_cuenta_meses {
    type: string
    sql: ${TABLE}.PromedioVidaCuentaMeses ;;
  }
  dimension: tienen_usuario {
    type: string
    sql: ${TABLE}.TienenUsuario ;;
  }
  dimension: tipo_cuentas_por_transacciones {
    type: string
    sql: ${TABLE}.TipoCuentasPorTransacciones ;;
  }
  dimension: titular {
    type: string
    sql: ${TABLE}.Titular ;;
  }
  dimension: total_clientes {
    type: string
    sql: ${TABLE}.TotalClientes ;;
  }
  dimension: total_cuentas {
    type: string
    sql: ${TABLE}.TotalCuentas ;;
  }
  dimension: total_usuarios {
    type: string
    sql: ${TABLE}.TotalUsuarios ;;
  }
  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }
  dimension: usuariocon_sofipo {
    type: string
    sql: ${TABLE}.UsuarioconSOFIPO ;;
  }
  dimension: vacio {
    type: string
    sql: ${TABLE}.Vacio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
