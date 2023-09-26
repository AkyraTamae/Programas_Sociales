view: llamadas_call_center {
  sql_table_name: dbo.LlamadasCallCenter ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: canal_entrada {
    type: number
    sql: ${TABLE}.CanalEntrada ;;
  }
  dimension: cancelacion {
    type: string
    sql: ${TABLE}.Cancelacion ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: comentarios {
    type: string
    sql: ${TABLE}.Comentarios ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: descripcion_tipo {
    type: string
    sql: ${TABLE}.DescripcionTipo ;;
  }
  dimension: documentos_completos {
    type: number
    sql: ${TABLE}.DocumentosCompletos ;;
  }
  dimension: estatus {
    type: string
    sql: ${TABLE}.Estatus ;;
  }
  dimension: estatus_incidente {
    type: string
    sql: ${TABLE}.EstatusIncidente ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension_group: fecha_documentos_completos {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaDocumentosCompletos ;;
  }
  dimension_group: fecha_hora_fin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraFin ;;
  }
  dimension_group: fecha_hora_incidente {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraIncidente ;;
  }
  dimension_group: fecha_hora_inicio {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaHoraInicio ;;
  }
  dimension_group: fecha_sol_operacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaSolOperacion ;;
  }
  dimension_group: fecha_ultima_modificacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaUltimaModificacion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: grupo_escalamiento {
    type: string
    sql: ${TABLE}.GrupoEscalamiento ;;
  }
  dimension: id_agente {
    type: string
    sql: ${TABLE}.IdAgente ;;
  }
  dimension: id_audio {
    type: string
    sql: ${TABLE}.IdAudio ;;
  }
  dimension: id_call_center {
    type: number
    sql: ${TABLE}.IdCallCenter ;;
  }
  dimension: id_campania {
    type: string
    sql: ${TABLE}.IdCampania ;;
  }
  dimension: id_categoria {
    type: number
    sql: ${TABLE}.IdCategoria ;;
  }
  dimension: id_incidente {
    type: string
    sql: ${TABLE}.IdIncidente ;;
  }
  dimension: id_llamada {
    type: string
    sql: ${TABLE}.IdLlamada ;;
  }
  dimension: id_service_now {
    type: string
    sql: ${TABLE}.IdServiceNow ;;
  }
  dimension: id_subcategoria {
    type: number
    sql: ${TABLE}.IdSubcategoria ;;
  }
  dimension: lada {
    type: string
    sql: ${TABLE}.Lada ;;
  }
  dimension: nombre_analista {
    type: string
    sql: ${TABLE}.NombreAnalista ;;
  }
  dimension: nombre_completo {
    type: string
    sql: ${TABLE}.NombreCompleto ;;
  }
  dimension: notas_incidente {
    type: string
    sql: ${TABLE}.NotasIncidente ;;
  }
  dimension: notas_operacionales {
    type: string
    sql: ${TABLE}.NotasOperacionales ;;
  }
  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }
  dimension: numero_tarjeta {
    type: string
    sql: ${TABLE}.NumeroTarjeta ;;
  }
  dimension: pantallas_docs {
    type: string
    sql: ${TABLE}.PantallasDocs ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: resultado_llamada {
    type: string
    sql: ${TABLE}.ResultadoLlamada ;;
  }
  dimension: se_escala {
    type: string
    sql: ${TABLE}.SeEscala ;;
  }
  dimension: subcategoria {
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  dimension: telefono_sis {
    type: string
    sql: ${TABLE}.TelefonoSis ;;
  }
  dimension: tipo {
    type: number
    sql: ${TABLE}.Tipo ;;
  }
  dimension: usuario_incidente {
    type: string
    sql: ${TABLE}.UsuarioIncidente ;;
  }
  dimension: usuario_operaciones {
    type: string
    sql: ${TABLE}.UsuarioOperaciones ;;
  }
  dimension: usuario_ultima_modificacion {
    type: string
    sql: ${TABLE}.UsuarioUltimaModificacion ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
