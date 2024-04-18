
view: cnbv_comercios_transaccion {
  derived_table: {
    sql: Select
        COUNT(Distinct(lm.Username)) As TotalComerciosNoAcumulado,
        DATE_TRUNC(CAST(md.Fecha As Date), Month) As Fecha
      From
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchant` lm
      Join
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMovement` md On lm.Id = md.IdMerchant
      Group By
        DATE_TRUNC(CAST(md.Fecha As Date), Month)
      Having
        COUNT(lm.Id) > 0 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_comercios {
    type: number
    sql: ${TABLE}.TotalComercios ;;
  }

  dimension_group: fecha {

    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  ######################################

  measure: sum_comercios_transaccion_no_acumulado {
    type: sum
    label: "Total Comercios Transaccion No Acumulado"
    sql: ${TABLE}.TotalComerciosNoAcumulado ;;
  }

  measure: total_comercios_transaccion_acumulado {
    type: running_total
    sql: ${sum_comercios_transaccion_no_acumulado} ;;
  }

  dimension: mes_test {
    type: date
    label: "Date"
    order_by_field: fecha_month
    sql: date_trunc(${TABLE}.Fecha, month) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  ######################################

  set: detail {
    fields: [
        total_comercios
    ]
  }
}
