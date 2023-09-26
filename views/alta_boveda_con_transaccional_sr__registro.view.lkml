view: alta_boveda_con_transaccional_sr__registro {
  sql_table_name: dbo.ALTA BOVEDA CON TRANSACCIONAL SR - Registro ;;

  dimension: _cuntas_operaciones_y_movimientos_hars_al_mes {
    type: string
    sql: ${TABLE}." Â¿cuÃ¡ntas operaciones y movimientos harÃ¡s al mes?"" ;;
  }
  dimension: _para_qu_usars_tu_dinero {
    type: string
    sql: ${TABLE}." Â¿para quÃ© usarÃ¡s tu dinero?"" ;;
  }
  dimension: apellido_materno {
    type: string
    sql: ${TABLE}."Apellido materno" ;;
  }
  dimension: apellido_paterno {
    type: string
    sql: ${TABLE}."Apellido paterno" ;;
  }
  dimension: calle {
    type: string
    sql: ${TABLE}.Calle ;;
  }
  dimension: cdigo_identificador_de_ine_ife_cic_o_clave_de_elector {
    type: string
    sql: ${TABLE}."CÃ³digo Identificador de INE IFE (CIC) o Clave de Elector" ;;
  }
  dimension: cdigo_postal {
    type: string
    sql: ${TABLE}."CÃ³digo postal" ;;
  }
  dimension: celular {
    type: string
    sql: ${TABLE}.celular ;;
  }
  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }
  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }
  dimension: con_qu_frecuencia_usars_tu_cuenta {
    type: string
    sql: ${TABLE}."Â¿Con quÃ© frecuencia usarÃ¡s tu cuenta?" ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.correo ;;
  }
  dimension: cul_es_tu_ocupacin {
    type: string
    sql: ${TABLE}."Â¿CuÃ¡l es tu ocupaciÃ³n?" ;;
  }
  dimension: cul_es_tu_principal_fuente_de_ingresos {
    type: string
    sql: ${TABLE}."Â¿CuÃ¡l es tu principal fuente de ingresos?" ;;
  }
  dimension: cunto_depositars_o_recibirs_en_tu_cuenta_cada_mes {
    type: string
    sql: ${TABLE}."Â¿CuÃ¡nto depositarÃ¡s o recibirÃ¡s en tu cuenta cada mes?" ;;
  }
  dimension: curp {
    type: string
    sql: ${TABLE}.CURP ;;
  }
  dimension: edad {
    type: string
    sql: ${TABLE}.Edad ;;
  }
  dimension: en_total {
    type: string
    sql: ${TABLE}.""En total" ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.fechaNacimiento ;;
  }
  dimension: lugar_de_nacimiento {
    type: string
    sql: ${TABLE}."Lugar de nacimiento" ;;
  }
  dimension: municipio_alcalda {
    type: string
    sql: ${TABLE}."Municipio AlcaldÃ­a" ;;
  }
  dimension: nacionalidad {
    type: string
    sql: ${TABLE}.Nacionalidad ;;
  }
  dimension: nmero_exterior {
    type: string
    sql: ${TABLE}."NÃºmero exterior" ;;
  }
  dimension: nmero_interior {
    type: string
    sql: ${TABLE}."NÃºmero interior" ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }
  dimension: ocr_o_identificador_del_ciudadano {
    type: string
    sql: ${TABLE}."OCR o Identificador del Ciudadano" ;;
  }
  dimension: pas {
    type: string
    sql: ${TABLE}."PaÃ­s" ;;
  }
  dimension: primer_nombre {
    type: string
    sql: ${TABLE}."Primer nombre" ;;
  }
  dimension: principalmente {
    type: string
    sql: ${TABLE}.""Principalmente" ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  dimension: segundo_nombre {
    type: string
    sql: ${TABLE}."Segundo nombre" ;;
  }
  dimension: sexo {
    type: string
    sql: ${TABLE}.sexo ;;
  }
  measure: count {
    type: count
  }
}
