view: mesacontrolauditorias {
  sql_table_name: dbo.mesacontrolauditorias ;;

  dimension: afiliacion {
    type: string
    sql: ${TABLE}.Afiliacion ;;
  }
  dimension: agente {
    type: string
    sql: ${TABLE}.Agente ;;
  }
  dimension: conteo {
    type: number
    sql: ${TABLE}.Conteo ;;
  }
  dimension: est_audi {
    type: string
    sql: ${TABLE}.Est_Audi ;;
  }
  dimension_group: fecha_transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaTransaction ;;
  }
  dimension_group: marca_temporal {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Marca_Temporal ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  measure: count {
    type: count
  }
}
