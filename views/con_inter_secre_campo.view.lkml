view: con_inter_secre_campo {
  sql_table_name: dbo.ConInter_SecreCampo ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."Año" ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Fecha ;;
  }
  dimension: importe {
    type: number
    sql: ${TABLE}.Importe ;;
  }
  dimension: intercambio {
    type: number
    sql: ${TABLE}.Intercambio ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }
  measure: count {
    type: count
  }
}
