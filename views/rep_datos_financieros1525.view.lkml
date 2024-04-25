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

  measure: calculos_totales_nacional_credito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "NULL, -00"]
    label: "Monto Rechazadas Cn"
    sql: ${TABLE}.monto ;;
  }

  #####################Detalle Debito Nacional#####################

  measure: calculos_cotales_ssuarios_debito_nacional {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", codigo_iso: "-NULL"]
    label: "Usuarios Unicos Dn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_nacional_debito_operaciones{
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Operaciones Dn"
  }

  measure: calculos_totales_nacional_debito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Monto Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_debito_pagos_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Unicos Dn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_nacional_debito_pagos {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Dn"
  }

  measure: calculos_totales_nacional_debito_pagos_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Monto Pagos Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_debito_pagos_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Aprobadas Pagos Dn"
  }

  measure: calculos_totales_nacional_debito_pagos_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Monto Aprobadas Pagos Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_debito_pagos_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Pagos Dn"
  }

  measure: calculos_totales_nacional_debito_pagos_rechazadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Monto Rechazadas Pagos Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_devolucion_nacional_debito_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Usuarios Dn"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_devolucion_nacional_debito {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Dn"
  }

  measure: calculos_totales_devolucion_nacional_debito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5"]
    label: "Monto Devoluciones Dn"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_nacional_debito_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Aprobadas Devoluciones Dn"
  }

  measure: calculos_totales_devolucion_nacional_debito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Devoluciones Dn"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_nacional_debito_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Rechazadas Devoluciones Dn"
  }

  measure: calculos_totales_devolucion_nacional_debito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Monto Rechazadas Devoluciones Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_debito_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Aprobadas Dn"
  }

  measure: calculos_totales_nacional_debito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Dn"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_nacional_debito_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Dn"
  }

  measure: calculos_totales_nacional_debito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "-530072%, -517805%, -414720%, -517312%, -455110%, -427082%, -526777%, -427082%, -371775%, -435603%, -455866%, -480078%, -510198%", movement_type_id: "1, 2, 5", codigo_iso: "NULL, -00"]
    label: "Monto Rechazadas Dn"
    sql: ${TABLE}.monto ;;
  }

  #####################Detalle Credito Internacional#####################

  measure: calculos_totales_usuarios_credito_internacional {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", codigo_iso: "-NULL"]
    label: "Usuarios Unicos Ci"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_internacional_credito_operaciones{
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Operaciones Ci"
  }

  measure: calculos_totales_internacional_credito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Monto Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_credito_pagos_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Unicos Ci"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_internacional_credito_pagos {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Ci"
  }

  measure: calculos_totales_internacional_credito_pagos_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Monto Pagos Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_credito_pagos_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Aprobadas Pagos Ci"
  }

  measure: calculos_totales_internacional_credito_pagos_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Monto Aprobadas Pagos Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_credito_pagos_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Pagos Ci"
  }

  measure: calculos_totales_internacional_credito_pagos_rechazadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Monto Rechazadas Pagos Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_devolucion_internacional_credito_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Usuarios Ci"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_devolucion_internacional_credito {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Ci"
  }

  measure: calculos_totales_devolucion_internacional_credito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Monto Devoluciones Ci"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_internacional_credito_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Aprobadas Devoluciones Ci"
  }

  measure: calculos_totales_devolucion_internacional_credito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Devoluciones Ci"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_internacional_credito_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Rechazadas Devoluciones Ci"
  }

  measure: calculos_totales_devolucion_internacional_credito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Monto Rechazadas Devoluciones Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_credito_aprobadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Aprobadas Ci"
  }

  measure: calculos_totales_internacional_credito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Ci"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_credito_rechazadas {
    type: count
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Ci"
  }

  measure: calculos_totales_internacional_credito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosCredito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "NULL, -00"]
    label: "Monto Rechazadas Ci"
    sql: ${TABLE}.monto ;;
  }

  #####################Detalle Debito Internacional#####################

  measure: calculos_totales_usuarios_debito_internacional {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", codigo_iso: "-NULL"]
    label: "Usuarios Unicos Di"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_internacional_debito_operaciones{
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Operaciones Di"
  }

  measure: calculos_totales_internacional_debito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL"]
    label: "Monto Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_debito_pagos_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Unicos Di"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_internacional_debito_pagos {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Pagos Di"
  }

  measure: calculos_totales_internacional_debito_pagos_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL"]
    label: "Monto Pagos Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_debito_pagos_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Aprobadas Pagos Di"
  }

  measure: calculos_totales_internacional_debito_pagos_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "00"]
    label: "Monto Aprobadas Pagos Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_debito_pagos_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Pagos Di"
  }

  measure: calculos_totales_internacional_debito_pagos_rechazadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1", codigo_iso: "-NULL, -00"]
    label: "Monto Rechazadas Pagos Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_devolucion_internacional_debito_unicos {
    type: count_distinct
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Usuarios Di"
    sql: ${TABLE}.Origen ;;
  }

  measure: calculos_totales_devolucion_internacional_debito {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Devoluciones Di"
  }

  measure: calculos_totales_devolucion_internacional_debito_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5"]
    label: "Monto Devoluciones Di"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_internacional_debito_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Aprobadas Devoluciones Di"
  }

  measure: calculos_totales_devolucion_internacional_debito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Devoluciones Di"
    sql: abs(${TABLE}.monto) ;;
  }

  measure: calculos_totales_devolucion_internacional_debito_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Rechazadas Devoluciones Di"
  }

  measure: calculos_totales_devolucion_internacional_debito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "2, 5", codigo_iso: "-00"]
    label: "Monto Rechazadas Devoluciones Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_debito_aprobadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Aprobadas Di"
  }

  measure: calculos_totales_internacional_debito_aprobadas_monto {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "00"]
    label: "Monto Aprobadas Di"
    sql: ${TABLE}.monto ;;
  }

  measure: calculos_totales_internacional_debito_rechazadas {
    type: count
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "-NULL, -00"]
    label: "Rechazadas Di"
  }

  measure: calculos_totales_internacional_debito_rechazadas_monto {
    type: sum
    hidden: yes
    value_format: "$#,##0.00;-$#,##0.00"
    filters: [tipo: "MovimientosDebito", origen: "530072%, 517805%, 414720%, 517312%, 455110%, 427082%, 526777%, 427082%, 371775%, 435603%, 455866%, 480078%, 510198%", movement_type_id: "1, 2, 5", codigo_iso: "NULL, -00"]
    label: "Monto Rechazadas Di"
    sql: ${TABLE}.monto ;;
  }
























































}
