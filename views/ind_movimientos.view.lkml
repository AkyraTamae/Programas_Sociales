view: ind_movimientos {
  sql_table_name: dbo.ind_movimientos ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cod_mont {
    type: string
    sql: ${TABLE}.CodMont ;;
  }
  dimension: cod_transac {
    type: string
    sql: ${TABLE}.CodTransac ;;
  }
  dimension_group: fclear {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FClear ;;
  }
  dimension_group: fe_pago {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FePago ;;
  }
  dimension_group: fe_pres {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FePres ;;
  }
  dimension_group: fe_proc {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FeProc ;;
  }
  dimension_group: fe_venc {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FeVenc ;;
  }
  dimension_group: flicom {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Flicom ;;
  }
  dimension_group: fliqusu {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fliqusu ;;
  }
  dimension: imp_cotiz {
    type: number
    sql: ${TABLE}.ImpCotiz ;;
  }
  dimension: imp_total_orig {
    type: number
    sql: ${TABLE}.ImpTotalOrig ;;
  }
  dimension: imp_total_vta {
    type: number
    sql: ${TABLE}.ImpTotalVta ;;
  }
  dimension: nro_banco_suc_mov {
    type: string
    sql: ${TABLE}.NroBancoSucMov ;;
  }
  dimension: nro_boleta {
    type: string
    sql: ${TABLE}.NroBoleta ;;
  }
  dimension: nro_cupon {
    type: string
    sql: ${TABLE}.NroCupon ;;
  }
  dimension: nro_lote {
    type: string
    sql: ${TABLE}.NroLote ;;
  }
  dimension_group: origen {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Origen ;;
  }
  dimension: reservado_casa {
    type: string
    sql: ${TABLE}.ReservadoCASA ;;
  }
  dimension: reservado_casa2 {
    type: string
    sql: ${TABLE}.ReservadoCASA2 ;;
  }
  dimension: tip_reg {
    type: string
    sql: ${TABLE}.TipReg ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
