view: general_b2_b {
  sql_table_name: dbo.General_B2B ;;

  dimension: broxel_control {
    type: string
    sql: ${TABLE}.BroxelControl ;;
  }
  dimension: categoria_payments {
    type: string
    sql: ${TABLE}.CategoriaPayments ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: intercambio {
    type: number
    sql: ${TABLE}.Intercambio ;;
  }
  dimension: programas {
    type: string
    sql: ${TABLE}.Programas ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  measure: count {
    type: count
  }
}
