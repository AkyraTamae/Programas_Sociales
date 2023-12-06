view: comercios_cnbv {
  derived_table: {
    sql: Select
        A.Id,
        A.Anio,
        A.Mes,
        Case When A.Tipo = 'Comercios_No_Acumulado' Then 'Comercios_No_Acumulado' End As 'Comercios_No_Acumulado',
        Case When A.Tipo = 'Comercios_Acumulado' Then 'Comercios_Acumulado' End As 'Comercios_Acumulado',
        Case When A.Tipo = 'Comercios_Transaccion_No_Acumulado' Then 'Comercios_Transaccion_No_Acumulado' End As 'Comercios_Transaccion_No_Acumulado',
        Case When A.Tipo = 'Comercios_Transaccion_Acumulado' Then 'Comercios_Transaccion_Acumulado' End As 'Comercios_Transaccion_Acumulado',
        Case When A.Tipo = 'Dispositivos_No_Acumulado' Then 'Dispositivos_No_Acumulado' End As 'Dispositivos_No_Acumulado',
        Case When A.Tipo = 'Dispositivos_Acumulado' Then 'Dispositivos_Acumulado' End As 'Dispositivos_Acumulado',
        Case When A.Tipo = 'Dispositivos_Transaccion_No_Acumulado' Then 'Dispositivos_Transaccion_No_Acumulado' End As 'Dispositivos_Transaccion_No_Acumulado',
        Case When A.Tipo = 'Dispositivos_Transaccion_Acumulado' Then 'Dispositivos_Transaccion_Acumulado' End As 'Dispositivos_Transaccion_Acumulado'
      From
      (
      Select
        *,
        'Comercios_No_Acumulado' As 'Tipo'
      From
        [CNBV].[ComerciosNoAcumulado_2422]
      Union All
      Select
        *,
        'Comercios_Acumulado' As 'Tipo'
      From
        [CNBV].[ComerciosAcumulado_2422]
      Union All
      Select
        *,
        'Comercios_Transaccion_No_Acumulado' As 'Tipo'
      From
        [CNBV].[ComerciosTransaccionNoAcumulado_2422]
      Union All
      Select
        *,
        'Comercios_Transaccion_Acumulado' As 'Tipo'
      From
        [CNBV].[ComerciosTransaccionAcumulado_2422]
      Union All
      Select
        *,
        'Dispositivos_No_Acumulado' As 'Tipo'
      From
        [CNBV].[DispositivosNoAcumulado_2422]
      Union All
      Select
        *,
        'Dispositivos_Acumulado' As 'Tipo'
      From
        [CNBV].[DispositivosAcumulado_2422]
      Union All
      Select
        *,
        'Dispositivos_Transaccion_No_Acumulado' As 'Tipo'
      From
        [CNBV].[DispositivosTransaccionNoAcumulado_2422]
      Union All
      Select
        *,
        'Dispositivos_Transaccion_Acumulado' As 'Tipo'
      From
        [CNBV].[DispositivosTransaccionAcumulado_2422]
      )A ;;
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

  dimension: comercios_no_acumulado {
    type: string
    sql: ${TABLE}.Comercios_No_Acumulado ;;
  }

  dimension: comercios_acumulado {
    type: string
    sql: ${TABLE}.Comercios_Acumulado ;;
  }

  dimension: comercios_transaccion_no_acumulado {
    type: string
    sql: ${TABLE}.Comercios_Transaccion_No_Acumulado ;;
  }

  dimension: comercios_transaccion_acumulado {
    type: string
    sql: ${TABLE}.Comercios_Transaccion_Acumulado ;;
  }

  dimension: dispositivos_no_acumulado {
    type: string
    sql: ${TABLE}.Dispositivos_No_Acumulado ;;
  }

  dimension: dispositivos_acumulado {
    type: string
    sql: ${TABLE}.Dispositivos_Acumulado ;;
  }

  dimension: dispositivos_transaccion_no_acumulado {
    type: string
    sql: ${TABLE}.Dispositivos_Transaccion_No_Acumulado ;;
  }

  dimension: dispositivos_transaccion_acumulado {
    type: string
    sql: ${TABLE}.Dispositivos_Transaccion_Acumulado ;;
  }

  set: detail {
    fields: [
      id,
      anio,
      mes,
      comercios_no_acumulado,
      comercios_acumulado,
      comercios_transaccion_no_acumulado,
      comercios_transaccion_acumulado,
      dispositivos_no_acumulado,
      dispositivos_acumulado,
      dispositivos_transaccion_no_acumulado,
      dispositivos_transaccion_acumulado
    ]
  }
}
