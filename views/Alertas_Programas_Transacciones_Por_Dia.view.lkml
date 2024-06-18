view: alertas_programas_transacciones_por_dia {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.AlertasProgramasTransaccionesPorDia` ;;

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: intercambio_transaccional_mo_m {
    type: number
    value_format: "0.00%;-0.00%"
    sql: ${TABLE}.IntercambioTransaccionalMoM ;;
  }
  dimension_group: mes_actual {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MesActual ;;
  }
  dimension: monto_diario {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoDiario ;;
  }
  dimension: monto_mensual {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMensual ;;
  }
  dimension: monto_mes_previo {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMesPrevio ;;
  }
  dimension: nombre_de_medida {
    type: string
    sql: ${TABLE}.NombreDeMedida ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  dimension: transacciones_diarias {
    type: number
    sql: ${TABLE}.TransaccionesDiarias ;;
  }
  dimension: transacciones_mensual {
    type: number
    sql: ${TABLE}.TransaccionesMensual ;;
  }
  dimension: transacciones_mes_previo {
    type: number
    sql: ${TABLE}.TransaccionesMesPrevio ;;
  }
  measure: count {
    type: count
  }

#Comercios que aumentaron su volumen de ventas un 20% o más versus el mes anterior.
#Comercios que realicen 30 o más transacciones en una hora.
#Comercios que realicen más de 100 transacciones por día.




}
