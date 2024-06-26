
view: hv_06_sms {
  derived_table: {
    sql: Select
        Case DCE.Id
        When 90 Then 'Conocimiento'
        When 91 Then 'Conocimiento'
        When 1 Then 'Bienvenida'
        When 87 Then 'Bienvenida'
        When 88 Then 'Bienvenida'
        When 89 Then 'Bienvenida'
        When 105 Then 'Bienvenida'
        When 106 Then 'Bienvenida'
        When 107 Then 'Bienvenida'
        When 108 Then 'Bienvenida'
        End As Campana,
        P.Celular,
        DCE.Estatus As EstatusDetalleCampanaSMS,
        Credito.Valor As Credito,
        Cuenta.Valor As Cuenta,
        P.Correo,
        EC.FechaEnvio,
        EC.Id As IdMensaje,
        Conteo.N_Envio,
        DCE.Mensaje As MensajeDetalleENvioCampana,
        P.Nombres,
        EC.Estatus As EstatusEnvioCampana,
        C.Descripcion
      From
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.Campana` C
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.EnvioCampana` EC On C.Id = EC.IdCampana
      Inner Join
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.DetalleCampanaSms` DCE On C.Id = DCE.IdCampana And EC.IdDetCam = DCE.Id
      Inner Join
        (
        Select
          EC.IdProspecto,
          EC.Id,
          ROW_NUMBER() OVER (PARTITION By EC.IdProspecto Order By EC.IdProspecto,EC.Id ) As N_Envio
        From
          `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.EnvioCampana` EC
        Inner Join
          `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCampanas.DetalleCampanaSms` DC On EC.IdCampana = DC.IdCampana And EC.IdDetCam=DC.Id
        ) Conteo On EC.Id = Conteo.Id
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
        Where IdCampo = 3
        ) Credito On P.Id = Credito.IdProspectoProducto
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
        C.Producto = 'K171' And EC.FechaEnvio >= CURRENT_DATE() - 180 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campana {
    type: string
    sql: ${TABLE}.Campana ;;
  }

  dimension: celular {
    type: string
    sql: ${TABLE}.Celular ;;
  }

  dimension: estatus_detalle_campana_sms {
    type: number
    sql: ${TABLE}.EstatusDetalleCampanaSMS ;;
  }

  dimension: credito {
    type: string
    sql: ${TABLE}.Credito ;;
  }

  dimension: cuenta {
    type: string
    sql: ${TABLE}.Cuenta ;;
  }

  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }

  dimension_group: fecha_envio {
    type: time
    sql: ${TABLE}.FechaEnvio ;;
  }

  dimension: id_mensaje {
    type: string
    sql: ${TABLE}.IdMensaje ;;
  }

  dimension: n_envio {
    type: number
    sql: ${TABLE}.N_Envio ;;
  }

  dimension: mensaje_detalle_envio_campana {
    type: string
    sql: ${TABLE}.MensajeDetalleENvioCampana ;;
  }

  dimension: nombres {
    type: string
    sql: ${TABLE}.Nombres ;;
  }

  dimension: estatus_envio_campana {
    type: number
    sql: ${TABLE}.EstatusEnvioCampana ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  set: detail {
    fields: [
        campana,
  celular,
  estatus_detalle_campana_sms,
  credito,
  cuenta,
  correo,
  fecha_envio_time,
  id_mensaje,
  n_envio,
  mensaje_detalle_envio_campana,
  nombres,
  estatus_envio_campana,
  descripcion
    ]
  }
}
