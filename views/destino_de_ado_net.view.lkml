view: destino_de_ado_net {
  sql_table_name: dbo.Destino de ADO NET ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension_group: begin {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.BeginDate ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}.Code ;;
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.CreationDate ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.EndDate ;;
  }
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension: id_cliente {
    type: number
    sql: ${TABLE}.IdCliente ;;
  }
  dimension: user_ops {
    type: string
    sql: ${TABLE}.UserOps ;;
  }
  dimension: uses {
    type: number
    sql: ${TABLE}.Uses ;;
  }
  dimension: uses_count {
    type: number
    sql: ${TABLE}.UsesCount ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
