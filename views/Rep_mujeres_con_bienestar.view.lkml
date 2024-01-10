view: rep_mujeres_con_bienestar {
  sql_table_name: dbo.RepMujeresConBienestar ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: curp {
    type: string
    sql: ${TABLE}.Curp ;;
  }
  dimension: direccion {
    type: string
    sql: ${TABLE}.Direccion ;;
  }
  dimension_group: fecha_fin_vigencia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaFinVigencia ;;
  }
  dimension_group: fecha_inicio_vigencia {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaInicioVigencia ;;
  }
  dimension: id_cuenta {
    type: string
    sql: ${TABLE}.IdCuenta ;;
  }
  dimension: id_plan {
    type: string
    sql: ${TABLE}.IdPlan ;;
  }
  dimension: maternal_last_name {
    type: string
    sql: ${TABLE}.MaternalLastName ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: paternal_last_name {
    type: string
    sql: ${TABLE}.PaternalLastName ;;
  }
  dimension: rfc {
    type: string
    sql: ${TABLE}.Rfc ;;
  }
  dimension: telefono {
    type: number
    sql: ${TABLE}.Telefono ;;
  }
  dimension: telefono2 {
    type: number
    sql: ${TABLE}.Telefono2 ;;
  }
  measure: count {
    type: count
    drill_fields: [id, paternal_last_name, maternal_last_name]
  }

  ####################################

  dimension: marca {
    label: "Marca"
  }

  dimension: modelo {
    label: "Modelo"
  }

  dimension: anio_vehiculo {
    label: "Año Vahículo"
  }

  dimension: chasis {
    label: "Chasis"
  }

  dimension: placa {
    label: "Placa"
  }

  dimension: peso {
    label: "Peso"
  }

  dimension: color_vehiculo{
    label: "Color Vahículo"
  }

  dimension: tipo_vehiculo{
    label: "Tipo Vahículo"
  }



}
