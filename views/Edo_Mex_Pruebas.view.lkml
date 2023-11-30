
view: edo_mex_pruebas {
  derived_table: {
    sql: Select
        S.Limite,
        S.conteo,
        DP.*
      From
        DetalleProspecto DP With (Nolock)
      Inner Join
        boomsedes S With (Nolock) On S.IDSedes = DP.IDSedesDias ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: limite {
    type: number
    sql: ${TABLE}.Limite ;;
  }

  dimension: conteo {
    type: number
    sql: ${TABLE}.conteo ;;
  }

  dimension: iddetalle_prospecto {
    type: number
    sql: ${TABLE}.IDDetalleProspecto ;;
  }

  dimension: idsedes_dias {
    type: number
    sql: ${TABLE}.IDSedesDias ;;
  }

  dimension: hora {
    type: string
    sql: ${TABLE}.hora ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }

  dimension: estatus {
    type: number
    sql: ${TABLE}.estatus ;;
  }

  dimension: mensaje {
    type: string
    sql: ${TABLE}.mensaje ;;
  }

  dimension: folio_prospecto {
    type: string
    sql: ${TABLE}.folioProspecto ;;
  }

  dimension: primer_nombre {
    type: string
    sql: ${TABLE}.primer_nombre ;;
  }

  dimension: segundo_nombre {
    type: string
    sql: ${TABLE}.segundo_nombre ;;
  }

  dimension: ap_paterno {
    type: string
    sql: ${TABLE}.ap_paterno ;;
  }

  dimension: ap_materno {
    type: string
    sql: ${TABLE}.ap_materno ;;
  }

  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.fecha_nacimiento ;;
  }

  dimension: celular {
    type: string
    sql: ${TABLE}.celular ;;
  }

  dimension: telefono_fijo {
    type: string
    sql: ${TABLE}.telefono_fijo ;;
  }

  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }

  dimension: cp {
    type: string
    sql: ${TABLE}.cp ;;
  }

  dimension: municipio {
      type: string
      sql: ${TABLE}.municipio ;;
  }

  dimension: municipio_layer {
    type: string
    map_layer_name: municipios_mx
    sql: ${TABLE}.municipio ;;
  }

  dimension: municipio_layer_2 {
    type: string
    map_layer_name: municipios_mx_2
    sql: ${TABLE}.municipio ;;
  }

  set: detail {
    fields: [
        limite,
  conteo,
  iddetalle_prospecto,
  idsedes_dias,
  hora,
  fecha_time,
  link,
  estatus,
  mensaje,
  folio_prospecto,
  primer_nombre,
  segundo_nombre,
  ap_paterno,
  ap_materno,
  fecha_nacimiento,
  celular,
  telefono_fijo,
  correo,
  cp,
  municipio
    ]
  }
}
