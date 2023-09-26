view: folios_gasolina {
  sql_table_name: dbo.FoliosGasolina ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
  }
  dimension: serie_fiscal {
    type: string
    sql: ${TABLE}.SerieFiscal ;;
  }
  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
