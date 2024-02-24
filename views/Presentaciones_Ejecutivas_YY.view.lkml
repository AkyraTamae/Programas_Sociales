
view: presentaciones_ejecutivas_yy {
  derived_table: {
    sql: --Transacciones Equipa, Renueva
      Select
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
        COUNT(1) As 'Transacciones',
        SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) As 'Monto',
        SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) / COUNT(1) As 'TicketPromedio',
        CONVERT(Decimal(20, 4), (SUM(CONVERT(Decimal(20, 4), A.ImpTotal)) / AA.Monto) -1) As 'ComportamientoMonto',
        CONVERT(Decimal(20, 4), ((SUM(CONVERT(Decimal(20, 4), A.ImpTotal)) / COUNT(1)) / AA.TicketPromedio) -1) As 'ComportamientoTicket',
        Case When (SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) / AA.Monto) < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoMonto',
        Case When ((SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) / COUNT(1)) / AA.TicketPromedio) -1 < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoTicket',
        Case When A.Producto = 'K303' Then 'Equipa_tu_Casa' When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas'
      From
        [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
      Left Join
        (
        Select
          DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
          COUNT(1) As 'Transacciones',
          SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) As 'Monto',
          SUM(CONVERT(Decimal(20, 2), A.ImpTotal)) / COUNT(1) As 'TicketPromedio',
          Case When A.Producto = 'K303' Then 'Equipa_tu_Casa' When A.Producto = 'K281' Then 'Renueva' End As 'NombreDeMedidas'
        From
          [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
        Inner Join
          [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
        Where
          Producto In ('K303','K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
        Group By
          DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
          A.Producto
        )AA On DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) = DATEADD(MONTH,1,AA.Fecha) And Case When A.Producto = 'K303' Then 'Equipa_tu_Casa' When A.Producto = 'K281' Then 'Renueva' End = AA.NombreDeMedidas
      Where
        Producto In ('K303','K281') And CONVERT(Date, A.fecha) >= '2023-01-01' And A.AuthorizationCode Is Not Null And B.comercio Not In ( Select * From [broxelco_rdg].[ComercioNoReportar] Wit (Nolock))
      Group By
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
        A.Producto,
        AA.Monto,
        AA.TicketPromedio
      Union All
      --Transacciones Repara
      Select
        DATETRUNC(MONTH, A.FClear) As 'Fecha',
        COUNT(1) As 'Transacciones',
        SUM(A.ImpTotal) As 'Monto',
        CONVERT(Decimal(20, 2), SUM(A.ImpTotal) / COUNT(1)) As 'TicketPromedio',
        CONVERT(Decimal(20, 4), (SUM(A.ImpTotal) / AA.Monto) -1) As 'ComportamientoMonto',
        CONVERT(Decimal(20, 4), ((SUM(A.ImpTotal) / COUNT(1)) / AA.TicketPromedio) -1) As 'ComportamientoTicket',
        Case When (SUM(A.ImpTotal) / AA.Monto) -1 < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoMonto',
        Case When ((SUM(A.ImpTotal) / COUNT(1)) / AA.TicketPromedio) -1 < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoTicket',
          'Repara' As 'NombreDeMedidas'
      From
        [broxelco_rdg].[ind_movimientos] A With (Nolock)
      Inner Join
        [broxelco_rdg].[Comercio] B On DenMov = Comercio
      Left Join
        (
        Select
          DATETRUNC(MONTH, A.FClear) As 'Fecha',
          COUNT(1) As 'Transacciones',
          SUM(A.ImpTotal) As 'Monto',
          CONVERT(Decimal(20, 2), SUM(A.ImpTotal) / COUNT(1)) As 'TicketPromedio',
          'Repara' As 'NombreDeMedidas'
        From
          [broxelco_rdg].[ind_movimientos] A With (Nolock)
        Inner Join
          [broxelco_rdg].[Comercio] B On DenMov = Comercio
        Where
          A.CodPtoCuota = 'K671' And CONVERT(Date,A.FClear) >= '2023-01-01' And B.comercio Not In(Select * From [broxelco_rdg].[ComercioNoReportar] With (Nolock))
        Group By
          DATETRUNC(MONTH, A.FClear),
          MONTH(A.FClear)
        )AA On DATETRUNC(MONTH, A.FClear) = DATEADD(MONTH,1,AA.Fecha)
      Where
        A.CodPtoCuota = 'K671' And CONVERT(Date,A.FClear) >= '2023-01-01' And B.comercio Not In(Select * From [broxelco_rdg].[ComercioNoReportar] With (Nolock))
      Group By
        DATETRUNC(MONTH, A.FClear),
        MONTH(A.FClear),
        AA.Monto,
        AA.TicketPromedio
      Union All
       --Transacciones Mejoravit
      Select
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) As 'Fecha',
        COUNT(1) As 'Transacciones',
        SUM(A.Monto) As 'Monto',
        CONVERT(Decimal(20, 2), SUM(A.Monto) / COUNT(1)) As 'TicketPromedio',
        CONVERT(Decimal(20, 4), (SUM(A.Monto) / AA.Monto) -1) As 'ComportamientoMonto',
        CONVERT(Decimal(20, 4), ((SUM(A.Monto) / COUNT(1)) / AA.TicketPromedio) -1) As 'ComportamientoTicket',
        Case When (SUM(A.Monto) / AA.Monto) -1 < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoMonto',
        Case When ((SUM(A.Monto) / COUNT(1)) / AA.TicketPromedio) -1 < 0 Then 'decremento' Else 'incremento' End As 'EstatusComportamientoTicket',
        'Mejoravit' As 'Nombre_de_Medidas'
      From
        [dev_originacion].[mejoravit_transacciones] A With (Nolock)
      Left Join
        (
        Select
          DATETRUNC(MONTH, CONVERT(Date, Fecha)) As 'Fecha',
          COUNT(1) As 'Transacciones',
          SUM(Monto) As 'Monto',
          SUM(Monto) / COUNT(1) As 'TicketPromedio',
          'Mejoravit' As 'Nombre_de_Medidas'
        From
          [dev_originacion].[mejoravit_transacciones] With (Nolock)
        Where
          CONVERT(Date,Fecha) >= '2023-01-01'
        Group By
          DATETRUNC(MONTH, CONVERT(Date,Fecha))
        )AA On DATETRUNC(MONTH, CONVERT(Date, A.Fecha)) = DATEADD(MONTH, 1, AA.Fecha)
      Where
        CONVERT(Date, A.Fecha) >= '2023-01-01'
      Group By
        DATETRUNC(MONTH, CONVERT(Date, A.Fecha)),
        AA.Monto,
        AA.TicketPromedio ;;
  }

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
    value_format: "$#,##0"
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: monto {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }

  dimension: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.TicketPromedio ;;
  }

  dimension: comportamiento_monto {
    type: number
    value_format: "0.00%"
    sql: abs(${TABLE}.ComportamientoMonto) ;;
  }

  dimension: comportamiento_ticket {
    type: number
    value_format: "0.00%"
    sql: abs(${TABLE}.ComportamientoTicket) ;;
  }

  dimension: estatus_comportamiento_monto {
    type: string
    sql: ${TABLE}.EstatusComportamientoMonto ;;
  }

  dimension: estatus_comportamiento_ticket {
    type: string
    sql: ${TABLE}.EstatusComportamientoTicket ;;
  }

  dimension: nombre_de_medidas {
    type: string
    sql: ${TABLE}.NombreDeMedidas ;;
  }

  ####################################

  dimension: month_name {
    type: string
    sql:
    case
    when month(${fecha_date}) = 1 then 'Enero'
    when month(${fecha_date}) = 2 then'Febrero'
    when month(${fecha_date}) = 3 then'Marzo'
    when month(${fecha_date}) = 4 then'Abril'
    when month(${fecha_date}) = 5 then 'Mayo'
    when month(${fecha_date}) = 6 then 'Junio'
    when month(${fecha_date}) = 7 then 'Julio'
    when month(${fecha_date}) = 8 then 'Agosto'
    when month(${fecha_date}) = 9 then 'Septiembre'
    when month(${fecha_date}) = 10 then 'Octubre'
    when month(${fecha_date}) = 11 then 'Noviembre'
    when month(${fecha_date}) = 12 then 'Diciembre'
    end ;;
  }

  measure: descriptivo_mensual {
    type: string
    sql: concat('En el mes de ', ${month_name},' ',${fecha_year},' se registró un total de ', format(${transacciones}, 'N0', 'en-us'), ' transacciones y un volumen de facturación de ', format(${monto},'C', 'en-us'), '. Las ventas presentaron un ',  ${estatus_comportamiento_monto},' del ', format(${comportamiento_monto}, 'P', 'en-us'), ' con relación al mes anterior. El Ticket Promedio global presentó un ', ${estatus_comportamiento_ticket}, ' del ', format(${comportamiento_ticket}, 'P', 'en-us'), ' con relación al mes anterior.' ) ;;
  }

  measure: descriptivo_mensual_2{
    type: string
    sql: concat('El Ticket Promedio de compra general de todos los comercios del proyecto ', ${nombre_de_medidas}, ' en ', ${month_name},' ',${fecha_year}, ' fue de ', format(${ticket_promedio},'C', 'en-us'), '.') ;;
  }


  ####################################

  set: detail {
    fields: [
      transacciones,
      monto,
      ticket_promedio,
      comportamiento_monto,
      comportamiento_ticket,
      estatus_comportamiento_monto,
      estatus_comportamiento_ticket,
      nombre_de_medidas
    ]
  }
}
