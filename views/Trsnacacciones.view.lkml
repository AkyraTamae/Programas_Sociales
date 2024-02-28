
view: trsnacacciones {
  derived_table: {
    sql: Select
        COUNT(1) As 'Transacciones',
        DATETRUNC(MONTH, CONVERT(Date, A.LOCAL_DATE)) As 'Fecha',
        C.[DESCRIPTION] As 'DescripcionEstatus',
        D.descripcion As 'CategoriaTransaccion',
        C.IS_AUTHORIZED
      From
        [paystudio].[AU_OPEN_TRANSACTION] A With (Nolock)
      Left Join
        [paystudio].[AU_RESPONSE_CODE] C With (Nolock) On A.ID_RESPONSE_CODE = C.ID_RESPONSE_CODE
      Left Join
        [paystudio].[CatalogoTransacciones] D With (Nolock) On A.TRANSACTION_TYPE = D.Id
      Where
        YEAR(CONVERT(Date, A.LOCAL_DATE)) >= '2023'
      Group By
        DATETRUNC(MONTH, CONVERT(Date, A.LOCAL_DATE)),
        C.[DESCRIPTION],
        D.descripcion,
        C.IS_AUTHORIZED
      Union All
      Select
        COUNT(1) As 'Transacciones',
        DATETRUNC(MONTH, A.FClear) As 'Fecha',
        'AUTHORIZED' As 'DescripcionEstatus',
        D.CategoriaTransaccion,
        '1' As 'IS_AUTHORIZED'
      From
        [broxelco_rdg].[ind_movimientos] A With (Nolock)
      Left Join
        [broxelco_rdg].[CatalogoTipoTransaccion] D With (Nolock) On A.CodTransac = D.CodigoTransaccional
      Where
        YEAR(A.FClear) >= '2023'
      Group By
        DATETRUNC(MONTH, A.FClear),
        D.CategoriaTransaccion
      Union All
      Select
        COUNT(1) As 'Transacciones',
        DATETRUNC(MONTH, Fecha) As 'Fecha',
        'Unknow' As 'DescripcionEstatus',
        Null As 'CategoriaTransaccion',
        '0' As 'IS_AUTHORIZED'
      From
        [broxelco_rdg].[ind_rechazos]
      Where
        YEAR(Fecha) >= '2023'
      Group By
        DATETRUNC(MONTH, Fecha) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: descripcion_estatus {
    type: string
    sql: ${TABLE}.DescripcionEstatus ;;
  }

  dimension: categoria_transaccion {
    type: string
    sql: ${TABLE}.CategoriaTransaccion ;;
  }

  dimension: is_authorized {
    type: number
    sql: ${TABLE}.IS_AUTHORIZED ;;
  }

  measure: transacciones_sum {
    type: sum
    sql: ${TABLE}.Transacciones ;;
  }

  set: detail {
    fields: [
        transacciones,
  descripcion_estatus,
  categoria_transaccion,
  is_authorized
    ]
  }
}
