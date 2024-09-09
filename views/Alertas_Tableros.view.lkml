view: alertas_tableros {
  derived_table: {
    sql: SELECT
        DISTINCT
        'mgcp-10078073-bxl-dwh-prod' AS project_id,
        A.table_schema,
        A.table_name,
        RIGHT(table_schema, LENGTH(A.table_schema) - STRPOS(A.table_schema, '_')) AS table_schema_key,
        CONCAT('mgcp-10078073-bxl-dwh-prod', ".", A.table_schema, ".", A.table_name) AS full_table_name,
        AA.storage_last_modified_time AS updated_at,
        AA.total_rows,
        C.TotalRegistrosPrevio,
        B.Az_Registros_Actual,
        B.Az_Registros_Previo,
        CASE
        WHEN AA.total_rows >= C.TotalRegistrosPrevio AND AA.total_rows >= B.Az_Registros_Actual OR B.Az_Registros_Actual > AA.total_rows AND AA.total_rows - B.Az_Registros_Actual >= -100 THEN 'Correcto'
        WHEN AA.total_rows < B.Az_Registros_Actual OR B.Az_Registros_Actual > AA.total_rows AND AA.total_rows - B.Az_Registros_Actual < -100 OR AA.total_rows > C.TotalRegistrosPrevio AND B.Az_Registros_Actual IS NULL THEN 'Verificar'
        WHEN AA.total_rows = C.TotalRegistrosPrevio AND B.Az_Registros_Actual > AA.total_rows OR AA.total_rows = C.TotalRegistrosPrevio AND B.Az_Registros_Actual IS NULL OR C.TotalRegistrosPrevio > AA.total_rows THEN 'Error'
        END AS Alerta
      FROM
        `mgcp-10078073-bxl-dwh-prod.region-us.INFORMATION_SCHEMA.TABLES` A
      LEFT JOIN
        (
        SELECT
          DISTINCT
          CONCAT(project_id, ".", RIGHT(table_schema, LENGTH(table_schema) - STRPOS(table_schema, '_')), ".", table_name) AS table_name_key,
          CAST(storage_last_modified_time AS DATE) AS storage_last_modified_time,
          total_rows
        FROM
          `mgcp-10078073-bxl-dwh-prod.region-us.INFORMATION_SCHEMA.TABLE_STORAGE_BY_PROJECT`
        )AA ON AA.table_name_key = CONCAT('mgcp-10078073-bxl-dwh-prod', ".", RIGHT(A.table_schema, LENGTH(A.table_schema) - STRPOS(A.table_schema, '_')), ".", A.table_name)
      LEFT JOIN
        `mgcp-10078073-bxl-bi-snd.BIOro.Datos_Productivos` B ON B.Az_Data_Set = RIGHT(table_schema, LENGTH(A.table_schema) - STRPOS(A.table_schema, '_')) AND B.Az_Nombre = A.table_name AND B.Az_Fecha_Corte = CAST(CURRENT_DATE() AS DATE)
      LEFT JOIN
        `mgcp-10078073-bxl-bi-snd.BIPlata.Daily_Tracking` C ON CAST(DATE_ADD(C.FechaCorte, INTERVAL 1 DAY) AS DATE) = CAST(CURRENT_DATETIME() AS DATE) AND C.Proyecto = 'mgcp-10078073-bxl-dwh-prod'AND  RIGHT(C.DataSet, LENGTH(C.DataSet) - STRPOS(C.DataSet, '_')) = RIGHT(table_schema, LENGTH(A.table_schema) - STRPOS(A.table_schema, '_')) AND C.Nombre = A.table_name ;;
      # WHERE
        # CONCAT('mgcp-10078073-bxl-dwh-prod', ".", A.table_schema, ".", A.table_name) IN ('mgcp-10078073-bxl-dwh-prod.stg_BrxMulticanales.TMensaje') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.table_schema ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: table_schema_key {
    type: string
    sql: ${TABLE}.table_schema_key ;;
  }

  dimension: full_table_name {
    type: string
    sql: ${TABLE}.full_table_name ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: datetime
    sql: ${TABLE}.updated_at ;;
    }


  dimension: total_rows {
    type: number
    sql: ${TABLE}.total_rows ;;
  }

  dimension: total_registros_previo {
    type: number
    sql: ${TABLE}.TotalRegistrosPrevio ;;
  }

  dimension: az_registros_actual {
    type: number
    sql: ${TABLE}.Az_Registros_Actual ;;
  }

  dimension: az_registros_previo {
    type: number
    sql: ${TABLE}.Az_Registros_Previo ;;
  }

  dimension: alerta {
    type: string
    sql: ${TABLE}.Alerta ;;
  }

  set: detail {
    fields: [
      project_id,
      table_schema,
      table_name,
      table_schema_key,
      full_table_name,
      total_rows,
      total_registros_previo,
      az_registros_actual,
      az_registros_previo,
      alerta
    ]
  }
}
