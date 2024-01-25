view: vl_02_fix {
    sql_table_name: `mgcp-10078073-bxl-bi-snd.BIPlata.vl02_fixed` ;;

    dimension: folio_de_reembolso {
      type: string
      sql: ${TABLE}.FolioDeReembolso ;;
    }
    dimension: max_cantidadvalesenviados {
      type: number
      sql: ${TABLE}.max_cantidadvalesenviados ;;
    }
    dimension: max_montoenvio {
      type: number
      sql: ${TABLE}.max_montoenvio ;;
    }
    dimension: sum_totalleido {
      type: number
      sql: ${TABLE}.sum_totalleido ;;
    }
    dimension: sum_valesleidos {
      type: number
      sql: ${TABLE}.sum_valesleidos ;;
    }
    measure: count {
      type: count
    }
    measure: sum_max_monot_fixed {
      type:  sum
      sql: ${max_montoenvio} ;;
    }
  }
