connection: "azurebi"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: programas_sociales_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: programas_sociales_default_datagroup


map_layer: mexico_layer{
  #file: "/mapas/map.json"
  file: "/Mapa/Estados_MX.topojson"
}

explore: acceso_usuarios {}

explore: ado_net_destination {}

explore: afiliaciones_comerciales {}

explore: alta_boveda_con_transaccional_sr__registro {}

explore: apuestas {}

explore: asig_cxa {}

explore: astro {}

explore: astro_copia_antigua {}

explore: att_view {}

explore: au_xavaya2023 {}

explore: b2_ccomunicacion_borrar {}

explore: base_diario_22 {}

explore: base_hv {}

explore: broxel_core_operaciones {}

explore: broxel_core_remesas {}

explore: broxstars {}

explore: calculo_sr {}

explore: calculo_sredad_edo_opera {}

explore: calculo_srgiro {}

explore: campaign {}

explore: campanas_email {}

explore: campanas_push {}

explore: carga1eliminar {}

explore: cargahvalexborrar {}

explore: cargaryborrar {}

explore: cat_procesador {}

explore: catalogo_cuentas_brian {}

explore: cc_saldos_x_cuenta_copia {}

explore: charge_maquila1 {}

explore: cierre_diario_disponibles_back {}

explore: cierre_liquidacionpor_comercio {}

explore: cierre_liquidacionpor_programa {}

explore: cierre_transac29_agost02_sept {}

explore: cierre_transac_agosto_temp {}

explore: cierre_transacciones {}

explore: cierre_transacciones20200526 {}

explore: cierre_transacciones24_ago1_sept {}

explore: cierre_transacciones_historico {}

explore: cierre_transacciones_historico_credencial {}

explore: cierre_transaccionesrescompleto20210323 {}

explore: cierre_transacciones_res_para_clientes {}

explore: cierre_transacciones_usa {}

explore: clave_cliente_gasolina {}

explore: cliente_informacion_cuenta_usa {}

explore: clientes_pv {}

explore: clientes_credencias {}

explore: clientesmich {}

explore: cobro_cred_sr {}

explore: comercios_datos_completos_data_1 {}

explore: con_inter_becas {}

explore: con_inter_gas {}

explore: con_inter_gas_wb {}

explore: con_inter_secre_campo {}

explore: consolidadov6 {}

explore: consumo_sr {}

explore: consumo_srwork_bench {}

explore: credito_yo_construyo {}

explore: cuenta_pickit {}

explore: cuentas_secre_campo {}

explore: cuentas_sr {}

explore: cuentas_hvtemp {}

explore: cuentasinactivasborrar {}

explore: cuentas_ubicacion {}

explore: cursor_movimientos {}

explore: datos_mariana {}

explore: datosclientes {}

explore: datos_financieros_1525 {}

explore: destino_de_ado_net {}

explore: dispersiones_temp {}

explore: disponibles_concentrado {}

explore: disponibles_excepciones_agosto {}

explore: disponiblexdia {}

explore: dispositivos_v5 {}

explore: elias_b2_b {}

explore: embozos_ps {}

explore: excepcion_nomina {}

explore: expediente_constru_yo {}

explore: expedientes_digitales {}

explore: folios_gasolina {}

explore: folios_ops {}

explore: folios_services_now {}

explore: general_b2_b {}

explore: grl01 {}

explore: hc_cc_cierres {}

explore: hc_pv_b2_b {}

explore: ind_movimientos {}

explore: itx_transaction {}

explore: ivr_cc {}

explore: jornada {}

explore: juegos {}

explore: j_ulio {}

explore: liquidaciones_qmr {}

explore: llamadas_call_center {}

explore: log_cargas {}

explore: log_login_methods {}

explore: logtransac {}

explore: logtransaccion {}

explore: loop_cursor {}

explore: macroconsumos {}

explore: macrodispersiones {}

explore: macrodispersionesxmes {}

explore: macrodispersionpromedio {}

explore: macrodisponibles {}

explore: macroembozos {}

explore: macroestado {}

explore: macrotransferencias {}

