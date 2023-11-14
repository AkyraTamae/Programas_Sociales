
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

  dimension: Layer_MX {
    case: {
      when: {
        sql: ${TABLE}.Estado IN ("Aguascalientes");;
        label: "AGUASCALIENTES"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Baja California");;
        label: "BAJA CALIFORNIA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Baja California Sur");;
        label: "BAJA CALIFORNIA SUR"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Campeche");;
        label: "CAMPECHE"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Ciudad de Mexico");;
        label: "DISTRITO FEDERAL"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Chiapas");;
        label: "CHIAPAS"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Chihuahua");;
        label: "CHIHUAHUA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Coahuila de Zaragoza");;
        label: "COAHUILA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Colima");;
        label: "COLIMA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Durango");;
        label: "DURANGO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Mexico");;
        label: "ESTADO DE MÉXICO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Guerrero");;
        label: "GUERRERO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Guanajuato");;
        label: "GUANAJUATO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Hidalgo");;
        label: "HIDALGO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Jalisco");;
        label: "JALISCO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Michoacan de Ocampo");;
        label: "MICHOACÁN"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Morelos");;
        label: "MORELOS"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Nayarit");;
        label: "NAYARIT"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Nuevo Leon");;
        label: "NUEVO LEÓN"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Oaxaca");;
        label: "OAXACA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Puebla");;
        label: "PUEBLA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Queretaro");;
        label: "QUERÉTARO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Quintana Roo");;
        label: "QUINTANA ROO"
      }
      when: {
        sql: ${TABLE}.Estado IN ("San Luis Potosi");;
        label: "SAN LUIS POTOSÍ"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Sinaloa");;
        label: "SINALOA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Sonora");;
        label: "SONORA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Tabasco");;
        label: "SONORA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Tamaulipas");;
        label: "TAMAULIPAS"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Tlaxcala");;
        label: "TLAXCALA"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Veracruz de Ignacio de la Llave");;
        label: "VERACRUZ"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Yucatan");;
        label: "YUCATÁN"
      }
      when: {
        sql: ${TABLE}.Estado IN ("Zacatecas");;
        label: "ZACATECAS"
      }
      else: "unknown"
    }
    map_layer_name: mexico_layer
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
