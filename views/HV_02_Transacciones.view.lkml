
view: hv_02_transacciones {
  derived_table: {
    sql: Select
        A.IdMovimiento,
        B.Programa,
        A.Producto,
        A.Cuenta,
        A.Autorizacion,
        A.Fecha As 'FechaMovimiento',
        A.Monto As 'MontoMovimiento',
        A.Comercio,
        A.RazonSocial,
        A.RFC,
        Case
        When A.Comercio = '23CBX00958' Then 'Hidalgo'
        When A.Comercio = '23CBX00980' Then 'Jalisco'
        When A.EstadoComercial Like '%cdmx%' Or estadoComercial Like '%ciudad de m%' Or estadoComercial Like '%CIUDAD DE M%' Or estadoComercial Like '%FEDERAL%' Or estadoComercial Like '%D.F.%' Or estadoComercial Like '%DF%' Or estadoComercial Like '%CMDX%' Then 'Distrito Federal'
        When A.EstadoComercial Like '%xico%' Or estadoComercial Like '%Edo. Méx' Or estadoComercial Like '%EDO MEX%' Or estadoComercial = 'MEX' Or estadoComercial = 'MEX.' Or estadoComercial Like '%Edo. Mex.%'  Then 'México'
        When A.EstadoComercial Like '%uebl%' Then 'Puebla'
        When A.EstadoComercial Like '%guerr%' Then 'Guerrero'
        When A.EstadoComercial Like '%quer%' Then 'Querétaro'
        When A.EstadoComercial Like '%nuevo le%' Or estadoComercial Like '%nuevo le%' Or estadoComercial Like '%NUENO LEON%' Then 'Nuevo León'
        When A.EstadoComercial = 'Baja California' Or estadoComercial = 'Baja California ' Or estadoComercial = 'BAJA CALIFORNA ' Or estadoComercial = 'Baja California Norte ' Or estadoComercial = 'BAJA CALIFORNIA NORTE' Then 'Baja California'
        When A.EstadoComercial Like '%sur%' Then 'Baja California Sur'
        When A.EstadoComercial Like '%campech%' Then 'Campeche'
        When A.EstadoComercial Like '%chiap%' Then 'Chiapas'
        When A.EstadoComercial Like '%aulipa%' Then 'Tamaulipas'
        When A.EstadoComercial Like '%jalis%' Then 'Jalisco'
        When A.EstadoComercial Like '%sonor%' Then 'Sonora'
        When A.EstadoComercial Like '%naya%' Then 'Nayarit'
        When A.EstadoComercial Like '%micho%' Then 'Michoacán de Ocampo'
        When A.EstadoComercial Like '%potos%' Then 'San Luis Potosí'
        When A.EstadoComercial Like '%oahu%' Then 'Coahuila de Zaragoza'
        When A.EstadoComercial Like '%vera%' Then 'Veracruz de Ignacio de la Llave'
        When A.EstadoComercial Like '%yuca%' Then 'Yucatán'
        When A.EstadoComercial Like '%more%' Then 'Morelos'
        When A.EstadoComercial Like '%chih%' Then 'Chihuahua'
        When A.EstadoComercial Like '%zaca%' Then 'Zacatecas'
        When A.EstadoComercial Like '%guana%' Then 'Guanajuato'
        When A.EstadoComercial Like '%roo%' Then 'Quintana Roo'
        When A.EstadoComercial Like '%coli%' Then 'Colima'
        When A.EstadoComercial Like '%aguas%' Then 'Aguascalientes'
        When A.EstadoComercial Like '%oax%' Then 'Oaxaca'
        When A.EstadoComercial Like '%sina%' Then 'Sinaloa'
        When A.EstadoComercial Like '%chia%' Then 'Chiapas'
        When A.EstadoComercial Like '%dura%' Then 'Durango'
        When A.EstadoComercial Like '%hidal%' Then 'Hidalgo'
        When A.EstadoComercial Like '%tlax%' Then 'Tlaxcala'
        When A.EstadoComercial Like '%taba%' Then 'Tabasco'
        Else 'México'
        End As 'Estado_Comercial'
      From
        dev_originacion.transacciones A With (Nolock)
      Inner Join
        dev_originacion.creditos B With (Nolock) On A.Cuenta = B.Cuenta
      Where
        A.Producto = 'K171' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.IdMovimiento ;;
  }

  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: autorizacion {
    type: string
    sql: ${TABLE}.Autorizacion ;;
  }

  dimension_group: fecha_movimiento {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaMovimiento ;;
  }

  dimension: monto_movimiento {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMovimiento ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
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

  ############################################3

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.Estado_Comercial ;;
  }

  measure: monto_movimiento_sum {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMovimiento ;;
  }

  measure: ticket_promedio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${monto_movimiento_sum} / ${count} ;;
  }

  set: detail {
    fields: [
        id_movimiento,
  programa,
  producto,
  cuenta,
  autorizacion,
  monto_movimiento,
  comercio,
  razon_social,
  rfc,
  estado_comercial
    ]
  }
}
