view: matv09_auditorias {
  derived_table: {
    sql: Select
        A.*,
        B.Cantidad,
        B.Producto,
        B.RazonSocial,
        ROW_NUMBER() Over( Partition By A.IdAuditoria Order By A.IdAuditoria) As 'Distinct_IdAuditoria'
      From
        [broxelco_rdg].[Auditorias2019] A With (Nolock)
      Left Join
        [broxelco_rdg].[AuditoriasCategoriasProductos] B With (Nolock) On A.IdAuditoria = B.IdAuditoria ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: marca_temporal {
    timeframes: [date, week, month, quarter, year, month_name]
    type: time
    label: "Marca Temporal"
    sql: ${TABLE}."Marca Temporal" ;;
  }

  dimension_group: hora {
    type: time
    sql: ${TABLE}.Hora ;;
  }

  dimension: agente {
    type: string
    sql: ${TABLE}.Agente ;;
  }

  dimension: turno {
    type: string
    sql: ${TABLE}.Turno ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension: nombre_del_titular {
    type: string
    label: "Nombre del titular"
    sql: ${TABLE}."Nombre del titular" ;;
  }

  dimension: telfono {
    type: string
    sql: ${TABLE}."Teléfono" ;;
  }

  dimension: nmero {
    type: string
    sql: ${TABLE}."Número" ;;
  }

  dimension_group: fecha_transaction {
    timeframes: [date, week, month, quarter, year, month_name]
    type: time
    sql: ${TABLE}.FechaTransaction ;;
  }

  dimension: monto_payments {
    type: number
    sql: ${TABLE}.MontoPayments ;;
  }

  dimension: monto_factura {
    type: number
    sql: ${TABLE}.MontoFactura ;;
  }

  dimension: programa_al_que_pertenece {
    type: string
    label: "Programa al que pertenece"
    sql: ${TABLE}."Programa al que pertenece" ;;
  }

  dimension: afiliacin {
    type: string
    sql: ${TABLE}."Afiliación" ;;
  }

  dimension: razn_social {
    type: string
    label: "Razón Social"
    sql: ${TABLE}."Razón Social" ;;
  }

  dimension: ife {
    type: string
    sql: ${TABLE}.IFE ;;
  }

  dimension: estatus_ife {
    type: string
    label: "Estatus IFE"
    sql: ${TABLE}."Estatus IFE" ;;
  }

  dimension: factura {
    type: string
    sql: ${TABLE}.Factura ;;
  }

  dimension: estatus_factura {
    type: string
    label: "Estatus Factura"
    sql: ${TABLE}."Estatus Factura" ;;
  }

  dimension: firma {
    type: number
    sql: ${TABLE}.Firma ;;
  }

  dimension: estatus_firma {
    type: string
    label: "Estatus Firma"
    sql: ${TABLE}."Estatus Firma" ;;
  }

  dimension: productos {
    type: string
    sql: ${TABLE}.Productos ;;
  }

  dimension: estatus_productos {
    type: string
    label: "Estatus Productos"
    sql: ${TABLE}."Estatus Productos" ;;
  }

  dimension: n_de_productos_adquiridos {
    type: number
    label: "Nº de productos adquiridos"
    sql: ${TABLE}."Nº de productos adquiridos" ;;
  }

  dimension: productos_dentro_del_programa {
    type: string
    label: "Productos dentro del programa?"
    sql: ${TABLE}."Productos dentro del programa?" ;;
  }

  dimension: categorias_de_productos {
    type: string
    label: "Categorias de productos"
    sql: ${TABLE}."Categorias de productos" ;;
  }

  dimension: artculos_fuera_del_programa {
    type: string
    label: "Artículos fuera del programa"
    sql: ${TABLE}."Artículos fuera del programa" ;;
  }

  dimension: estatus_de_auditoria {
    type: string
    label: "Estatus de Auditoria"
    sql: ${TABLE}."Estatus de Auditoria" ;;
  }

  dimension: amerita_llamada_telefnica {
    type: string
    label: "Amerita llamada telefónica"
    sql: ${TABLE}."Amerita llamada telefónica" ;;
  }

  dimension: motivo_de_amonestacin {
    type: string
    label: "Motivo de amonestación"
    sql: ${TABLE}."Motivo de amonestación" ;;
  }

  dimension: comentarios {
    type: string
    sql: ${TABLE}.Comentarios ;;
  }

  dimension: id_auditoria {
    type: string
    sql: ${TABLE}.IdAuditoria ;;
  }

  dimension: numero_movimiento {
    type: number
    sql: ${TABLE}.NumeroMovimiento ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  dimension: distinct_id_auditoria {
    type: number
    sql:
    case
    when ${TABLE}.Distinct_IdAuditoria = 1 then ${TABLE}.Distinct_IdAuditoria
    else 0
    end ;;
  }

###################################medidas###################################

  measure: auditoria_amonestaciones {
    type: sum
    label: "#Amonestados"
    sql:
    case
    when ${TABLE}."Estatus de Auditoria" like '%Amones%' then ${distinct_id_auditoria}
    else 0
    end ;;
  }

    measure: auditoria_correctas {
    type: sum
    label: "#Exitosos"
    sql:
    case
    when ${TABLE}."Estatus de Auditoria" not like '%Amones%' then ${distinct_id_auditoria}
    else 0
    end ;;
  }


  set: detail {
    fields: [
      hora_time,
      agente,
      turno,
      id,
      nombre_del_titular,
      telfono,
      nmero,
      monto_payments,
      monto_factura,
      programa_al_que_pertenece,
      afiliacin,
      razn_social,
      ife,
      estatus_ife,
      factura,
      estatus_factura,
      firma,
      estatus_firma,
      productos,
      estatus_productos,
      n_de_productos_adquiridos,
      productos_dentro_del_programa,
      categorias_de_productos,
      artculos_fuera_del_programa,
      estatus_de_auditoria,
      amerita_llamada_telefnica,
      motivo_de_amonestacin,
      comentarios,
      id_auditoria,
      numero_movimiento,
      cantidad,
      producto,
      razon_social,
      distinct_id_auditoria
    ]
  }
}
