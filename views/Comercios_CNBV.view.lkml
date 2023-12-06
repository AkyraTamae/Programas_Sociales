view: comercios_cnbv {
  derived_table: {
    sql: Select
        *,
        'ComerciosNoAcumulado' As 'Tipo'
      From
        [CNBV].[ComerciosNoAcumulado_2422]
      Union All
      Select
        *,
        'ComerciosAcumulado' As 'Tipo'
      From
        [CNBV].[ComerciosAcumulado_2422]
      Union All
      Select
        *,
        'ComerciosTransaccionNoAcumulado' As 'Tipo'
      From
        [CNBV].[ComerciosTransaccionNoAcumulado_2422]
      Union All
      Select
        *,
        'ComerciosTransaccionAcumulado' As 'Tipo'
      From
        [CNBV].[ComerciosTransaccionAcumulado_2422] ;;
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

  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }

  measure: dispositivos {
    type: sum
    sql: ${TABLE}.TotalDispositivos ;;
  }

  set: detail {
    fields: [
        id,
  anio,
  mes,
  total_dispositivos,
  tipo
    ]
  }
}
