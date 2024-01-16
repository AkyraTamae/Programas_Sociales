view: datos_financieros_1525 {
  sql_table_name: CNBV.DatosFinancieros_1525 ;;

  dimension: anio {
    type: number
    sql: ${TABLE}.Anio ;;
  }
  dimension: aprobadas_ci {
    type: number
    sql: ${TABLE}.Aprobadas_CI ;;
  }
  dimension: aprobadas_cn {
    type: number
    sql: ${TABLE}.Aprobadas_CN ;;
  }
  dimension: aprobadas_devoluciones_ci {
    type: number
    sql: ${TABLE}.Aprobadas_Devoluciones_CI ;;
  }
  dimension: aprobadas_devoluciones_cn {
    type: number
    sql: ${TABLE}.Aprobadas_Devoluciones_CN ;;
  }
  dimension: aprobadas_devoluciones_di {
    type: number
    sql: ${TABLE}.Aprobadas_Devoluciones_DI ;;
  }
  dimension: aprobadas_devoluciones_dn {
    type: number
    sql: ${TABLE}.Aprobadas_Devoluciones_DN ;;
  }
  dimension: aprobadas_di {
    type: number
    sql: ${TABLE}.Aprobadas_DI ;;
  }
  dimension: aprobadas_dn {
    type: number
    sql: ${TABLE}.Aprobadas_DN ;;
  }
  dimension: aprobadas_pagos_ci {
    type: number
    sql: ${TABLE}.Aprobadas_Pagos_CI ;;
  }
  dimension: aprobadas_pagos_cn {
    type: number
    sql: ${TABLE}.Aprobadas_Pagos_CN ;;
  }
  dimension: aprobadas_pagos_di {
    type: number
    sql: ${TABLE}.Aprobadas_Pagos_DI ;;
  }
  dimension: aprobadas_pagos_dn {
    type: number
    sql: ${TABLE}.Aprobadas_Pagos_DN ;;
  }
  dimension: devoluciones_ci {
    type: number
    sql: ${TABLE}.Devoluciones_CI ;;
  }
  dimension: devoluciones_cn {
    type: number
    sql: ${TABLE}.Devoluciones_CN ;;
  }
  dimension: devoluciones_di {
    type: number
    sql: ${TABLE}.Devoluciones_DI ;;
  }
  dimension: devoluciones_dn {
    type: number
    sql: ${TABLE}.Devoluciones_DN ;;
  }
  dimension: devoluciones_trimestre {
    type: number
    sql: ${TABLE}.Devoluciones_Trimestre ;;
  }
  dimension: devoluciones_usuario_ci {
    type: number
    sql: ${TABLE}.Devoluciones_Usuario_CI ;;
  }
  dimension: devoluciones_usuario_cn {
    type: number
    sql: ${TABLE}.Devoluciones_Usuario_CN ;;
  }
  dimension: devoluciones_usuario_di {
    type: number
    sql: ${TABLE}.Devoluciones_Usuario_DI ;;
  }
  dimension: devoluciones_usuario_dn {
    type: number
    sql: ${TABLE}.Devoluciones_Usuario_DN ;;
  }
  measure: monto_aprobadas_devoluciones_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_CI ;;
  }
  measure: monto_aprobadas_devoluciones_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_CN ;;
  }
  measure: monto_aprobadas_devoluciones_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_DI ;;
  }
  measure: monto_aprobadas_devoluciones_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_DN ;;
  }
  measure: monto_aprobadas_pagos_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Pagos_CI ;;
  }
  measure: monto_aprobadas_pagos_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Pagos_CN ;;
  }
  measure: monto_aprobadas_pagos_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Pagos_DI ;;
  }
  measure: monto_aprobadas_pagos_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobadas_Pagos_DN ;;
  }
  measure:monto_aprobado {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobado ;;
  }
  measure: monto_aprobado_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobado_CI ;;
  }
  measure: monto_aprobado_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobado_CN ;;
  }
  measure: monto_aprobado_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobado_DI ;;
  }
  measure: monto_aprobado_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Aprobado_DN ;;
  }
  measure: monto_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_CI ;;
  }
  measure: monto_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_CN ;;
  }
  measure: monto_devoluciones_trimestre {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Devoluciones_Trimestre ;;
  }
  measure: monto_devuelto_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Devuelto_CI ;;
  }
  measure: monto_devuelto_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Devuelto_CN ;;
  }
  measure: monto_devuelto_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Devuelto_DI ;;
  }
  measure: monto_devuelto_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Devuelto_DN ;;
  }
  measure: monto_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_DI ;;
  }
  measure: monto_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_DN ;;
  }
  measure: monto_pagos_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Pagos_CI ;;
  }
  measure: monto_pagos_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Pagos_CN ;;
  }
  measure: monto_pagos_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Pagos_DI ;;
  }
  measure: monto_pagos_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Pagos_DN ;;
  }
  measure: monto_rechazadas_devoluciones_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_CI ;;
  }
  measure: monto_rechazadas_devoluciones_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_DI ;;
  }
  measure: monto_rechazadas_devoluciones_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_DN ;;
  }
  measure: monto_rechazadas_pagos_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Pagos_CI ;;
  }
  measure: monto_rechazadas_pagos_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Pagos_CN ;;
  }
  measure: monto_rechazadas_pagos_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Pagos_DI ;;
  }
  measure: monto_rechazadas_pagos_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazadas_Pagos_DN ;;
  }
  measure: monto_rechazado {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazado ;;
  }
  measure: monto_rechazado_ci {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazado_CI ;;
  }
  measure: monto_rechazado_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazado_CN ;;
  }
  measure: monto_rechazado_di {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazado_DI ;;
  }
  measure: monto_rechazado_dn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazado_DN ;;
  }
  measure: monto_rechazas_devoluciones_cn {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto_Rechazas_Devoluciones_CN ;;
  }
  measure: operaciones_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_CI ;;
  }
  measure: operaciones_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_CN ;;
  }
  measure: operaciones_credito {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_Credito ;;
  }
  measure: operaciones_debito {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_Debito ;;
  }
  measure:operaciones_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_DI ;;
  }
  measure: operaciones_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Operaciones_DN ;;
  }
  dimension: pagos_ci {
    type: number
    sql: ${TABLE}.Pagos_CI ;;
  }
  dimension: pagos_cn {
    type: number
    sql: ${TABLE}.Pagos_CN ;;
  }
  dimension: pagos_di {
    type: number
    sql: ${TABLE}.Pagos_DI ;;
  }
  dimension: pagos_dn {
    type: number
    sql: ${TABLE}.Pagos_DN ;;
  }
  dimension: pagos_trimestre {
    type: number
    sql: ${TABLE}.Pagos_Trimestre ;;
  }
  dimension: pagos_usuario_ci {
    type: number
    sql: ${TABLE}.Pagos_Usuario_CI ;;
  }
  dimension: pagos_usuario_cn {
    type: number
    sql: ${TABLE}.Pagos_Usuario_CN ;;
  }
  dimension: pagos_usuario_di {
    type: number
    sql: ${TABLE}.Pagos_Usuario_DI ;;
  }
  dimension: pagos_usuario_dn {
    type: number
    sql: ${TABLE}.Pagos_Usuario_DN ;;
  }
  dimension: qanual {
    type: number
    sql: ${TABLE}.QAnual ;;
  }
  dimension: rechazadas_ci_cticr {
    type: number
    sql: ${TABLE}.Rechazadas_CI_cticr ;;
  }
  dimension: rechazadas_ci_ctidr {
    type: number
    sql: ${TABLE}.Rechazadas_CI_ctidr ;;
  }
  dimension: rechazadas_cn {
    type: number
    sql: ${TABLE}.Rechazadas_CN ;;
  }
  dimension: rechazadas_devoluciones_ci {
    type: number
    sql: ${TABLE}.Rechazadas_Devoluciones_CI ;;
  }
  dimension: rechazadas_devoluciones_cn {
    type: number
    sql: ${TABLE}.Rechazadas_Devoluciones_CN ;;
  }
  dimension: rechazadas_devoluciones_di {
    type: number
    sql: ${TABLE}.Rechazadas_Devoluciones_DI ;;
  }
  dimension: rechazadas_devoluciones_dn {
    type: number
    sql: ${TABLE}.Rechazadas_Devoluciones_DN ;;
  }
  dimension: rechazadas_dn {
    type: number
    sql: ${TABLE}.Rechazadas_DN ;;
  }
  dimension: rechazadas_pagos_ci {
    type: number
    sql: ${TABLE}.Rechazadas_Pagos_CI ;;
  }
  dimension: rechazadas_pagos_cn {
    type: number
    sql: ${TABLE}.Rechazadas_Pagos_CN ;;
  }
  dimension: rechazadas_pagos_di {
    type: number
    sql: ${TABLE}.Rechazadas_Pagos_DI ;;
  }
  dimension: rechazadas_pagos_dn {
    type: number
    sql: ${TABLE}.Rechazadas_Pagos_DN ;;
  }
  dimension: separador1 {
    type: string
    sql: ${TABLE}.Separador1 ;;
  }
  dimension: separador2 {
    type: string
    sql: ${TABLE}.Separador2 ;;
  }
  dimension: separador3 {
    type: string
    sql: ${TABLE}.Separador3 ;;
  }
  dimension: separador4 {
    type: string
    sql: ${TABLE}.Separador4 ;;
  }
  dimension: separador5 {
    type: string
    sql: ${TABLE}.Separador5 ;;
  }
  dimension: separador6 {
    type: string
    sql: ${TABLE}.Separador6 ;;
  }
  dimension: tarjetas_internacionales {
    type: number
    sql: ${TABLE}.Tarjetas_Internacionales ;;
  }
  dimension: tarjetas_nacionales {
    type: number
    sql: ${TABLE}.Tarjetas_Nacionales ;;
  }
  measure: trans_aprobadas {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Trans_Aprobadas ;;
  }
  measure: trans_rechazadas {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Trans_Rechazadas ;;
  }
  dimension: usuarios_unicos_ci {
    type: number
    sql: ${TABLE}.Usuarios_Unicos_CI ;;
  }
  dimension: usuarios_unicos_cn {
    type: number
    sql: ${TABLE}.Usuarios_Unicos_CN ;;
  }
  dimension: usuarios_unicos_di {
    type: number
    sql: ${TABLE}.Usuarios_Unicos_DI ;;
  }
  dimension: usuarios_unicos_dn {
    type: number
    sql: ${TABLE}.Usuarios_Unicos_DN ;;
  }
  dimension: usuarios_unicos_trimestre {
    type: number
    sql: ${TABLE}.Usuarios_UnicosTrimestre ;;
  }
  measure: count {
    type: count
  }
}
