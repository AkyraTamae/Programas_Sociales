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
        null As 'RazonSocial'
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

  measure: monto_sum_top_1 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [top_id: "=1"]
    sql: ${TABLE}.Monto ;;
  }

  measure: monto_sum_top_11 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [top_id: "=11"]
    sql: ${TABLE}.Monto ;;
  }

  measure: monto_sum_top_10 {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [top_id: "<11"]
    sql: ${TABLE}.Monto ;;
  }

  measure: amount_percentage {
    type: number
    value_format: "0.00%"
    sql: ${monto_sum_top_10} / ${monto_sum_top_11} ;;
  }

  dimension: nombre_de_medidas_label {
    type: string
    hidden: yes
    sql:
    case
    when ${TABLE}.NombreDeMedidas = 'Equipa Tu Casa' then 'Equipa Tu Casa'
    when ${TABLE}.NombreDeMedidas = 'Mejoravit' then 'Mejoravit'
    when ${TABLE}.NombreDeMedidas = 'Renueva' then 'Renueva'
    when ${TABLE}.NombreDeMedidas = 'Repara' then 'Repara'
    end ;;
  }



  dimension: merchand_top_id_label {
    type: string
    sql: case when ${TABLE}.TopId in ('2','3','4','5','6','7','8','9','10','11') then null else '1' end ;;
  }

  measure: merchand_top_1 {
    type: string
    sql: case when ${merchand_top_id_label} = '1' then ${TABLE}.RazonSocial else '0' end ;;
  }

  measure: descriptivo_mensual_comercios {
    type: string
    #En Enero 2024 el 66.74% de las ventas totales del proyecto Mejoravit se distribuyó entre 10 comercios, siendo Home Depot México el top 1 en ventas y transacciones, con un monto total de $2,246,191.08 (Dos millones doscientos cuarenta y seis mil ciento noventa y un pesos 08/100) y ticket promedio de $3,872.74 (Tres mil ochocientos setenta y dos pesos 74/100)
    sql: concat('En ', ${month_year}, ' el ', format(${amount_percentage}, 'P', 'en-us'), ' de las ventas totales del proyecto ', ${nombre_de_medidas_label}) ;;
    #${fecha_month_name},' ',${fecha_year}
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
