view: credito_yo_construyo {
  sql_table_name: dbo.CreditoYoConstruyo ;;

  dimension: apellido_materno {
    type: string
    sql: ${TABLE}.ApellidoMaterno ;;
  }
  dimension: apellido_paterno {
    type: string
    sql: ${TABLE}.ApellidoPaterno ;;
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
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension: fecha_acreditacion {
    type: string
    sql: ${TABLE}.FechaAcreditacion ;;
  }
  dimension: folio_asignacion_linea {
    type: string
    sql: ${TABLE}.FolioAsignacionLinea ;;
  }
  dimension: monto_credito {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoCredito ;;
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
  measure: count {
    type: count
  }
}
