
view: cnbv_dispositivos_transaccion {
  derived_table: {
    sql: Select
        COUNT(Distinct(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(md.DeviceName,'LOOP21',''),'MPOS',''),'_TEST',''),'V2',''),'bk',''),'_',''),'MP',''),'XX',''),'X',''),'LOOP',''), 'XX', ''))) As TotalDispositivosTransaccionNoAcumulado,
        DATE_TRUNC(CAST(lm.Fecha As Date), Month) As Fecha
      From
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMovement` lm
      Join
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.MerchantDevice` md On lm.MerchantDevice = md.id Where md.DeviceName not like 'Loop %'
      Group By
        DATE_TRUNC(CAST(lm.Fecha As Date), Month)
      Having
        COUNT(lm.MerchantDevice) > 0 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_dispositivos_transaccion_no_acumulado {
    type: number
    sql: ${TABLE}.TotalDispositivosTransaccionNoAcumulado ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, month_num, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  ######################################

  measure: sum_dispositivos_transaccion_no_acumulado {
    type: sum
    label: "Total Dispositivos Transaccion No Acumulado"
    sql: ${TABLE}.TotalDispositivosTransaccionNoAcumulado ;;
  }

  measure: total_dispositivos_transaccion_acumulado {
    type: running_total
    sql: ${sum_dispositivos_transaccion_no_acumulado} ;;
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
        total_dispositivos_transaccion_no_acumulado
    ]
  }
}
