view: estatus_transacciones_detalle_diario {
  sql_table_name: dbo.EstatusTransaccionesDetalleDiario  ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

    dimension_group: fecha {
      type: time
      timeframes: [raw, date, week, month, month_name, quarter, year]
      convert_tz: no
      datatype: date
      sql: ${TABLE}.Fecha ;;
    }

  dimension: hora {
    type: number
    sql: ${TABLE}.Hora ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: descripcion_estatus {
    type: string
    sql: ${TABLE}.DescripcionEstatus ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: categoria_transaccion {
    type: string
    sql: ${TABLE}.CategoriaTransaccion ;;
  }

  dimension: is_authorized {
    type: number
    sql: ${TABLE}.IS_AUTHORIZED ;;
  }

    ####################################

  measure: transacciones_sum {
    type: sum
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: status {
    type: string
    sql: case when ${TABLE}.IS_AUTHORIZED = '0' then 'Rechazado' else 'Aprobado' end ;;
  }

  dimension: date_txt {
    type: string
    sql: ${TABLE}.Fecha ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  measure: cancelacion {
    type: sum
    hidden: yes
    sql: case when ${TABLE}.IS_AUTHORIZED = '0' then ${TABLE}.Transacciones else '0' end  ;;
  }

  measure: aprobacion {
    type: sum
    hidden: yes
    sql: case when ${TABLE}.IS_AUTHORIZED = '1' then ${TABLE}.Transacciones else '0' end  ;;
  }


  measure: cancelacion_percentge {
    type: number
    label: "% Rechazo"
    value_format: "0.00%"
    sql: convert(decimal(20,2),${cancelacion}) / (convert(decimal(20,2),${cancelacion}) + convert(decimal(20,2),${aprobacion}))  ;;
  }

  dimension: descripcion_estatus_filtro {
    type: string
    label: "Motivo de Rechazo"
    sql: case when ${TABLE}.IS_AUTHORIZED = '0' then ${TABLE}.DescripcionEstatus else '' end ;;
  }
    ####################################




  set: detail {
    fields: [
        id,
  transacciones,
  hora,
  producto,
  descripcion_estatus,
  comercio,
  categoria_transaccion,
  is_authorized
    ]
  }
}
