view: vl_02 {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIPlata.vl02_2` ;;

  dimension: afiliacion_id {
    type: string
    sql: ${TABLE}.AfiliacionID ;;
  }
  dimension: cantidad_de_vales_enviados {
    hidden: yes
    type: number
    sql: ${TABLE}.CantidadDeValesEnviados ;;
  }
  dimension: cantidad_de_vales_pagados {
    hidden: yes
    type: number
    sql: ${TABLE}.CantidadDeValesPagados ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.comercio ;;
  }
  dimension: descripcion_status_validacion_vale {
    type: string
    sql: ${TABLE}.DescripcionStatusValidacionVale ;;
  }
  dimension: emision_id {
    #type: number
    #sql: ${TABLE}.EmisionID ;;
    type: string
    sql: CAST(${TABLE}.EmisionID as string);;
  }
  dimension_group: fecha_bp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaBP ;;
  }
  dimension_group: fecha_de_registro_del_folio_dispersion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaDeRegistroDelFolioDispersion ;;
  }
  dimension_group: fecha_envio_xcmpabroxel {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaEnvioXCMPABroxel ;;
  }
  dimension_group: fecha_pago {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fechaPago ;;
  }
  dimension_group: fecha_recepcion_xcmp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaRecepcionXCMP ;;
  }
  dimension_group: fecha_registro_xafiliacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaRegistroXAfiliacion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.folio ;;
  }
  dimension: folio_de_pago {
    type: string
    sql: ${TABLE}.FolioDePago ;;
  }
  dimension: folio_de_reembolso {
    type: string
    sql: ${TABLE}.FolioDeReembolso ;;
  }
  dimension: guia {
    type: string
    sql: ${TABLE}.Guia ;;
  }
  dimension: id_bp {
    #type: number
    #sql: ${TABLE}.idBP ;;
    type: string
    sql: CAST(${TABLE}.idBP AS string) ;;
  }
  dimension: id_programa {
    type: number
    sql: ${TABLE}.idPrograma ;;
  }
  dimension: identificador_bp {
    type: number
    sql: ${TABLE}.IdentificadorBP ;;
  }
  dimension: importe_descuento {
    hidden:  yes
    type: number
    sql: ${TABLE}.importe_descuento ;;
  }
  dimension: importe_ventas {
    hidden:  yes
    type: number
    sql: ${TABLE}.importe_ventas ;;
  }
  dimension: monto_del_envio {
    hidden:  yes
    type: number
    sql: ${TABLE}.MontoDelEnvio ;;
  }
  dimension: numero_vales_leidos {
    hidden: yes
    type: number
    sql: ${TABLE}.NumeroValesLeidos ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }
  dimension: producto_id {
    #type: number
    #sql: ${TABLE}.ProductoID ;;
    type: string
    sql: CAST (${TABLE}.ProductoID as string) ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: st_pago {
    type: string
    sql: ${TABLE}.stPago ;;
  }
  dimension: status_validacion_vale_id {
    type: number
    sql: ${TABLE}.StatusValidacionValeID ;;
  }
  dimension: total_anomalias {
    hidden: yes
    type: number
    sql: ${TABLE}.TotalAnomalias ;;
  }
  dimension: total_leido {
    hidden: yes
    type: number
    sql: ${TABLE}.TotalLeido ;;
  }
  dimension: transacciones {
    type: number
    sql: ${TABLE}.transacciones ;;
  }
  measure: count {
    type: count
  }
  dimension: folio_consecutivo {
    label: "Folio consecutivo"
    type: string
    sql: LEFT(${folio_de_reembolso}, 8);;
  }

  measure: count_distinct_id_bp {
    type: count_distinct
    value_format: "#,##0.00"
    sql: ${TABLE}.idBP ;;
  }

  #***********************   INCIO SECCIÓN:   Métricas obre dimensión    *********************
  measure: sum_total_leido {
    label: "Total Leído"
    type: sum
    value_format: "$#,##0.00"
    sql: ${total_leido} ;;
  }
  measure: sum_cantidad_vales_pagados {
    label: "Vales Pagados"
    type: sum
    sql: ${cantidad_de_vales_pagados} ;;
  }
  measure: sum_total_anomalias{
    label: "Total Anomalías"
    type: sum
    sql: ${total_anomalias} ;;
  }
  measure: sum_monto_del_envio {
    label: "Monto del envío"
    type: sum
    value_format: "$#,##0.00"
    sql: ${monto_del_envio} ;;
  }
  measure: sum_importe_ventas {
    label: "Importe Ventas"
    type: sum
    value_format: "$#,##0.00"
    sql: ${importe_ventas} ;;
  }
  measure: sum_cantidad_vales_enviados {
    label: "Vales enviados"
    type: sum
    sql: ${cantidad_de_vales_enviados} ;;
  }
  measure: sum_num_vales_leidos {
    label: "Número Vales Leídos"
    type: sum
    sql: ${numero_vales_leidos} ;;
  }
  measure: sum_importe_descuento {
    label: "Importe Descuento"
    type: sum
    value_format: "$#,##0.00"
    sql: ${importe_descuento} ;;
  }

  #***********************   FIN SECCIÓN:   Métricas obre dimensión    *********************

  #***********************   INCIO SECCIÓN:   Métrica   ANOMALO     *********************

  dimension: dim_anomalias {
    label:"Anomalo"
    case: {
      when: {
        sql: ${TABLE}.TotalAnomalias > 0 ;;
        label: "Anomalo"
      }
      else: "Correcto"
    }
  }
  #***********************   FIN SECCIÓN:   Métrica   ANOMALO     *********************

  measure: max_monto_del_envio {
    label: "MAX Monto del envío"
    type: number
    value_format: "$#,##0.00"
    sql: MAX(${monto_del_envio}) ;;
  }
  measure: max_vales_enviados {
    label: "MAX Vales enviados"
    type: number
    value_format: "$#,##0.00"
    sql: MAX(${cantidad_de_vales_enviados}) ;;
  }
  #***********************   INICIO SECCIÓN:   Métricas de agregación     *********************
  dimension: enviado_por_folio {
    type: number
    sql: ${TABLE}.EnviadoPorFolio ;;
  }
  measure: sum_enviado_por_folio {
    label: "Enviado por Folio"
    type: sum
    value_format: "$#,##0.00"
    sql: ${enviado_por_folio} ;;
  }
  dimension: leido_por_folio {
    type: number
    sql: ${TABLE}.LeidoporFolio ;;
  }
  measure: sum_leido_por_folio {
    label: "Leído por Folio"
    type: sum
    value_format: "$#,##0.00"
    sql: ${leido_por_folio} ;;
  }
#***********************   FIN SECCIÓN:   Métricas de agregación     *********************

  measure: diferencia_monto {
    label: "Diferencia en Monto"
    type: number
    sql: ${enviado_por_folio} - ${leido_por_folio};;
  }
}
