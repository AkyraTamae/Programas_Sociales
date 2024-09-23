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

  dimension: nro_tarjeta {
    type: string
    sql: ${TABLE}.nro_tarjeta ;;
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

  dimension: maquila {
    type: string
    sql: left(${TABLE}.maquila, 10) ;;
  }

  dimension: maquila_year {
    type: string
    sql: left(${TABLE}.maquila, 4) ;;
  }

  dimension: maquila_month {
    type: number
    sql: right(left(${TABLE}.maquila, 7), 2)  ;;
  }

  dimension: maquila_month_name {
    type: string
    order_by_field: maquila_month
    sql:
    case
    when right(left(${TABLE}.maquila, 7), 2) = '01' then 'january'
    when right(left(${TABLE}.maquila, 7), 2) = '02' then 'february'
    when right(left(${TABLE}.maquila, 7), 2) = '03' then 'march'
    when right(left(${TABLE}.maquila, 7), 2) = '04' then 'april'
    when right(left(${TABLE}.maquila, 7), 2) = '05' then 'may'
    when right(left(${TABLE}.maquila, 7), 2) = '06' then 'june'
    when right(left(${TABLE}.maquila, 7), 2) = '07' then 'july'
    when right(left(${TABLE}.maquila, 7), 2) = '08' then 'august'
    when right(left(${TABLE}.maquila, 7), 2) = '09' then 'september'
    when right(left(${TABLE}.maquila, 7), 2) = '10' then 'october'
    when right(left(${TABLE}.maquila, 7), 2) = '11' then 'november'
    when right(left(${TABLE}.maquila, 7), 2) = '12' then 'december'
    end ;;
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
  dimension: Link {
    label: "Ver en Ops"
    type: string
    link: {
      url: "https://ops.broxel.com/Cuentas/Detalle/{{value}}"
    }
    html: "<a href='https://ops.broxel.com/Cuentas/Detalle/{{value}}' target='_blank'>Link Ops</a>" ;;
    sql: ${num_cuenta} ;;
  }

  set: detail {
    fields: [
      nro_tarjeta,
      nombre_titular,
      num_cuenta,
      producto,
      maquila,
      clave_cliente,
      mail_tarjeta_activada,
      celular_tarjeta_activada,
      correo_contacto,
      pais_tel,
      tel,
      Link
    ]
  }
}
