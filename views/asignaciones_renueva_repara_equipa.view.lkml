view: asignaciones_renueva_repara_equipa {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.AsignacionesRenuevaReparaEquipa` ;;

  dimension_group: fecha_ejecucion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaEjecucion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension_group: mes_ejecucion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MesEjecucion ;;
  }
  dimension_group: mes_insercion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MesInsercion ;;
  }
  dimension: monto_credito {
    type: number
    sql: ${TABLE}.MontoCredito ;;
  }
  dimension: nombre_completo {
    type: string
    sql: ${TABLE}.NombreCompleto ;;
  }
  dimension: notas {
    type: string
    sql: ${TABLE}.Notas ;;
  }
  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }
  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }
  dimension: tipo_credito {
    type: string
    sql: ${TABLE}.TipoCredito ;;
  }
  measure: count {
    type: count
  }
}
