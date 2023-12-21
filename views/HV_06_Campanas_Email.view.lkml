
view: hv_06_campanas_email {
  derived_table: {
    sql: Select
      Credito.Valor As 'Credito',
      Cuenta.Valor As 'Cuenta',
      P.Correo As 'EmailOrigen',
      P.Correo,
      EC.Id As 'IdEnvioCampana',
      Conteo.N_Envio,
      EC.IdCampana,
      EC.Mensaje As 'Msg',
      SUBSTRING(DCE.Asunto,9,1000) As 'Mensaje',
      'Email' As Canal,
      IIF(DCE.Id = 67 , 'Recordatorio', IIF(DCE.Id = 62 or DCE.Id = 52, 'Conocimiento','Bienvenida')) As 'Campaña',
      EC.FechaEnvio,
      EC.Estatus As 'EstatusEnvioCampana',
      DCE.Html
      From
        dbo.Campana C With (Nolock)
      Inner Join
        dbo.EnvioCampana EC With (Nolock) On C.Id = EC.IdCampana
      Inner Join
        dbo.DetalleCampanaEmail DCE With (Nolock) On C.Id = DCE.IdCampana And EC.IdDetCam = DCE.Id
      Inner Join
        (
        Select
          EC.IdProspecto,
          DC.Asunto,
          EC.Id,
          ROW_NUMBER() OVER (PARTITION By EC.IdProspecto Order By EC.IdProspecto,EC.Id ) AS 'N_Envio'
        From
          dbo.EnvioCampana EC With (Nolock)
        Inner Join
          dbo.DetalleCampanaEmail DC With(Nolock) On EC.IdCampana = DC.IdCampana And EC.IdDetCam = DC.Id
        ) Conteo On  EC.Id = Conteo.Id
      Inner Join
        dbo.Prospecto P With (Nolock) On EC.IdProspecto = P.Id
      Inner Join
        (
        Select
          [IdProspectoProducto],
          [IdCampo],
          [Valor]
        From
          dbo.CamposValor With (Nolock)
        Where IdCampo = 3
        ) Credito On P.Id = Credito.IdProspectoProducto
      Inner Join
        (
        Select
        [IdProspectoProducto],
        [IdCampo],
        [Valor]
        From
          dbo.CamposValor With (Nolock)
        Where IdCampo = 25
        ) Cuenta On P.Id = Cuenta.IdProspectoProducto
      Where
        C.Producto = 'K171' And EC.FechaEnvio >= GETDATE()- 180 ;;
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

  dimension: n_envio {
    type: number
    sql: ${TABLE}.N_Envio ;;
  }

  dimension: id_campana {
    type: number
    sql: ${TABLE}.IdCampana ;;
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

  dimension: campaa {
    type: string
    sql: ${TABLE}."Campaña" ;;
  }

  dimension_group: fecha_envio {
    type: time
    sql: ${TABLE}.FechaEnvio ;;
  }

  dimension: estatus_envio_campana {
    type: number
    sql: ${TABLE}.EstatusEnvioCampana ;;
  }

  dimension: html {
    type: string
    sql: ${TABLE}.Html ;;
  }

  set: detail {
    fields: [
        credito,
  cuenta,
  email_origen,
  correo,
  id_envio_campana,
  n_envio,
  id_campana,
  msg,
  mensaje,
  canal,
  campaa,
  fecha_envio_time,
  estatus_envio_campana,
  html
    ]
  }
}
