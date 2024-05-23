view: conteo_registro_tablas  {
  derived_table: {
    sql: Select
        A.Fecha As 'FechaCorte',
        B.Fecha As 'FechaCorte_1',
        A.Tabla As 'Nombre',
        A.Cantidad As 'TotalRegistros',
        B.Cantidad As 'TotalRegistrosPrevio'
      From
        dbo.ConteoRegistroTablas A
      Left Join
        dbo.ConteoRegistroTablas B On A.Fecha = DATEADD(DAY, 1, B.Fecha) And A.Tabla = B.Tabla ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha_corte {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaCorte ;;
  }

  dimension_group: fecha_corte_1 {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    label: "Fecha Corte -1"
    sql: ${TABLE}.FechaCorte_1 ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension: total_registros {
    type: number
    sql: ${TABLE}.TotalRegistros ;;
  }

  dimension: total_registros_previo {
    type: number
    sql: ${TABLE}.TotalRegistrosPrevio ;;
  }

  set: detail {
    fields: [
      nombre,
      total_registros,
      total_registros_previo
    ]
  }
}
