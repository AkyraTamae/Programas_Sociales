view: soporte_comercios_infonavit {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIOro.SoporteComerciosInfonavit` ;;

  dimension: canal_entrada {
    type: number
    sql: ${TABLE}.CanalEntrada ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
  }
  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }
  dimension: estatus {
    type: string
    sql: ${TABLE}.Estatus ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension_group: mes_insercion {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MesInsercion ;;
  }
  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }
  dimension: subcategoria {
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }
  measure: count {
    type: count
  }
}
