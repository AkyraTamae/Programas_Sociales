
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
      When Estado = 'Ciudad de Mexico' Then 'DISTRITO FEDERAL'
      When Estado = 'Chiapas' Then 'CHIAPAS'
      When Estado = 'Chihuahua' Then 'CHIHUAHUA'
      When Estado = 'Coahuila de Zaragoza' Then 'COAHUILA'
      When Estado = 'Colima' Then 'COLIMA'
      When Estado = 'Durango' Then 'DURANGO'
      When Estado = 'Mexico' Then 'ESTADO DE MÉXICO'
      When Estado = 'Guerrero' Then 'GUERRERO'
      When Estado = 'Guanajuato' Then 'GUANAJUATO'
      When Estado = 'Hidalgo' Then 'HIDALGO'
      When Estado = 'Jalisco' Then 'JALISCO'
      When Estado = 'Michoacan de Ocampo' Then 'MICHOACÁN'
      When Estado = 'Morelos' Then 'MORELOS'
      When Estado = 'Nayarit' Then 'NAYARIT'
      When Estado = 'Nuevo Leon' Then 'NUEVO LEÓN'
      When Estado = 'Oaxaca' Then 'OAXACA'
      When Estado = 'Puebla' Then 'PUEBLA'
      When Estado = 'Queretaro' Then 'QUERÉTARO'
      When Estado = 'Quintana Roo' Then 'QUINTANA ROO'
      When Estado = 'San Luis Potosi' Then 'SAN LUIS POTOSÍ'
      When Estado = 'Sinaloa' Then 'SINALOA'
      When Estado = 'Sonora' Then 'SONORA'
      When Estado = 'Tabasco' Then 'TABASCO'
      When Estado = 'Tamaulipas' Then 'TAMAULIPAS'
      When Estado = 'Tlaxcala' Then 'TLAXCALA'
      When Estado = 'Veracruz de Ignacio de la Llave' Then 'VERACRUZ'
      When Estado = 'Yucatan' Then 'YUCATÁN'
      When Estado = 'Zacatecas' Then 'ZACATECAS'
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
