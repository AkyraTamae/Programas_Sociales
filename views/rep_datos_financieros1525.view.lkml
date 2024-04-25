view: rep_datos_financieros1525 {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.RepDatosFinancieros1525` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: codigo_iso {
    type: string
    sql: ${TABLE}.CodigoISO ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, time, date, week, month, month_num, quarter, year]
    datatype: datetime
    sql: ${TABLE}.fecha ;;
  }
  dimension: loop_card_nature_id {
    type: number
    sql: ${TABLE}.LoopCardNatureId ;;
  }
  dimension: loop_payment_type {
    type: number
    sql: ${TABLE}.LoopPaymentType ;;
  }
  dimension: monto {
    type: number
    sql: ${TABLE}.monto ;;
  }
  dimension: movement_type_id {
    type: number
    sql: ${TABLE}.MovementTypeId ;;
  }
  dimension: origen {
    type: string
    sql: ${TABLE}.Origen ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  #####################Detalle Credito Nacional#####################

  measure: calculos_totales_usuarios_credito_nacional {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", codigo_iso: "-NULL"]
    label: "Usuarios Unicos Cn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_nacional_credito_operaciones{
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Operaciones Cn"
  }

  measure: calculos_totales_nacional_credito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Monto Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_credito_pagos_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Unicos Cn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_nacional_credito_pagos {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Cn"
  }

  measure: calculos_totales_nacional_credito_pagos_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Monto Pagos Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_credito_pagos_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Aprobadas Pagos Cn"
  }

  measure: calculos_totales_nacional_credito_pagos_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Monto Aprobadas Pagos Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_credito_pagos_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Pagos Cn"
  }

  measure: calculos_totales_nacional_credito_pagos_rechazadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Monto Rechazadas Pagos Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_devolucion_nacional_credito_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Usuarios Cn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_devolucion_nacional_credito {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Cn"
  }

  measure: calculos_totales_devolucion_nacional_credito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Monto Devoluciones Cn"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_nacional_credito_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Aprobadas Devoluciones Cn"
  }

    measure: calculos_totales_devolucion_nacional_credito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Devoluciones Cn"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_nacional_credito_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Rechazadas Devoluciones Cn"
  }

  measure: calculos_totales_devolucion_nacional_credito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Monto Rechazadas Devoluciones Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_credito_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Aprobadas Cn"
  }

  measure: calculos_totales_nacional_credito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Cn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_cedito_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Cn"
  }

  measure: calculos_totales_nacionalC_cedito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "NULL, -00"]
    label: "Monto Rechazadas Cn"
    sql: ${TABLE}.monto ;;
  }







  ##################################################################




}
