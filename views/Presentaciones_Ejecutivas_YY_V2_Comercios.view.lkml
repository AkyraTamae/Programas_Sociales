view: presentaciones_ejecutivas_yy_v2_comercios {
  derived_table: {
    sql: Select
        A.*
      From
        (
        Select
          ROW_NUMBER()Over(Partition By CONCAT(NombreDeMedidas,Fecha) Order By SUM(Monto) Desc) As 'TopId',
          Fecha,
          SUM(Transacciones) As 'Transacciones',
          SUM(Monto) As 'Monto',
          NombreDeMedidas,
          RazonSocial
        From
          dbo.PresentacionesEjecutivasYY
        Group By
          Fecha,
          NombreDeMedidas,
          RazonSocial
        )A
      Where A.TopId <= '10'
      Union All
      Select
        '11' As 'TopId',
        Fecha,
        SUM(Transacciones) As 'Transacciones',
        SUM(Monto) As 'Monto',
        NombreDeMedidas,
        Null As 'RazonSocial'
      From
        dbo.PresentacionesEjecutivasYY
      Group By
        Fecha,
        NombreDeMedidas ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: top_id {
    type: number
    sql: ${TABLE}.TopId ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }

  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }

  ####################################

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

  measure: monto_sum_top_10 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: case when ${TABLE}.TopId = '11' then null else ${monto} end ;;
  }

  measure: monto_sum_top_1 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: case when ${TABLE}.TopId = '1' then ${monto} else null end ;;
  }

  measure: monto_sum_top_11 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: case when ${TABLE}.TopId = '11' then ${monto} else null end ;;
  }

  measure: mount_percentage {
    type: number
    value_format: "0.00%"
    sql: ${monto_sum_top_10} / ${monto_sum_top_11} ;;
  }


  ####################################

  set: detail {
    fields: [
      top_id,
      transacciones,
      monto,
      nombre_de_medidas,
      razon_social
    ]
  }
}
