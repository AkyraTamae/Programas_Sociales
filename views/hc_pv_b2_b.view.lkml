view: hc_pv_b2_b {
  sql_table_name: dbo.HC_PV_B2B ;;

  dimension: cargo {
    type: string
    sql: ${TABLE}.Cargo ;;
  }
  dimension: correo_ejecutivo {
    type: string
    sql: ${TABLE}.CorreoEjecutivo ;;
  }
  dimension: ejecutivo {
    type: string
    sql: ${TABLE}.Ejecutivo ;;
  }
  dimension: equipo {
    type: string
    sql: ${TABLE}.Equipo ;;
  }
  measure: count {
    type: count
  }
}
