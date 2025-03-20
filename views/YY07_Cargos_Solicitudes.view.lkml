view: yy07_cargos_solicitudes {
  sql_table_name: `mgcp-10078073-bxl-dwh-prod.raw_Broxel.CargosSolicitudes` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: activa_cuentas {
    type: yesno
    sql: ${TABLE}.ActivaCuentas ;;
  }
  dimension: batch {
    type: yesno
    sql: ${TABLE}.Batch ;;
  }
  dimension: cargo_por_remanente {
    type: yesno
    sql: ${TABLE}.CargoPorRemanente ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: cuentas_multiples {
    type: yesno
    sql: ${TABLE}.CuentasMultiples ;;
  }
  dimension: cuentas_repetidas {
    type: number
    sql: ${TABLE}.CuentasRepetidas ;;
  }
  dimension: email_notificacion {
    type: string
    sql: ${TABLE}.EmailNotificacion ;;
  }
  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }
  dimension_group: fecha_aprobacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaAprobacion ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension_group: fecha_ejecucion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaEjecucion ;;
  }
  dimension_group: fecha_modificacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaModificacion ;;
  }
  dimension_group: fecha_verificacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaVerificacion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: id_comercio {
    type: number
    sql: ${TABLE}.IdComercio ;;
  }
  dimension: importe_individual {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteIndividual ;;
  }
  dimension: importe_total {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ImporteTotal ;;
  }
  dimension: nombre_comercio {
    type: string
    sql: ${TABLE}.NombreComercio ;;
  }
  dimension: notas {
    type: string
    sql: ${TABLE}.Notas ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: total_cuentas {
    type: number
    sql: ${TABLE}.TotalCuentas ;;
  }
  dimension: usuario_aprobacion {
    type: string
    sql: ${TABLE}.UsuarioAprobacion ;;
  }
  dimension: usuario_creacion {
    type: string
    sql: ${TABLE}.UsuarioCreacion ;;
  }
  dimension: usuario_ejecucion {
    type: string
    sql: ${TABLE}.UsuarioEjecucion ;;
  }
  dimension: usuario_modificacion {
    type: string
    sql: ${TABLE}.UsuarioModificacion ;;
  }
  dimension: usuario_verificacion {
    type: string
    sql: ${TABLE}.UsuarioVerificacion ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
  ###########################################

  dimension: programa {
    type: string
    sql:
    case
    when ${TABLE}.Producto = 'K303' then 'Equipa Tu Casa'
    when ${TABLE}.Producto = 'K281' then 'Renueva'
    when ${TABLE}.Producto in ('K671', 'K672') then 'Repara'
    end ;;
  }



  ###########################################
}