explore: macrotransferenciaspormes {}

explore: macrotransferpromedio {}

explore: maquila_cmx {}

explore: maquila_marroquin {}

explore: maquilaco {}

explore: maquilacoresp {}

explore: maquilares20230707 {}

explore: melate {}

explore: mesacontrolauditorias {}

explore: migraciones_hv {}

explore: motivo_rechazo_expediente {}

explore: movimientos_credito_sr {}

explore: movimientos_temp {}

explore: movimientos_terminado {}

explore: movimiento_terminado2020 {}

explore: movimiento_terminado_actualizado {}

explore: movimiento_yo_construyo {}

explore: msreplication_objects {}

explore: msreplication_subscriptions {}

explore: mssavedforeignkeycolumns {}

explore: mssavedforeignkeyextendedproperties {}

explore: mssavedforeignkeys {}

explore: mssnapshotdeliveryprogress {}

explore: mssubscription_agents {}

explore: onboarding_otp {}

explore: operaciones_detalle {}

explore: pa_provincias {}

explore: pagos_galileo20221104 {}

explore: pagos_temp {}

explore: pais {}

explore: postdisponibles {}

explore: predisponibles {}

explore: pre_pay_studio_movements_back {}

explore: pronosticos_brox {}

explore: prueba_movimientos {}

explore: ps_tx_2_q2023 {}

explore: referenciador_sin_pago {}

explore: referidos {}

explore: referidos20220930 {}

explore: referidos20221001 {}

explore: referidos20221007 {}

explore: referidos20221014 {}

explore: referidos20221021 {}

explore: referidos20221028 {}

explore: referidos20221104 {}

explore: referidos20221111 {}

explore: referidos20221118 {}

explore: referidos20221125 {}

explore: referidos20221202 {}

explore: referidos20221209 {}

explore: referidos20221216 {}

explore: referidos20221223 {}

explore: referidos20230106 {}

explore: referidos20230113 {}

explore: referidos20230120 {}

explore: referidos20230127 {}

explore: referidos20230210 {}

explore: referidos20230224 {}

explore: referidos20230303 {}

explore: referidos20230310 {}

explore: referidos20230317 {}

explore: referidos20230324 {}

explore: referidos20230331 {}

explore: referidos20230407 {}

explore: referidos20230414 {}

explore: referidos20230421 {}

explore: referidos20230505 {}

explore: referidos20230512 {}

explore: referidos20230526 {}

explore: referidos20230609 {}

explore: referidos20230623 {}

explore: referidos20230630 {}

explore: referidos20230701 {}

explore: referidos20230707 {}

explore: referidos20230714 {}

explore: referidos20230721 {}

explore: referidos20230801 {}

explore: referidos20230817 {}

explore: referidos20230919 {}

explore: referidos_entradas {}

explore: referidos_entradas20221001 {}

explore: referidos_entradas20221007 {}

explore: referidos_entradas20221014 {}

explore: referidos_entradas20221021 {}

explore: referidos_entradas20221028 {}

explore: referidos_entradas20221104 {}

explore: referidos_entradas20221111 {}

explore: referidos_entradas20221118 {}

explore: referidos_entradas20221125 {}

explore: referidos_entradas20221202 {}

explore: referidos_entradas20221209 {}

explore: referidos_entradas20221216 {}

explore: referidos_entradas20221223 {}

explore: referidos_entradas20230106 {}

explore: referidos_entradas20230113 {}

explore: referidos_entradas20230120 {}

explore: referidos_entradas20230127 {}

explore: referidos_entradas20230210 {}

explore: referidos_entradas20230224 {}

explore: referidos_entradas20230303 {}

explore: referidos_entradas20230310 {}

explore: referidos_entradas20230317 {}

explore: referidos_entradas20230324 {}

explore: referidos_entradas20230331 {}

explore: referidos_entradas20230407 {}

explore: referidos_entradas20230414 {}

explore: referidos_entradas20230421 {}

explore: referidos_entradas20230505 {}

explore: referidos_entradas20230512 {}

explore: referidos_entradas20230526 {}

