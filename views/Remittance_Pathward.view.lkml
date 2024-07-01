
view: remittance_pathward {
  derived_table: {
    sql: --Sender
      Select
        [Date],
        ProductoOrigen,
        MontoUSD_Op,
        MontoMXN_Op,
        ComisionUSD,
        ComisionMXN,
        Status_Op,
        Status_Rmt,
        ClaveClienteSender,
        CuentaOrigen,
        IdOperacion,
        IdMeltsan,
        RemittanceKey,
        AuthNum,
        TxnDate,
        AmountUSD,
        AmountMXN,
        SenderCountry,
        CodigoPostalSender,
        EstadoSender,
        DireccionSender,
        FechaOFACSender,
        FechaNacimientoSender,
        SenderAccountNum,
        SenderName,
        FirstNameSender,
        LastNameSender,
        SenderEmail,
        'Sender' As 'Type'
      From
        dbo.RemittancePathward
      Union All
      --Recipient
      Select
        [Date],
        ProductoDestino,
        MontoUSD_Op,
        MontoMXN_Op,
        ComisionUSD,
        ComisionMXN,
        Status_Op,
        Status_Rmt,
        ClaveClienteRecipient,
        CuentaDestino,
        IdOperacion,
        IdMeltsan,
        RemittanceKey,
        AuthNum,
        TxnDate,
        AmountUSD,
        AmountMXN,
        RecipientCountry,
        CodigoPostalRecipient,
        EstadoRecipient,
        DireccionRecipient,
        FechaOFACRecipient,
        FechaNacimientoRecipient,
        RecipientAccountNum,
        RecipientName,
        FirstNameRecipient,
        LastNameRecipient,
        RecipientEmail,
        'Recipient' As 'Type'
      From
        dbo.RemittancePathward ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.Date ;;
  }

  dimension: producto_origen {
    type: string
    sql: ${TABLE}.ProductoOrigen ;;
  }

  dimension: monto_usd_op {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoUSD_Op ;;
  }

  dimension: monto_mxn_op {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMXN_Op ;;
  }

  dimension: comision_usd {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ComisionUSD ;;
  }

  dimension: comision_mxn {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ComisionMXN ;;
  }

  dimension: status_op {
    type: string
    sql: ${TABLE}.Status_Op ;;
  }

  dimension: status_rmt {
    type: string
    sql: ${TABLE}.Status_Rmt ;;
  }

  dimension: clave_cliente_sender {
    type: string
    label: "Customer ID"
    sql: ${TABLE}.ClaveClienteSender ;;
  }

  dimension: cuenta_origen {
    type: string
    label: "Account Number"
    sql: ${TABLE}.CuentaOrigen ;;
  }

  dimension: id_operacion {
    type: string
    sql: ${TABLE}.IdOperacion ;;
  }

  dimension: id_meltsan {
    type: string
    sql: ${TABLE}.IdMeltsan ;;
  }

  dimension: remittance_key {
    type: string
    sql: ${TABLE}.RemittanceKey ;;
  }

  dimension: auth_num {
    type: string
    sql: ${TABLE}.AuthNum ;;
  }

  dimension: txn_date {
    type: string
    sql: ${TABLE}.TxnDate ;;
  }

  dimension: amount_usd {
    type: number
    sql: ${TABLE}.AmountUSD ;;
  }

  dimension: amount_mxn {
    type: number
    sql: ${TABLE}.AmountMXN ;;
  }

  dimension: sender_country {
    type: string
    sql: ${TABLE}.SenderCountry ;;
  }

  dimension: codigo_postal_sender {
    type: string
    sql: ${TABLE}.CodigoPostalSender ;;
  }

  dimension: estado_sender {
    type: string
    label: "City"
    sql: ${TABLE}.EstadoSender ;;
  }

  dimension: direccion_sender {
    type: string
    label: "Address1"
    sql: ${TABLE}.DireccionSender ;;
  }

  dimension: fecha_ofacsender {
    type: string
    label: "OFAC Screening Date"
    sql: ${TABLE}.FechaOFACSender ;;
  }

  dimension: fecha_nacimiento_sender {
    type: string
    label: "Birthday"
    sql: ${TABLE}.FechaNacimientoSender ;;
  }

  dimension: sender_account_num {
    type: string
    sql: ${TABLE}.SenderAccountNum ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.SenderName ;;
  }

  dimension: first_name_sender {
    type: string
    label: "First Name"
    sql: ${TABLE}.FirstNameSender ;;
  }

  dimension: last_name_sender {
    type: string
    label: "Last Name"
    sql: ${TABLE}.LastNameSender ;;
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.SenderEmail ;;
  }

  dimension: type {
    type: string
    label: "Party Type"
    sql: case when ${TABLE}.Type = 'Sender' then 1 when ${TABLE}.Type = 'Recipient' then 2 end ;;
  }

  ###########################################

  dimension: line_of_business {
    type: number
    sql: case when ${TABLE}.ProductoOrigen is not null then 1 else 0 end ;;
  }

  dimension: settlement_network {
    type: number
    sql: case when ${TABLE}.ProductoOrigen is not null then 27 else 0 end ;;
  }

  dimension: transaction_type {
    type: number
    sql: case when ${TABLE}.ProductoOrigen is not null then 4 else 0 end ;;
  }

  dimension: monto_usd_op_2 {
    type: number
    label: "Settlement Amount"
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoUSD_Op ;;
  }

  dimension: pathward_customer {
    type: string
    sql: case when ${TABLE}.ProductoOrigen is not null then 'Tipo de cliente' end ;;
  }

  dimension: country_code {
    type: string
    sql: case when ${TABLE}.SenderCountry = 'USD' then 840 when ${TABLE}.SenderCountry = 'MXN' then 484 end ;;
  }

  dimension: ofac_result {
    type: number
    label: "OFAC Result"
    sql: case when ${TABLE}.ProductoOrigen is not null then 1 else 0 end ;;
  }

  dimension: bank_name {
    type: string
    sql: case when ${TABLE}.SenderCountry = 'USD' then 'Pathward' when ${TABLE}.SenderCountry = 'MXN' then 'Servicios Broxel SAPI de CV' end ;;
  }

  dimension: mexico_layer {
    type: string
    map_layer_name: mexico_layer
    sql: ${TABLE}.EstadoSender ;;
  }

  dimension: united_states_layer {
    type: string
    map_layer_name: united_states_layer
    sql: ${TABLE}.EstadoSender ;;
  }

  ###########################################

  set: detail {
    fields: [
        date,
  producto_origen,
  monto_usd_op,
  monto_mxn_op,
  comision_usd,
  comision_mxn,
  status_op,
  status_rmt,
  clave_cliente_sender,
  cuenta_origen,
  id_operacion,
  id_meltsan,
  remittance_key,
  auth_num,
  txn_date,
  amount_usd,
  amount_mxn,
  sender_country,
  codigo_postal_sender,
  estado_sender,
  direccion_sender,
  fecha_ofacsender,
  fecha_nacimiento_sender,
  sender_account_num,
  sender_name,
  first_name_sender,
  last_name_sender,
  sender_email,
  type
    ]
  }
}
