view: broxstars {
  sql_table_name: dbo.BROXstars ;;

  dimension: clabe {
    type: string
    sql: ${TABLE}.CLABE ;;
  }
  dimension: clavecliente {
    type: string
    sql: ${TABLE}.clavecliente ;;
  }
  dimension: column_0 {
    type: string
    sql: ${TABLE}."Column 0" ;;
  }
  dimension: curp {
    type: string
    sql: ${TABLE}.CURP ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE ;;
  }
  measure: count {
    type: count
  }
}
