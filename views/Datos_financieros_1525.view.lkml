view: datos_financieros_1525 {
  sql_table_name: CNBV.DatosFinancieros_1525 ;;

  dimension: anio {
    type: string
    label: "Año"
    sql: ${TABLE}.Anio ;;
  }
  measure: aprobadas_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_CI ;;
  }
  measure: aprobadas_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_CN ;;
  }
  measure: aprobadas_devoluciones_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Devoluciones_CI ;;
  }
  measure: aprobadas_devoluciones_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Devoluciones_CN ;;
  }
  measure: aprobadas_devoluciones_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Devoluciones_DI ;;
  }
  measure: aprobadas_devoluciones_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Devoluciones_DN ;;
  }
  measure: aprobadas_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_DI ;;
  }
  measure: aprobadas_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_DN ;;
  }
  measure: aprobadas_pagos_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Pagos_CI ;;
  }
  measure: aprobadas_pagos_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Pagos_CN ;;
  }
  measure: aprobadas_pagos_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Pagos_DI ;;
  }
  measure: aprobadas_pagos_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Aprobadas_Pagos_DN ;;
  }
  measure: devoluciones_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_CI ;;
  }
  measure: devoluciones_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_CN ;;
  }
  measure: devoluciones_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_DI ;;
  }
  measure: devoluciones_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_DN ;;
  }
  measure: devoluciones_trimestre {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_Trimestre ;;
  }
  measure: devoluciones_usuario_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_Usuario_CI ;;
  }
  measure: devoluciones_usuario_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_Usuario_CN ;;
  }
  measure: devoluciones_usuario_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Devoluciones_Usuario_DI ;;
  }
  measure: devoluciones_usuario_dn {
    type: sum
    value_format: "#,##0"
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
  measure: pagos_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_CI ;;
  }
  measure: pagos_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_CN ;;
  }
  measure: pagos_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_DI ;;
  }
  measure: pagos_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_DN ;;
  }
  measure: pagos_trimestre {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_Trimestre ;;
  }
  measure: pagos_usuario_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_Usuario_CI ;;
  }
  measure: pagos_usuario_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_Usuario_CN ;;
  }
  measure: pagos_usuario_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_Usuario_DI ;;
  }
  measure: pagos_usuario_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Pagos_Usuario_DN ;;
  }
  dimension: qanual {
    type: number
    sql: ${TABLE}.QAnual ;;
  }
  measure: rechazadas_ci_cticr {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_CI_cticr ;;
  }
  measure: rechazadas_ci_ctidr {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_CI_ctidr ;;
  }
  measure: rechazadas_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_CN ;;
  }
  measure: rechazadas_devoluciones_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Devoluciones_CI ;;
  }
  measure: rechazadas_devoluciones_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Devoluciones_CN ;;
  }
  measure: rechazadas_devoluciones_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Devoluciones_DI ;;
  }
  measure: rechazadas_devoluciones_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Devoluciones_DN ;;
  }
  measure: rechazadas_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_DN ;;
  }
  measure: rechazadas_pagos_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Pagos_CI ;;
  }
  measure: rechazadas_pagos_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Pagos_CN ;;
  }
  measure: rechazadas_pagos_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Rechazadas_Pagos_DI ;;
  }
  measure: rechazadas_pagos_dn {
    type: sum
    value_format: "#,##0"
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
  measure: tarjetas_internacionales {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Tarjetas_Internacionales ;;
  }
  measure: tarjetas_nacionales {
    type: sum
    value_format: "#,##0"
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
  measure: usuarios_unicos_ci {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Usuarios_Unicos_CI ;;
  }
  measure: usuarios_unicos_cn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Usuarios_Unicos_CN ;;
  }
  measure: usuarios_unicos_di {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Usuarios_Unicos_DI ;;
  }
  measure: usuarios_unicos_dn {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Usuarios_Unicos_DN ;;
  }
  measure: usuarios_unicos_trimestre {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.Usuarios_UnicosTrimestre ;;
  }
  measure: count {
    type: count
  }
}
