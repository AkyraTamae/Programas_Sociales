view: consumo_sr {
  sql_table_name: dbo.Consumo_SR ;;

  dimension: ao {
    type: number
    sql: ${TABLE}."Año" ;;
  }
  dimension: broxel_control {
    type: string
    sql: ${TABLE}.BroxelControl ;;
  }
  dimension: categoria_payments {
    type: string
    sql: ${TABLE}.CategoriaPayments ;;
  }
  dimension: giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }
  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.ImportePesos ;;
  }
  dimension: intercambio {
    type: number
    sql: ${TABLE}.Intercambio ;;
  }
  dimension: mes {
    type: number
    sql: ${TABLE}.Mes ;;
  }
  dimension_group: new_fecha {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.NewFecha ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  measure: count {
    type: count
  }
}
