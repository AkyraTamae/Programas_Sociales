view: rep_alta_cuentas_clientes {
  sql_table_name: dbo.RepAltaCuentasClientes ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: actividad_eco {
    type: string
    sql: ${TABLE}.ActividadEco ;;
  }
  dimension: alcaldia_mun {
    type: string
    sql: ${TABLE}.Alcaldia_Mun ;;
  }
  dimension: calle {
    type: string
    sql: ${TABLE}.Calle ;;
  }
  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }
  dimension: clave_elector {
    type: string
    sql: ${TABLE}.ClaveElector ;;
  }
  dimension: clave_producto {
    type: string
    sql: ${TABLE}.ClaveProducto ;;
  }
  dimension: colonia {
    type: string
    sql: ${TABLE}.Colonia ;;
  }
  dimension: cp {
    type: string
    sql: ${TABLE}.CP ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.Email ;;
  }
  dimension: empresa {
    type: string
    sql: ${TABLE}.Empresa ;;
  }
  dimension: entidad_fed {
    type: string
    sql: ${TABLE}.EntidadFed ;;
  }
  dimension: fecha {
    type: string
    sql: ${TABLE}.Fecha ;;
  }
  dimension: fecha_nacimiento {
    type: string
    sql: ${TABLE}.FechaNacimiento ;;
  }
  dimension: genero {
    type: string
    sql: ${TABLE}.Genero ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: nomina {
    type: string
    sql: ${TABLE}.Nomina ;;
  }
  dimension: num_cuenta {
    type: string
    sql: ${TABLE}.NumCuenta ;;
  }
  dimension: num_ext {
    type: string
    sql: ${TABLE}.NumExt ;;
  }
  dimension: num_int {
    type: string
    sql: ${TABLE}.NumInt ;;
  }
  dimension: pais {
    type: string
    sql: ${TABLE}.Pais ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }
  dimension: telefono {
    type: string
    sql: ${TABLE}.Telefono ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
