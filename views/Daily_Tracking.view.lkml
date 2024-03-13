view: daily_tracking {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIPlata.Daily_Tracking` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: data_set {
    type: string
    sql: ${TABLE}.DataSet ;;
  }
  dimension_group: fecha_corte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaCorte ;;
  }
  dimension_group: fecha_creacion_tabla {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaCreacionTabla ;;
  }
  dimension_group: fecha_ultima_modificacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaUltimaModificacion ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: proyecto {
    type: string
    sql: ${TABLE}.Proyecto ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: total_registros {
    type: number
    sql: ${TABLE}.TotalRegistros ;;
  }
  dimension: total_registros_previo {
    type: number
    sql: ${TABLE}.TotalRegistrosPrevio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
