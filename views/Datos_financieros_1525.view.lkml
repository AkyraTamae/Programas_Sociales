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
  dimension: monto_aprobadas_devoluciones_ci {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_CI ;;
  }
  dimension: monto_aprobadas_devoluciones_cn {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_CN ;;
  }
  dimension: monto_aprobadas_devoluciones_di {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_DI ;;
  }
  dimension: monto_aprobadas_devoluciones_dn {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Devoluciones_DN ;;
  }
  dimension: monto_aprobadas_pagos_ci {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Pagos_CI ;;
  }
  dimension: monto_aprobadas_pagos_cn {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Pagos_CN ;;
  }
  dimension: monto_aprobadas_pagos_di {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Pagos_DI ;;
  }
  dimension: monto_aprobadas_pagos_dn {
    type: number
    sql: ${TABLE}.Monto_Aprobadas_Pagos_DN ;;
  }
  dimension: monto_aprobado {
    type: number
    sql: ${TABLE}.Monto_Aprobado ;;
  }
  dimension: monto_aprobado_ci {
    type: number
    sql: ${TABLE}.Monto_Aprobado_CI ;;
  }
  dimension: monto_aprobado_cn {
    type: number
    sql: ${TABLE}.Monto_Aprobado_CN ;;
  }
  dimension: monto_aprobado_di {
    type: number
    sql: ${TABLE}.Monto_Aprobado_DI ;;
  }
  dimension: monto_aprobado_dn {
    type: number
    sql: ${TABLE}.Monto_Aprobado_DN ;;
  }
  dimension: monto_ci {
    type: number
    sql: ${TABLE}.Monto_CI ;;
  }
  dimension: monto_cn {
    type: number
    sql: ${TABLE}.Monto_CN ;;
  }
  dimension: monto_devoluciones_trimestre {
    type: number
    sql: ${TABLE}.Monto_Devoluciones_Trimestre ;;
  }
  dimension: monto_devuelto_ci {
    type: number
    sql: ${TABLE}.Monto_Devuelto_CI ;;
  }
  dimension: monto_devuelto_cn {
    type: number
    sql: ${TABLE}.Monto_Devuelto_CN ;;
  }
  dimension: monto_devuelto_di {
    type: number
    sql: ${TABLE}.Monto_Devuelto_DI ;;
  }
  dimension: monto_devuelto_dn {
    type: number
    sql: ${TABLE}.Monto_Devuelto_DN ;;
  }
  dimension: monto_di {
    type: number
    sql: ${TABLE}.Monto_DI ;;
  }
  dimension: monto_dn {
    type: number
    sql: ${TABLE}.Monto_DN ;;
  }
  dimension: monto_pagos_ci {
    type: number
    sql: ${TABLE}.Monto_Pagos_CI ;;
  }
  dimension: monto_pagos_cn {
    type: number
    sql: ${TABLE}.Monto_Pagos_CN ;;
  }
  dimension: monto_pagos_di {
    type: number
    sql: ${TABLE}.Monto_Pagos_DI ;;
  }
  dimension: monto_pagos_dn {
    type: number
    sql: ${TABLE}.Monto_Pagos_DN ;;
  }
  dimension: monto_rechazadas_devoluciones_ci {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_CI ;;
  }
  dimension: monto_rechazadas_devoluciones_di {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_DI ;;
  }
  dimension: monto_rechazadas_devoluciones_dn {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Devoluciones_DN ;;
  }
  dimension: monto_rechazadas_pagos_ci {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Pagos_CI ;;
  }
  dimension: monto_rechazadas_pagos_cn {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Pagos_CN ;;
  }
  dimension: monto_rechazadas_pagos_di {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Pagos_DI ;;
  }
  dimension: monto_rechazadas_pagos_dn {
    type: number
    sql: ${TABLE}.Monto_Rechazadas_Pagos_DN ;;
  }
  dimension: monto_rechazado {
    type: number
    sql: ${TABLE}.Monto_Rechazado ;;
  }
  dimension: monto_rechazado_ci {
    type: number
    sql: ${TABLE}.Monto_Rechazado_CI ;;
  }
  dimension: monto_rechazado_cn {
    type: number
    sql: ${TABLE}.Monto_Rechazado_CN ;;
  }
  dimension: monto_rechazado_di {
    type: number
    sql: ${TABLE}.Monto_Rechazado_DI ;;
  }
  dimension: monto_rechazado_dn {
    type: number
    sql: ${TABLE}.Monto_Rechazado_DN ;;
  }
  dimension: monto_rechazas_devoluciones_cn {
    type: number
    sql: ${TABLE}.Monto_Rechazas_Devoluciones_CN ;;
  }
  dimension: operaciones_ci {
    type: number
    sql: ${TABLE}.Operaciones_CI ;;
  }
  dimension: operaciones_cn {
    type: number
    sql: ${TABLE}.Operaciones_CN ;;
  }
  dimension: operaciones_credito {
    type: number
    sql: ${TABLE}.Operaciones_Credito ;;
  }
  dimension: operaciones_debito {
    type: number
    sql: ${TABLE}.Operaciones_Debito ;;
  }
  dimension: operaciones_di {
    type: number
    sql: ${TABLE}.Operaciones_DI ;;
  }
  dimension: operaciones_dn {
    type: number
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
  dimension: trans_aprobadas {
    type: number
    sql: ${TABLE}.Trans_Aprobadas ;;
  }
  dimension: trans_rechazadas {
    type: number
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
