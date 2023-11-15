
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
          When ${TABLE}.estado IN ("Aguascalientes") Then "AGUASCALIENTES"
          When ${TABLE}.estado IN ("Baja California") Then "BAJA CALIFORNIA"
          When ${TABLE}.estado IN ("Baja California Sur") Then "BAJA CALIFORNIA SUR"
          When ${TABLE}.estado IN ("Campeche") Then "CAMPECHE"
          When ${TABLE}.estado IN ("Ciudad de Mexico" Then "DISTRITO FEDERAL"
          When ${TABLE}.estado IN ("Chiapas") Then "CHIAPAS"
          When ${TABLE}.estado IN ("Chihuahua") Then "CHIHUAHUA"
          When ${TABLE}.estado IN ("Coahuila de Zaragoza") Then "COAHUILA"
          When ${TABLE}.estado IN ("Colima") Then "COLIMA"
          When ${TABLE}.estado IN ("Durango") Then "DURANGO"
          When ${TABLE}.estado IN ("Mexico") Then "ESTADO DE MÉXICO"
          When ${TABLE}.estado IN ("Guerrero") Then "GUERRERO"
          When ${TABLE}.estado IN ("Guanajuato") Then "GUANAJUATO"
          When ${TABLE}.estado IN ("Hidalgo") Then "HIDALGO"
          When ${TABLE}.estado IN ("Jalisco") Then "JALISCO"
          When ${TABLE}.estado IN ("Michoacan de Ocampo") Then "MICHOACÁN"
          When ${TABLE}.estado IN ("Morelos") Then "MORELOS"
          When ${TABLE}.estado IN ("Nayarit") Then "NAYARIT"
          When ${TABLE}.estado IN ("Nuevo Leon") Then "NUEVO LEÓN"
          When ${TABLE}.estado IN ("Oaxaca") Then "OAXACA"
          When ${TABLE}.estado IN ("Puebla") Then "PUEBLA"
          When ${TABLE}.estado IN ("Queretaro") Then "QUERÉTARO"
          When ${TABLE}.estado IN ("Quintana Roo") Then "QUINTANA ROO"
          When ${TABLE}.estado IN ("San Luis Potosi") Then "SAN LUIS POTOSÍ"
          When ${TABLE}.estado IN ("Sinaloa") Then "SINALOA"
          When ${TABLE}.estado IN ("Sonora") Then "SONORA"
          When ${TABLE}.estado IN ("Tabasco") Then "SONORA"
          When ${TABLE}.estado IN ("Tamaulipas") Then "TAMAULIPAS"
          When ${TABLE}.estado IN ("Tlaxcala") Then "TLAXCALA"
          When ${TABLE}.estado IN ("Veracruz de Ignacio de la Llave") Then "VERACRUZ"
          When ${TABLE}.estado IN ("Yucatan") Then "YUCATÁN"
          When ${TABLE}.estado IN ("Zacatecas") Then "ZACATECAS"
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
