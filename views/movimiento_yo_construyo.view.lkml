view: movimiento_yo_construyo {
  sql_table_name: dbo.MovimientoYoConstruyo ;;

  dimension: afiliacion {
    type: string
    sql: ${TABLE}.Afiliacion ;;
  }
  dimension: apellido_materno {
    type: string
    sql: ${TABLE}.ApellidoMaterno ;;
  }
  dimension: apellido_paterno {
    type: string
    sql: ${TABLE}.ApellidoPaterno ;;
  }
  dimension: autorizacion {
    type: string
    sql: ${TABLE}.Autorizacion ;;
  }
  dimension: clabe_bancaria {
    type: string
    sql: ${TABLE}.ClabeBancaria ;;
  }
  dimension: clave_entidad_financiera {
    type: string
    sql: ${TABLE}.ClaveEntidadFinanciera ;;
  }
  dimension: clave_modalidad {
    type: string
    sql: ${TABLE}.ClaveModalidad ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension: destinatario {
    type: string
    sql: ${TABLE}.Destinatario ;;
  }
  dimension: destino_ministracion {
    type: string
    sql: ${TABLE}.DestinoMinistracion ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension: id_comercio {
    type: number
    sql: ${TABLE}.IdComercio ;;
  }
  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.IdMovimiento ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.Monto ;;
  }
  dimension: nombre_derechohabiente {
    type: string
    sql: ${TABLE}.NombreDerechohabiente ;;
  }
  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }
  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }
  dimension: numero_ministracion {
    type: number
    sql: ${TABLE}.NumeroMinistracion ;;
  }
  dimension: success {
    type: string
    sql: ${TABLE}.Success ;;
  }
  dimension: user_response {
    type: string
    sql: ${TABLE}.UserResponse ;;
  }
  dimension: usuario_acesor {
    type: string
    sql: ${TABLE}.UsuarioAcesor ;;
  }
  dimension: usuario_asesor {
    type: string
    sql: ${TABLE}.UsuarioAsesor ;;
  }
  measure: count {
    type: count
  }
}