explore: referidos_entradas20230609 {}

explore: referidos_entradas20230623 {}

explore: referidos_entradas20230630 {}

explore: referidos_entradas20230701 {}

explore: referidos_entradas20230707 {}

explore: referidos_entradas20230714 {}

explore: referidos_entradas20230721 {}

explore: referidos_entradas20230801 {}

explore: referidos_entradas20230817 {}

explore: referidos_entradas20230919 {}

explore: referidos_imp {}

explore: referidos_imp10 {}

explore: referidos_imp11 {}

explore: referidos_imp12 {}

explore: referidos_imp13 {}

explore: referidos_imp14 {}

explore: referidos_imp15 {}

explore: referidos_imp16 {}

explore: referidos_imp17 {}

explore: referidos_imp18 {}

explore: referidos_imp19 {}

explore: referidos_imp2 {}

explore: referidos_imp20 {}

explore: referidos_imp21 {}

explore: referidos_imp22 {}

explore: referidos_imp23 {}

explore: referidos_imp24 {}

explore: referidos_imp25 {}

explore: referidos_imp26 {}

explore: referidos_imp27 {}

explore: referidos_imp28 {}

explore: referidos_imp29 {}

explore: referidos_imp3 {}

explore: referidos_imp30 {}

explore: referidos_imp31 {}

explore: referidos_imp32 {}

explore: referidos_imp33 {}

explore: referidos_imp34 {}

explore: referidos_imp35 {}

explore: referidos_imp36 {}

explore: referidos_imp37 {}

explore: referidos_imp38 {}

explore: referidos_imp39 {}

explore: referidos_imp4 {}

explore: referidos_imp40 {}

explore: referidos_imp5 {}

explore: referidos_imp6 {}

explore: referidos_imp7 {}

explore: referidos_imp8 {}

explore: referidos_imp9 {}

explore: remittance {}

explore: remittance_cancel {}

explore: renovaciones {}

explore: renovaciones_hv {}

explore: rep_alta_cuentas_clientes {}

explore: reporte_cobro_credito {}

explore: reporte_facturacion {}

explore: respaldo2018_ct {}

explore: respaldo2018_ctc {}

explore: respaldo_cierre_transacciones07072023 {}

explore: respaldo_problema_rogelio {}

explore: respaldo_ventana_disponible_core {}

explore: respaldo_ventana_disponible_corecon_tmp {}

explore: respaldo_ventana_movimientoscore {}

explore: respladoprocesador_cierre_transacciones {}

explore: respremittance25072023 {}

explore: respuesta_galileo20221104 {}

explore: salario_rosa_info_broxel {}

explore: salario_rosa_info_broxel_cnombre {}

explore: services_now_post_venta {}

explore: sesiones_usuario {}

explore: sesion_v5 {}

explore: socios {}

explore: srbroxelc_nombre_zell {}

explore: srbroxel_zell_correos {}

explore: srclaves_cliente_ycorreos {}

explore: srnombres2veces_zell {}

explore: surveymonkey_prueba {}

explore: sysdiagrams {}

explore: tabla_destino {}

explore: tabla_comercioatt {}

explore: table_a {}

explore: tarjetas_expira {}

explore: tiempos_avaya_2023 {}

explore: time_dimension {}

explore: tmp_cb {}

explore: tmp_ccc {}

explore: tmp_comercio {}

explore: totales_daily {}

explore: totales_daily_day {}

explore: totales_daily_mes {}

explore: tracelog {}

explore: tx_cuentas {}

explore: urgentes_galileo20221104 {}

explore: usuarios_respaldar {}

explore: versionv5 {}

explore: vwclientes_broxel {}

explore: programas_sociales_mejoravit {}

explore: programas_sociales_hipoteca_verde {}

explore: programas_sociales_renueva {}

explore: programas_sociales_repara {}

explore: programas_sociales_mujer_es_vida {}

explore: pre_pay_studio_movements_v {}

explore: programas_sociales_mejoravit_comercio_xmes {}

explore: remesas{}

explore: transacciones_pruebas {}

explore: prueba_promos_broxel {}
