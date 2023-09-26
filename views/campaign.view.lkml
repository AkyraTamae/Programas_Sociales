view: campaign {
  sql_table_name: dbo.campaign ;;

  dimension: nombre {
    type: string
    sql: ${TABLE}.nombre ;;
  }
  dimension: nombre_voucherify {
    type: string
    sql: ${TABLE}.nombreVoucherify ;;
  }
  dimension: origen {
    type: string
    sql: ${TABLE}.origen ;;
  }
  dimension: paga_referenciado {
    type: number
    sql: ${TABLE}.pagaReferenciado ;;
  }
  dimension: paga_referenciador {
    type: number
    sql: ${TABLE}.pagaReferenciador ;;
  }
  dimension: prefijo_codigo {
    type: string
    sql: ${TABLE}.prefijoCodigo ;;
  }
  measure: count {
    type: count
  }
}
