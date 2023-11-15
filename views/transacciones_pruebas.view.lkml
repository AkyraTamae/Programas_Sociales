
view: transacciones_pruebas {
  derived_table: {
    sql: Select *
      From
        recursos.AnalisisClientes ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: fecha_corte {
    type: date
    sql: ${TABLE}.Fecha_Corte ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: importe_pesos {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Importe_Pesos ;;
  }

  dimension: monto_intercambio {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Intercambio ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.Clasificacion_Cliente ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  dimension: estado {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.Estado ;;
  }

  dimension: country_id {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country_Id ;;
  }

  dimension: edad {
    type: number
    sql: ${TABLE}.Edad ;;
  }

  dimension: sexo {
    type: string
    sql: ${TABLE}.Sexo ;;
  }

  dimension: Giro {
    type: string
    sql: ${TABLE}.Giro ;;
  }

  measure: AVG_Impote_Pesos{
    type: average
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_pesos ;;
  }

  measure: AVG_Transacciones{
    type: average
    value_format: "#,##0;-#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  measure: Clientes_Unicos{
    type: count_distinct
    value_format: "#,##0;-#,##0"
    sql: ${TABLE}.clave_cliente ;;
  }

  measure: Total_Cuentas{
    type: sum
    value_format: "#,##0;-#,##0"
    sql: ${TABLE}.cuentas ;;
  }

  measure: Total_Transacciones{
    type: sum
    value_format: "#,##0;-#,##0"
    sql: ${TABLE}.transacciones ;;
  }

  measure: Total_Importe_Pesos{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.importe_pesos ;;
  }

  measure: Total_Monto_Intercambio{
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.monto_intercambio ;;
  }

  dimension:  Layer_MX{
    type: string
    map_layer_name: mexico_layer
    sql:
      Case
      When Estado = 'Aguascalientes' Then 'Aguascalientes'
      When Estado = 'Baja California' Then 'Baja California'
      When Estado = 'Baja California Sur' Then 'Baja California Sur'
      When Estado = 'Campeche' Then 'Campeche'
      When Estado = 'Ciudad de Mexico' Then 'Distrito Federal'
      When Estado = 'Chiapas' Then 'Chiapas'
      When Estado = 'Chihuahua' Then 'Chihuahua'
      When Estado = 'Coahuila de Zaragoza' Then 'Coahuila'
      When Estado = 'Colima' Then 'Colima'
      When Estado = 'Durango' Then 'Durango'
      When Estado = 'Mexico' Then 'Estado de Mexico'
      When Estado = 'Guerrero' Then 'Guerrero'
      When Estado = 'Guanajuato' Then 'Guanajuato'
      When Estado = 'Hidalgo' Then 'Hidalgo'
      When Estado = 'Jalisco' Then 'Jalisco'
      When Estado = 'Michoacan de Ocampo' Then 'Michoacán de Ocampo'
      When Estado = 'Morelos' Then 'Morelos'
      When Estado = 'Nayarit' Then 'Nayarit'
      When Estado = 'Nuevo Leon' Then 'Nuevo Leon'
      When Estado = 'Oaxaca' Then 'Oaxaca'
      When Estado = 'Puebla' Then 'Puebla'
      When Estado = 'Queretaro' Then 'Queretaro'
      When Estado = 'Quintana Roo' Then 'Quintana Roo'
      When Estado = 'San Luis Potosi' Then 'San Luis Potosí'
      When Estado = 'Sinaloa' Then 'Sinaloa'
      When Estado = 'Sonora' Then 'Sonora'
      When Estado = 'Tabasco' Then 'Tabasco'
      When Estado = 'Tamaulipas' Then 'Tamaulipas'
      When Estado = 'Tlaxcala' Then 'Tlaxcala'
      When Estado = 'Veracruz de Ignacio de la Llave' Then 'Veracruz de Ignacio de la Llave'
      When Estado = 'Yucatan' Then 'Yucatán'
      When Estado = 'Zacatecas' Then 'Zacatecas'
      Else 'unknown' End;;
    }



  set: detail {
    fields: [
        id,
  fecha_corte,
  producto,
  clave_cliente,
  importe_pesos,
  monto_intercambio,
  transacciones,
  cuentas,
  comercio,
  clasificacion_cliente,
  tipo_movimiento,
  procesador,
  estado,
  country_id,
  edad,
  sexo,
  Giro
    ]
  }
}
