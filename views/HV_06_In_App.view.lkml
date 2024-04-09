
view: hv_06_in_app {
  derived_table: {
    sql: Select
        Credito.Valor As Credito,
        Cuenta.Valor As Cuenta,
        P.Correo As EmailOrigen,
        P.Correo,
        EC.Id As IdEnvioCampana,
        EC.Mensaje As Msg,
        DCE.Mensaje,
        'In_App' As Canal,
        C.Identificador,
        EC.FechaEnvio,
        EC.Estatus As EstatusEnvioCampana
      From
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.Campana` C
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.EnvioCampana` EC On  C.Id = EC.IdCampana
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.DetalleCampanaPush` DCE On C.Id = DCE.IdCampana And  EC.IdDetCam = DCE.Id
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.Prospecto` P On EC.IdProspecto = P.Id
      Inner Join
        (
        Select
          IdProspectoProducto,
          IdCampo,
          Valor
      From
          `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.CamposValor`
        Where
          IdCampo = 3
        ) Credito on P.Id = Credito.IdProspectoProducto
      Inner Join
        (
        Select
          IdProspectoProducto,
          IdCampo,
          Valor
        From
          `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.CamposValor`
        Where
          IdCampo = 25
        ) Cuenta On P.Id = Cuenta.IdProspectoProducto
      Where
        C.Producto = 'K171' And  EC.FechaEnvio >= CURRENT_DATE() - 180 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: email_origen {
    type: string
    sql: ${TABLE}.EmailOrigen ;;
  }

  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }

  dimension: id_envio_campana {
    type: string
    sql: ${TABLE}.IdEnvioCampana ;;
  }

  dimension: msg {
    type: string
    sql: ${TABLE}.Msg ;;
  }

  dimension: mensaje {
    type: string
    sql: ${TABLE}.Mensaje ;;
  }

  dimension: canal {
    type: string
    sql: ${TABLE}.Canal ;;
  }

  dimension: identificador {
    type: string
    sql: ${TABLE}.Identificador ;;
  }

  dimension_group: fecha_envio {
    type: time
    sql: ${TABLE}.FechaEnvio ;;
  }

  dimension: estatus_envio_campana {
    type: number
    sql: ${TABLE}.EstatusEnvioCampana ;;
  }

  set: detail {
    fields: [
        credito,
  cuenta,
  email_origen,
  correo,
  id_envio_campana,
  msg,
  mensaje,
  canal,
  identificador,
  fecha_envio_time,
  estatus_envio_campana
    ]
  }
}
