view: datos_generales_dispositivos_2443 {
  sql_table_name: CNBV.DatosGeneralesDispositivos_2443 ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: anio {
    type: string
    sql: ${TABLE}.Anio ;;
  }
  dimension: calle {
    type: string
    sql: ${TABLE}.Calle ;;
  }
  dimension: ciudad {
    type: string
    sql: ${TABLE}.Ciudad ;;
  }
  dimension: clave_situacion {
    type: string
    sql: ${TABLE}.ClaveSituacion ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: cp {
    type: string
    sql: ${TABLE}.Cp ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension_group: fecha_situacion {
    type: time
    timeframes: [raw, time, date, week, month, month_num, quarter, year]
    sql: ${TABLE}.FechaSituacion ;;
  }
  dimension: localidad {
    type: string
    sql: ${TABLE}.Localidad ;;
  }
  dimension: mcc {
    type: string
    sql: ${TABLE}.MCC ;;
  }
  dimension: mes {
    type: string
    alpha_sort: yes
    sql: ${TABLE}.Mes ;;
  }
  dimension: numero_calle {
    type: string
    sql: ${TABLE}.NumeroCalle ;;
  }
  dimension: Link {
    label: "Ver en Ops"
    type: string
    sql: "Para más detalle de la cuenta consulta Ops";;
    link: {
      label: "Ver en Ops"
      url: "https://ops.broxel.com/CuentasTarjetas"  # Reemplaza con una cuenta de prueba
    }
  }
  dimension: numero_serie {
    type: string
    sql: ${TABLE}.NumeroSerie ;;
  }
  dimension: position {
    type: string
    sql: ${TABLE}.Position ;;
  }
  dimension: tipo_dispositivo {
    type: string
    sql: ${TABLE}.TipoDispositivo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
