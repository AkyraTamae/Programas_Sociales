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

  dimension: fecha {
    type: date
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

  set: detail {
    fields: [
      top_id,
      fecha,
      transacciones,
      monto,
      nombre_de_medidas,
      razon_social
    ]
  }
}
