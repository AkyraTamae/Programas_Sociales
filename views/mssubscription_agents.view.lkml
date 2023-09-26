view: mssubscription_agents {
  sql_table_name: dbo.MSsubscription_agents ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: allow_subscription_copy {
    type: string
    sql: ${TABLE}.allow_subscription_copy ;;
  }
  dimension: attach_state {
    type: number
    sql: ${TABLE}.attach_state ;;
  }
  dimension: attach_version {
    type: string
    sql: ${TABLE}.attach_version ;;
  }
  dimension: failover_mode {
    type: string
    sql: ${TABLE}.failover_mode ;;
  }
  dimension: last_sync_status {
    type: number
    sql: ${TABLE}.last_sync_status ;;
  }
  dimension: last_sync_summary {
    type: string
    sql: ${TABLE}.last_sync_summary ;;
  }
  dimension_group: last_sync {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_sync_time ;;
  }
  dimension_group: login {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.login_time ;;
  }
  dimension: publication {
    type: string
    sql: ${TABLE}.publication ;;
  }
  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }
  dimension: publisher_db {
    type: string
    sql: ${TABLE}.publisher_db ;;
  }
  dimension: queue_id {
    type: string
    sql: ${TABLE}.queue_id ;;
  }
  dimension: queue_server {
    type: string
    sql: ${TABLE}.queue_server ;;
  }
  dimension: spid {
    type: number
    value_format_name: id
    sql: ${TABLE}.spid ;;
  }
  dimension: subscription_type {
    type: number
    sql: ${TABLE}.subscription_type ;;
  }
  dimension: update_mode {
    type: number
    sql: ${TABLE}.update_mode ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
