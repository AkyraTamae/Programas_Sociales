view: comercios_cnbv {
  derived_table: {
    sql: Select
        *,
        'Comercios_No_Acumulado' As 'CNBV_Tipo'
      From
      [CNBV].[ComerciosNoAcumulado_2422]
      Union All
      Select
        *,
        'Comercios_Acumulado' As 'CNBV_Tipo'
      From
        [CNBV].[ComerciosAcumulado_2422]
      Union All
      Select
        *,
        'Comercios_Transaccion_No_Acumulado' As 'CNBV_Tipo'
      From
        [CNBV].[ComerciosTransaccionNoAcumulado_2422]
      Union All
      Select
        *,
        'Dispositivos_Transaccion_Acumulado' As 'CNBV_Tipo'
      From
        [CNBV].[DispositivosTransaccionAcumulado_2422] ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: anio {
    type: string
    sql: ${TABLE}.Anio ;;
  }

  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }

  dimension: total_dispositivos {
    type: number
    sql: ${TABLE}.TotalDispositivos ;;
  }

  dimension: cnbv_tipo {
    type: string
    sql: ${TABLE}.CNBV_Tipo ;;
  }

  set: detail {
    fields: [
      id,
      anio,
      mes,
      total_dispositivos,
      cnbv_tipo
    ]
  }
}
