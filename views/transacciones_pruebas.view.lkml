
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

  dimension: Layer_MX {
  map_layer_name: mexico_layer
      sql:
        Case
          When ${TABLE}.estado = "Aguascalientes" Then "AGUASCALIENTES"
          When ${TABLE}.estado = "Baja California" Then "BAJA CALIFORNIA"
          When ${TABLE}.estado = "Baja California Sur" Then "BAJA CALIFORNIA SUR"
          When ${TABLE}.estado = "Campeche" Then "CAMPECHE"
          When ${TABLE}.estado = "Ciudad de Mexico" Then "DISTRITO FEDERAL"
          When ${TABLE}.estado = "Chiapas" Then "CHIAPAS"
          When ${TABLE}.estado = "Chihuahua" Then "CHIHUAHUA"
          When ${TABLE}.estado = "Coahuila de Zaragoza" Then "COAHUILA"
          When ${TABLE}.estado = "Colima" Then "COLIMA"
          When ${TABLE}.estado = "Durango" Then "DURANGO"
          When ${TABLE}.estado = "Mexico" Then "ESTADO DE MÉXICO"
          When ${TABLE}.estado = "Guerrero" Then "GUERRERO"
          When ${TABLE}.estado = "Guanajuato" Then "GUANAJUATO"
          When ${TABLE}.estado = "Hidalgo" Then "HIDALGO"
          When ${TABLE}.estado = "Jalisco" Then "JALISCO"
          When ${TABLE}.estado = "Michoacan de Ocampo" Then "MICHOACÁN"
          When ${TABLE}.estado = "Morelos" Then "MORELOS"
          When ${TABLE}.estado = "Nayarit" Then "NAYARIT"
          When ${TABLE}.estado = "Nuevo Leon" Then "NUEVO LEÓN"
          When ${TABLE}.estado = "Oaxaca" Then "OAXACA"
          When ${TABLE}.estado = "Puebla" Then "PUEBLA"
          When ${TABLE}.estado = "Queretaro" Then "QUERÉTARO"
          When ${TABLE}.estado = "Quintana Roo" Then "QUINTANA ROO"
          When ${TABLE}.estado = "San Luis Potosi" Then "SAN LUIS POTOSÍ"
          When ${TABLE}.estado = "Sinaloa" Then "SINALOA"
          When ${TABLE}.estado = "Sonora" Then "SONORA"
          When ${TABLE}.estado = "Tabasco" Then "SONORA"
          When ${TABLE}.estado = "Tamaulipas" Then "TAMAULIPAS"
          When ${TABLE}.estado = "Tlaxcala" Then "TLAXCALA"
          When ${TABLE}.estado = "Veracruz de Ignacio de la Llave" Then "VERACRUZ"
          When ${TABLE}.estado = "Yucatan" Then "YUCATÁN"
          When ${TABLE}.estado = "Zacatecas" Then "ZACATECAS"
          Else "unknown";;
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
