
view: programas_sociales_mujer_es_vida {
  derived_table: {
    sql: Select
        NumCuenta As 'Numero Cuenta',
        CONVERT(Date,Fecha) As 'Fecha',
        Producto,
        DenMov As 'Descripción',
        ImpTotal As 'Importe',
        AuthorizationCode As 'Autorización',
        RRN
      From
        broxelpaymentsws.PrePayStudioMovements_v With (Nolock)
      Where
        Producto = 'K301' And Fecha >= '2023-06-01' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: numero_cuenta {
    type: string
    label: "Numero Cuenta"
    sql: ${TABLE}."Numero Cuenta" ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: descripcin {
    type: string
    sql: ${TABLE}."Descripción" ;;
  }

  dimension: importe {
    type: string
    sql: ${TABLE}.Importe ;;
  }

  dimension: autorizacin {
    type: string
    sql: ${TABLE}."Autorización" ;;
  }

  dimension: rrn {
    type: string
    sql: ${TABLE}.RRN ;;
  }

  set: detail {
    fields: [
        numero_cuenta,
  fecha,
  producto,
  descripcin,
  importe,
  autorizacin,
  rrn
    ]
  }
}
