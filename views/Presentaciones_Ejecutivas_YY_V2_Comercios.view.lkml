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
