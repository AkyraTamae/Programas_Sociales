
view: trsnacacciones {
  derived_table: {
    sql: --Transacciones Rechazadas Credencial
      Select
          COUNT(1) As Transacciones,
          0 As Importe,
          Fecha,
          CAST(EXTRACT(Hour From Hora) As Int) As Hora,
          Producto,
          DescCodigoRechazo As DESCRIPTION_RESPONSE_CODE,
          Case When REGEXP_EXTRACT(NombreComercio, r'([^ ]+ +[^ ]+)') Is Null Then NombreComercio Else SUBSTR(NombreComercio, 1, STRPOS(NombreComercio, '  ')) End As Comercio,
          'Unknow' As CategoriaTransaccion,
          0 As IS_AUTHORIZED,
          'Credencial' As Procesador
      From
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ind_rechazos`
      Where
          Fecha >= '2023-01-01'
      Group By
          Fecha,
          CAST(EXTRACT(Hour From Hora) As Int),
          Producto,
          DescCodigoRechazo,
          Case When REGEXP_EXTRACT(NombreComercio, r'([^ ]+ +[^ ]+)') Is Null Then NombreComercio Else SUBSTR(NombreComercio, 1, STRPOS(NombreComercio, '  ')) End

      Union All
      --Transacciones Aprobadas Credencial
      Select
          COUNT(1) As Transacciones,
          SUM(A.ImpTotal) As Importe,
          A.FClear As Fecha,
          Case When Left(A.Hora, 2) = '' Then 0 Else CAST(Left(A.Hora, 2) As Int) End As Hora,
          A.CodPtoCuota As Producto,
          'AUTHORIZED' As DESCRIPTION_RESPONSE_CODE,
          Case When B.Razon_Social Is Null Then (Case When A.DenMov Is Null Then A.Comercio_Pais Else A.DenMov End) Else B.Razon_Social End As Comercio,
          D.CategoriaTransaccion,
          1 As IS_AUTHORIZED,
          'Credencial' As Procesador
      From
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.ind_movimientos` A
      Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio` B On A.DenMov = B.Comercio
      Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.CatalogoTipoTransaccion` D On CAST(A.CodTransac As Numeric) = D.CodigoTransaccional
      Where
          A.FClear >= '2023-01-01'
      Group By
          A.FClear,
          Case When Left(A.Hora, 2) = '' Then 0 Else CAST(Left(A.Hora, 2) As Int) End,
          A.CodPtoCuota,
          Case When B.Razon_Social Is Null Then (Case When A.DenMov Is Null Then A.Comercio_Pais Else A.DenMov End) Else B.Razon_Social End,
          D.CategoriaTransaccion
      Union All
      --Transacciones PayStudio
      Select
          COUNT(1) As Transacciones,
          SUM(CAST(A.MESSAGE_AMNT As Decimal)) As Importe,
          CAST(A.TRANSACTION_DATE As Date) As Fecha,
          EXTRACT(Hour From A.TRANSACTION_DATE) As Hora,
          C.Producto,
          D.DESCRIPTION As DESCRIPTION_RESPONSE_CODE,
          Case When E.Razon_Social Is Null Then (Case When A.CARD_ACCEPTOR_NAME Is Null Then A.ID_MESSAGE_CHANNEL Else A.CARD_ACCEPTOR_NAME End) Else E.Razon_Social End As Comercio,
          F.descripcion As DESCRIPTION_TRANSACTION_TYPE,
          D.IS_AUTHORIZED,
          'PayStudio' As Procesador
      From
          `mgcp-10078073-bxl-dwh-prod.stg_brx_aas.AU_OPEN_TRANSACTION` A
      Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_brx_aas.AUI_TRX_ISSUER_DATA` B On A.ID_TRANSACTION = B.ID_TRANSACTION
      Left Join
          `mgcp-10078073-bxl-dwh-prod.bi_paystudio.Productos` C On B.ID_PRODUCT = C.Id
      Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_brx_aas.AU_RESPONSE_CODE` D On A.ID_RESPONSE_CODE = D.ID_RESPONSE_CODE
      Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.Comercio` E On A.CARD_ACCEPTOR_NAME = E.Comercio
      Left Join
          `mgcp-10078073-bxl-dwh-prod.bi_paystudio.CatalogoTransacciones` F On A.TRANSACTION_TYPE = F.Id
      Where
          CAST(A.TRANSACTION_DATE As Date) >= '2023-01-01'
      Group By
          CAST(A.TRANSACTION_DATE As Date),
          EXTRACT(Hour From A.TRANSACTION_DATE),
          C.Producto,
          D.DESCRIPTION,
          Case When E.Razon_Social Is Null Then (Case When A.CARD_ACCEPTOR_NAME Is Null Then A.ID_MESSAGE_CHANNEL Else A.CARD_ACCEPTOR_NAME End) Else E.Razon_Social End,
          F.descripcion,
          D.IS_AUTHORIZED ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: importe {
    type: number
    sql: ${TABLE}.Importe ;;
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

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  ####################################

  measure: transacciones_sum {
    type: sum
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: status {
    type: string
    sql: case when ${TABLE}.IS_AUTHORIZED = 0 then 'Rechazado' else 'Aprobado' end ;;
  }

  dimension: date_txt {
    type: string
    order_by_field: fecha_date
    sql: ${TABLE}.Fecha ;;
    html: {{ rendered_value | date: "%B %e %Y" }};;
  }

  dimension: month_txt {
    type: string
    sql: date_trunc(${TABLE}.Fecha, month) ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  measure: cancelacion {
    type: sum
    hidden: yes
    sql: case when ${TABLE}.IS_AUTHORIZED = 0 then ${TABLE}.Transacciones else 0 end  ;;
  }

  measure: aprobacion {
    type: sum
    hidden: yes
    sql: case when ${TABLE}.IS_AUTHORIZED = 1 then ${TABLE}.Transacciones else 0 end  ;;
  }

  measure: importe_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Importe ;;
  }


  measure: cancelacion_percentge {
    type: number
    label: "% Rechazo"
    value_format: "0.00%"
    sql: cast(${cancelacion} as numeric) / (cast(${cancelacion} as numeric) + cast(${aprobacion} as numeric))  ;;
  }

  dimension: descripcion_estatus_filtro {
    type: string
    label: "Motivo de Rechazo"
    sql: case when ${TABLE}.IS_AUTHORIZED = 0 then ${TABLE}.DescripcionEstatus else '' end ;;
  }


  ####################################

  set: detail {
    fields: [
        transacciones,
  importe,
  hora,
  producto,
  descripcion_estatus,
  comercio,
  categoria_transaccion,
  is_authorized,
  procesador
    ]
  }
}
