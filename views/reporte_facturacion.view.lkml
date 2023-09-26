view: reporte_facturacion {
  sql_table_name: dbo.ReporteFacturacion ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: fecha_creacion {
    type: string
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension: id_gasolina {
    type: number
    sql: ${TABLE}.IdGasolina ;;
  }
  dimension: iva {
    type: number
    sql: ${TABLE}.IVA ;;
  }
  dimension: origen {
    type: string
    sql: ${TABLE}.Origen ;;
  }
  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.RazonSocial ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  dimension: sub_total {
    type: number
    sql: ${TABLE}.SubTotal ;;
  }
  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }
  dimension: uuid {
    type: string
    sql: ${TABLE}.UUID ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
