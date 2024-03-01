view: presentaciones_ejecutivas_yy_v2 {
  sql_table_name: dbo.PresentacionesEjecutivasYY ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha {
    type: time
    timeframes: [date, month_name, month_num, year]
    sql: ${TABLE}.Fecha ;;
  }

  dimension: transacciones {
    type: number
    hidden: yes
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: transacciones_previo {
    type: number
    hidden: yes
    sql: ${TABLE}.TransaccionesPrevio ;;
  }

  dimension: monto {
    type: number
    hidden: yes
    sql: ${TABLE}.Monto ;;
  }

  dimension: monto_previo {
    type: number
    hidden: yes
    sql: ${TABLE}.MontoPrevio ;;
  }

  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: estado_comercial {
    type: string
    sql: ${TABLE}.Estado_Comercial ;;
  }

  ####################################

  dimension: month_name {
    type: string
    order_by_field: fecha_date
    sql:
    case
    when month(${fecha_date}) = 1 then concat('Enero ', ${fecha_year})
    when month(${fecha_date}) = 2 then concat('Febrero ', ${fecha_year})
    when month(${fecha_date}) = 3 then concat('Marzo ', ${fecha_year})
    when month(${fecha_date}) = 4 then concat('Abril ', ${fecha_year})
    when month(${fecha_date}) = 5 then concat('Mayo ', ${fecha_year})
    when month(${fecha_date}) = 6 then concat('Junio ', ${fecha_year})
    when month(${fecha_date}) = 7 then concat('Julio ', ${fecha_year})
    when month(${fecha_date}) = 8 then concat('Agosto ', ${fecha_year})
    when month(${fecha_date}) = 9 then concat('Septiembre ', ${fecha_year})
    when month(${fecha_date}) = 10 then concat('Octubre ', ${fecha_year})
    when month(${fecha_date}) = 11 then concat('Noviembre ', ${fecha_year})
    when month(${fecha_date}) = 12 then concat('Diciembre ', ${fecha_year})
    end  ;;
  }

  measure: transacciones_sum {
    type: sum
    value_format: "#,##0"
    sql: ${transacciones} ;;
  }

  measure: transacciones_previo_max  {
    type: max
    value_format: "#,##0"
    sql: ${TABLE}.TransaccionesPrevio ;;
  }

  measure: monto_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto} ;;
  }

  measure: monto_previo_max {
    type: max
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoPrevio ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: sum(${TABLE}.Monto) / sum(${TABLE}.Transacciones) ;;
  }

  measure: ticket_promedio_previo {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: max(${TABLE}.MontoPrevio) / max(${TABLE}.TransaccionesPrevio) ;;
  }

  measure: month_over_month_monto {
    type: number
    value_format: "0.00%"
    sql: (sum(${TABLE}.Monto) / max(${TABLE}.MontoPrevio)) -1 ;;
  }

  measure: month_over_month_ticket {
    type: number
    value_format: "0.00%"
    sql: (${ticket_promedio} / ${ticket_promedio_previo}) -1 ;;
  }

  measure: estatus_mom_monto {
    type: string
    sql: case when ${month_over_month_monto} < 0 then 'decremento' else 'incremento' end ;;
  }

  measure: estatus_mom_ticket {
    type: string
    sql: case when ${month_over_month_ticket} < 0 then 'decremento' else 'incremento' end ;;
  }

  measure: descriptivo_mensual {
    type: string
    sql: concat('En el mes de ', ${month_year}, ' se registró un total de ', format(${transacciones_sum}, 'N0', 'en-us'), ' transacciones y un volumen de facturación de ', format(${monto_sum},'C', 'en-us'), '. Las ventas presentaron un ',  ${estatus_mom_monto},' del ', format(abs(${month_over_month_monto}), 'P', 'en-us'), ' con relación al mes anterior. El Ticket Promedio global presentó un ', ${estatus_mom_ticket}, ' del ', format(abs(${month_over_month_ticket}), 'P', 'en-us'), ' con relación al mes anterior.' ) ;;
  #${fecha_month_name},' ',${fecha_year}
  }
#Fecha agrupada en formato MMMM YYYY#
  dimension: month_year {
    type: string
    order_by_field: fecha_date
    sql:
    case
    when month(max(${fecha_date})) = 1 then concat('Enero ', max(${fecha_year}))
    when month(max(${fecha_date})) = 2 then concat('Febrero ', max(${fecha_year}))
    when month(max(${fecha_date})) = 3 then concat('Marzo ', max(${fecha_year}))
    when month(max(${fecha_date})) = 4 then concat('Abril ', max(${fecha_year}))
    when month(max(${fecha_date})) = 5 then concat('Mayo ', max(${fecha_year}))
    when month(max(${fecha_date})) = 6 then concat('Junio ', max(${fecha_year}))
    when month(max(${fecha_date})) = 7 then concat('Julio ', max(${fecha_year}))
    when month(max(${fecha_date})) = 8 then concat('Agosto ', max(${fecha_year}))
    when month(max(${fecha_date})) = 9 then concat('Septiembre ', max(${fecha_year}))
    when month(max(${fecha_date})) = 10 then concat('Octubre ', max(${fecha_year}))
    when month(max(${fecha_date})) = 11 then concat('Noviembre ', max(${fecha_year}))
    when month(max(${fecha_date})) = 12 then concat('Diciembre ', max(${fecha_year}))
    end  ;;
  }


  ####################################



  set: detail {
    fields: [
        transacciones,
  transacciones_previo,
  monto,
  monto_previo,
  nombre_de_medidas,
  razon_social,
  rfc,
  estado_comercial
    ]
  }
}
