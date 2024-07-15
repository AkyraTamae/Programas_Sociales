
view: daily_tracking_v2_bq {
  derived_table: {
    sql: SELECT
        RIGHT(DataSet, LENGTH(DataSet) - STRPOS(DataSet, '_')) AS BQ_DataSet,
        FechaCorte AS BQ_FechaCorte,
        Nombre AS BQ_Nombre,
        TotalRegistros AS BQ_RegistrosActual,
        TotalRegistrosPrevio AS BQ_RegistrosPrevio,
        CAST(FechaUltimaModificacion AS DATE) AS BQ_FechaUltimaModificacion,
        LEFT(DataSet, STRPOS(DataSet, '_') -1) AS BQ_Nomenclatura,
        Tipo AS BQ_Tipo
      FROM
        `mgcp-10078073-bxl-bi-snd.BIPlata.Daily_Tracking` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bq_data_set {
    type: string
    sql: ${TABLE}.BQ_DataSet ;;
  }

  dimension: bq_fecha_corte {
    type: date
    datatype: date
    sql: ${TABLE}.BQ_FechaCorte ;;
  }

  dimension: bq_nombre {
    type: string
    sql: ${TABLE}.BQ_Nombre ;;
  }

  dimension: bq_registros_actual {
    type: number
    sql: ${TABLE}.BQ_RegistrosActual ;;
  }

  dimension: bq_registros_previo {
    type: number
    sql: ${TABLE}.BQ_RegistrosPrevio ;;
  }

  dimension: bq_fecha_ultima_modificacion {
    type: date
    datatype: date
    sql: ${TABLE}.BQ_FechaUltimaModificacion ;;
  }

  dimension: bq_nomenclatura {
    type: string
    sql: ${TABLE}.BQ_Nomenclatura ;;
  }

  dimension: bq_tipo {
    type: string
    sql: ${TABLE}.BQ_Tipo ;;
  }

  set: detail {
    fields: [
        bq_data_set,
  bq_fecha_corte,
  bq_nombre,
  bq_registros_actual,
  bq_registros_previo,
  bq_fecha_ultima_modificacion,
  bq_nomenclatura,
  bq_tipo
    ]
  }
}
