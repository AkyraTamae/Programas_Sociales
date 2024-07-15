
view: daily_tracking_v2_az {
  derived_table: {
    sql: Select
        A.Fecha As AZ_FechaCorte,
        A.Cantidad As AZ_RegistrosActual,
        B.Cantidad As AZ_RegistrosPrevio,
        A.Tabla As AZ_Nombre,
        A.Base As AZ_DataSet
      From
        dbo.ConteoRegistroTablas A With (Nolock)
      Left Join
        dbo.ConteoRegistroTablas B With (Nolock) On A.Fecha = DATEADD(DAY, 1, B.Fecha) And A.Tabla = B.Tabla And A.Base = B.Base ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: az_fecha_corte {
    type: date
    sql: ${TABLE}.AZ_FechaCorte ;;
  }

  dimension: az_registros_actual {
    type: number
    sql: ${TABLE}.AZ_RegistrosActual ;;
  }

  dimension: az_registros_previo {
    type: number
    sql: ${TABLE}.AZ_RegistrosPrevio ;;
  }

  dimension: az_nombre {
    type: string
    sql: ${TABLE}.AZ_Nombre ;;
  }

  dimension: az_data_set {
    type: string
    sql: ${TABLE}.AZ_DataSet ;;
  }

  set: detail {
    fields: [
        az_fecha_corte,
	az_registros_actual,
	az_registros_previo,
	az_nombre,
	az_data_set
    ]
  }
}
