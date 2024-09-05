view: alertas_tableros {
  derived_table: {
    sql: SELECT
      DISTINCT
      AA.project_id,
      A.table_schema,
      A.table_name,
      CONCAT(AA.project_id,".",A.table_schema,".",AA.table_name) AS full_table_name,
      CAST(AA.storage_last_modified_time AS DATE) AS updated_at
    FROM
      `mgcp-10078073-bxl-dwh-prod.region-us.INFORMATION_SCHEMA.TABLES` A
    LEFT JOIN
        (
      SELECT
        DISTINCT
        project_id,
        table_schema,
        table_name,
        CONCAT(project_id,".",table_name) AS table_name_key,
        storage_last_modified_time
      FROM
        `mgcp-10078073-bxl-dwh-prod.region-us.INFORMATION_SCHEMA.TABLE_STORAGE_BY_PROJECT`
      ) AA ON AA.table_name_key = CONCAT(project_id, ".", A.table_name)

    UNION ALL

    SELECT
      DISTINCT
      project_id,
      table_schema,
      table_name,
      CONCAT(project_id,".",table_schema,".",table_name) AS full_table_name,
      CAST(storage_last_modified_time AS DATE) AS updated_at
    FROM
        `mgcp-10078073-bxl-bi-snd.region-us.INFORMATION_SCHEMA.TABLE_STORAGE_BY_PROJECT` ;;
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

  dimension: full_table_name {
    type: string
    sql: ${TABLE}.full_table_name ;;
  }

  dimension: updated_at {
    type: date
    datatype: date
    sql: ${TABLE}.updated_at ;;
  }

  set: detail {
    fields: [
      project_id,
      table_schema,
      table_name,
      full_table_name,
      updated_at
    ]
  }
}
