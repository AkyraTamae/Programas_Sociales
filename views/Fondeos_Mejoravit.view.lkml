view: fondeos_mejoravit {
  derived_table: {
    sql: Select
        A.id,
        A.credito,
        A.numeroCarrier As Cuenta,
        A.claveEntidadFinanciera,
        A.nombre_tarjetahabiente,
        A.folioDispersion,
        A.fechaProceso,
        B.FechaEjecucion,
        B.FechaAprobacion,
        B.fechaCreacion,
        A.montoCredito,
        A.montoTotalCredito,
        Right (D.nro_tarjeta, 4) As Tarjeta
      From
        `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.ind_Originacion` A
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.dispersionesSolicitudes` B On A.folioDispersion = B.folio
      Left Join
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.dispersionesInternas` C On B.folio = C.idSolicitud
      Left Join
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.maquila` D On A.numerocarrier = D.num_cuenta
      Where
        D.nro_tarjeta Is Not NUll Or D.nro_tarjeta <> ''
      Group By
        A.id,
        A.credito,
        A.claveEntidadFinanciera,
        A.nombre_tarjetahabiente,
        A.folioDispersion,
        A.fechaProceso,
        B.FechaEjecucion,
        B.FechaAprobacion,
        B.fechaCreacion,
        A.montoCredito,
        A.montoTotalCredito,
        A.numeroCarrier,
        Right (D.nro_tarjeta, 4) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: credito {
    type: string
    sql: ${TABLE}.credito ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: clave_entidad_financiera {
    type: number
    sql: ${TABLE}.claveEntidadFinanciera ;;
  }

  dimension: nombre_tarjetahabiente {
    type: string
    sql: ${TABLE}.nombre_tarjetahabiente ;;
  }

  dimension: folio_dispersion {
    type: string
    sql: ${TABLE}.folioDispersion ;;
  }

  dimension_group: fecha_proceso {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaProceso ;;
  }

  dimension_group: fecha_ejecucion {
    type: time
    sql: ${TABLE}.FechaEjecucion ;;
  }

  dimension_group: fecha_aprobacion {
    type: time
    sql: ${TABLE}.FechaAprobacion ;;
  }

  dimension_group: fecha_creacion {
    type: time
    sql: ${TABLE}.fechaCreacion ;;
  }

  dimension: monto_credito {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.montoCredito ;;
  }

  dimension: monto_total_credito {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.montoTotalCredito ;;
  }

  dimension: tarjeta {
    type: string
    sql: ${TABLE}.Tarjeta ;;
  }

  ###########################################

  dimension: mes_txt {
    type: string
    order_by_field: fecha_proceso_date
    sql: date_trunc(cast(${TABLE}.fechaProceso as date), month) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  ###########################################

  set: detail {
    fields: [
      id,
      credito,
      cuenta,
      clave_entidad_financiera,
      nombre_tarjetahabiente,
      folio_dispersion,
      fecha_ejecucion_time,
      fecha_aprobacion_time,
      fecha_creacion_time,
      monto_credito,
      monto_total_credito,
      tarjeta
    ]
  }
}
