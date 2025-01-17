view: rep_mujeres_con_bienestar_bq {
  derived_table: {
    sql: SELECT
        B.Cuenta as Cuenta2,
        A.*
      FROM
        `mgcp-10078073-bxl-bi-snd.BIOro.RepMujeresConBienestar` A
      LEFT JOIN
        `mgcp-10078073-bxl-bi-snd.BIPlata.RepCuentasReportadasMujeresConBienestar` B ON A.Cuenta = B.Cuenta ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }
  dimension: cuenta_2 {
    type: string
    sql: ${TABLE}.Cuenta2 ;;
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
  dimension_group: fecha_insercion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaInsercion ;;
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
  dimension: oficio {
    type: string
    sql: ${TABLE}.Oficio ;;
  }
  dimension: paternal_last_name {
    type: string
    sql: ${TABLE}.PaternalLastName ;;
  }
  dimension: repetido {
    type: number
    sql: ${TABLE}.Repetido ;;
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
    drill_fields: [maternal_last_name, paternal_last_name]
  }

  ####################################

  dimension: marca {
    type: string
    label: "Marca"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: modelo {
    type: string
    label: "Modelo"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: anio_vehiculo {
    type: string
    label: "Año Vehículo"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: chasis {
    type: string
    label: "Chasis"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: placa {
    type: string
    label: "Placa"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: peso {
    type: string
    label: "Peso"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: color_vehiculo {
    type: string
    label: "Color Vehículo"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: tipo_vehiculo {
    type: string
    label: "Tipo Vehículo"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: observacion_especial  {
    type: string
    label: "Observacion Especial"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: correo_electronico  {
    type: string
    label: "Correo Electrónico"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: fecha_nacimiento  {
    type: string
    label: "Fecha Nacimiento"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: sexo {
    type: string
    label: "Sexo"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: estado {
    type: string
    label: "Estado"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: localidad  {
    type: string
    label: "Localidad"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: colonia {
    type: string
    label: "Colonia"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: codigo_postal  {
    type: string
    label: "Código Postal"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: beneficiario  {
    type: string
    label: "Beneficiario"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension:  nombre_mascota {
    type: string
    label: "Nombre Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: especie_mascota  {
    type: string
    label: "Especie Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: sexo_mascota  {
    type: string
    label: "Sexo Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: raza_mascota  {
    type: string
    label: "Raza Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: color_mascota  {
    type: string
    label: "Color Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: anio_mascota  {
    type: string
    label: "Año Mascota"
    sql: case when ${TABLE}.Cuenta is not null then '' else '' end ;;
  }

  dimension: meses_mascota {
    type: string
    label: "Meses Mascota"
    sql: case when ${TABLE}.Cuenta is not null then ''  else '' end ;;
  }

  dimension: senas_mascota  {
    type: string
    label: "Senas Mascota"
    sql: case when ${TABLE}.Cuenta is not null then 'NA'  else '' end ;;
  }

  dimension: vin  {
    type: number
    label: "VIN"
    sql: case when ${TABLE}.Cuenta is not null then 0 else null end ;;
  }
  set: detail {
    fields: [
      repetido,
      cuenta,
      cuenta_2,
      curp,
      rfc,
      nombre,
      paternal_last_name,
      maternal_last_name,
      telefono,
      telefono2,
      direccion,
      id_cuenta,
      id_plan,
      oficio
    ]
  }
}
