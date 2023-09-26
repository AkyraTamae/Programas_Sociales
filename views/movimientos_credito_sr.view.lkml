view: movimientos_credito_sr {
  sql_table_name: dbo.MovimientosCreditoSR ;;

  dimension: authorization_code {
    type: string
    sql: ${TABLE}.AuthorizationCode ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: den_mov {
    type: string
    sql: ${TABLE}.DenMov ;;
  }
  dimension: fecha_liquidacion {
    type: string
    sql: ${TABLE}.FechaLiquidacion ;;
  }
  dimension: fecha_origen {
    type: string
    sql: ${TABLE}.FechaOrigen ;;
  }
  dimension: imp_total {
    type: number
    sql: ${TABLE}.ImpTotal ;;
  }
  dimension: mask_card {
    type: string
    sql: ${TABLE}.MaskCard ;;
  }
  dimension: moneda {
    type: string
    sql: ${TABLE}.Moneda ;;
  }
  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.NombreTitular ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }
  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  measure: count {
    type: count
  }
}
