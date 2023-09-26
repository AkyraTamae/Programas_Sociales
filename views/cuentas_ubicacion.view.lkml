view: cuentas_ubicacion {
  sql_table_name: dbo.CuentasUbicacion ;;

  dimension: cp {
    type: string
    sql: ${TABLE}.CP ;;
  }
  dimension: cuentas {
    type: number
    sql: ${TABLE}.cuentas ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.ESTADO ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.PAIS ;;
  }
  measure: count {
    type: count
  }
}
