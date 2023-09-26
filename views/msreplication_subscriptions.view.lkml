view: msreplication_subscriptions {
  sql_table_name: dbo.MSreplication_subscriptions ;;

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: distribution_agent {
    type: string
    sql: ${TABLE}.distribution_agent ;;
  }
  dimension: immediate_sync {
    type: string
    sql: ${TABLE}.immediate_sync ;;
  }
  dimension: independent_agent {
    type: string
    sql: ${TABLE}.independent_agent ;;
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
  dimension: subid {
    type: string
    sql: ${TABLE}.subid ;;
  }
  dimension: subscription_guid {
    type: string
    sql: ${TABLE}.subscription_guid ;;
  }
  dimension: subscription_type {
    type: number
    sql: ${TABLE}.subscription_type ;;
  }
  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }
  dimension: transaction_timestamp {
    type: string
    sql: ${TABLE}.transaction_timestamp ;;
  }
  dimension: update_mode {
    type: number
    sql: ${TABLE}.update_mode ;;
  }
  measure: count {
    type: count
  }
}
