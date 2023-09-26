view: liquidaciones_qmr {
  sql_table_name: dbo.liquidaciones_qmr ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: id_liquidacion {
    type: number
    sql: ${TABLE}.IdLiquidacion ;;
  }
  dimension: importe {
    type: number
    sql: ${TABLE}.Importe ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }
  dimension_group: trimestre {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Trimestre ;;
  }
  dimension: trimestre_q {
    type: string
    sql: ${TABLE}.TrimestreQ ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
