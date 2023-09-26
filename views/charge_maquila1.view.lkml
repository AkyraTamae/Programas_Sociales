view: charge_maquila1 {
  sql_table_name: dbo.Charge.Maquila1 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: codigo_postal {
    type: string
    sql: ${TABLE}.codigo_postal ;;
  }
  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }
  dimension: domicilio {
    type: string
    sql: ${TABLE}.domicilio ;;
  }
  dimension: localidad {
    type: string
    sql: ${TABLE}.localidad ;;
  }
  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }
  dimension: nrocorr {
    type: string
    sql: ${TABLE}."nro-corr" ;;
  }
  dimension: nrotarjeta {
    type: string
    sql: ${TABLE}."nro-tarjeta" ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }
  dimension: num_documento {
    type: string
    sql: ${TABLE}.NumDocumento ;;
  }
  dimension: numero_calle {
    type: string
    sql: ${TABLE}.NumeroCalle ;;
  }
  dimension: piso {
    type: string
    sql: ${TABLE}.piso ;;
  }
  dimension: provincia {
    type: string
    sql: ${TABLE}.provincia ;;
  }
  dimension: sexo {
    type: string
    sql: ${TABLE}.Sexo ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  dimension: tipo_documento {
    type: string
    sql: ${TABLE}.TipoDocumento ;;
  }
  dimension: tipo_domicilio {
    type: string
    sql: ${TABLE}.TipoDomicilio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
