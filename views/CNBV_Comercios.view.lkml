
view: cnbv_comercios {
  derived_table: {
    sql: Select
        Count(Distinct(Username)) As TotalComercios,
        DATE_TRUNC(CAST(CreationDate As Date), Month) As Fecha
      From
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchant`
      Group By
        DATE_TRUNC(CAST(CreationDate As Date), Month) ;;
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

  measure: sum_comercios_no_acumulado {
    type: sum
    label: "Total Comercios No Acumulado"
    sql: ${TABLE}.TotalComercios ;;
  }

  measure: total_comercios_acumulado {
    type: running_total
    sql: ${sum_comercios_no_acumulado} ;;
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
        total_comercios,
    ]
  }
}
