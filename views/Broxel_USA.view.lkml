view: broxel_usa {
  derived_table: {
    sql: Select
          A.nro_tarjeta,
          A.nombre_titular,
          A.num_cuenta,
          A.producto,
          A.maquila,
          A.clave_cliente,
          B.Email mailTarjetaActivada,
          B.celular celularTarjetaActivada,
          C.CorreoContacto,
          C.paisTel,
          C.tel
        From
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.maquila` A
        Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.accessos_clientes` B On B.cuenta = A.num_cuenta
        left join
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.clientesBroxel` C On A.clave_cliente = C.claveCliente
        Where
          A.procesador = 7 And A.nombre_titular Not Like 'Innominada%' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nrotarjeta {
    type: string
    sql: ${TABLE}."nro_tarjeta" ;;
  }

  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.nombre_titular ;;
  }

  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.num_cuenta ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }

  dimension_group: maquila {
    type: time
    timeframes: [raw, time, date, week, month, month_num, quarter, year]
    sql: ${TABLE}.maquila ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }

  dimension: mail_tarjeta_activada {
    type: string
    sql: ${TABLE}.mailTarjetaActivada ;;
  }

  dimension: celular_tarjeta_activada {
    type: string
    sql: ${TABLE}.celularTarjetaActivada ;;
  }

  dimension: correo_contacto {
    type: string
    sql: ${TABLE}.CorreoContacto ;;
  }

  dimension: pais_tel {
    type: string
    sql: ${TABLE}.paisTel ;;
  }

  dimension: tel {
    type: string
    sql: ${TABLE}.tel ;;
  }

  set: detail {
    fields: [
      nrotarjeta,
      nombre_titular,
      num_cuenta,
      producto,
      clave_cliente,
      mail_tarjeta_activada,
      celular_tarjeta_activada,
      correo_contacto,
      pais_tel,
      tel
    ]
  }
}
