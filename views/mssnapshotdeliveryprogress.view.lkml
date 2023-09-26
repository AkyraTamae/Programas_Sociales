view: mssnapshotdeliveryprogress {
  sql_table_name: dbo.MSsnapshotdeliveryprogress ;;

  dimension_group: progress_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.progress_timestamp ;;
  }
  dimension: progress_token {
    type: string
    sql: ${TABLE}.progress_token ;;
  }
  dimension: progress_token_hash {
    type: number
    sql: ${TABLE}.progress_token_hash ;;
  }
  dimension: session_token {
    type: string
    sql: ${TABLE}.session_token ;;
  }
  measure: count {
    type: count
  }
}
