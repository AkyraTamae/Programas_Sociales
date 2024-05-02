view: daily_tracking {
  sql_table_name: `mgcp-10078073-bxl-bi-snd.BIPlata.Daily_Tracking` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: data_set {
    type: string
    sql: ${TABLE}.DataSet ;;
  }
  dimension_group: fecha_corte {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaCorte ;;
  }
  dimension_group: fecha_creacion_tabla {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaCreacionTabla ;;
  }
  dimension_group: fecha_ultima_modificacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.FechaUltimaModificacion ;;
  }
  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }
  dimension: proyecto {
    type: string
    sql: ${TABLE}.Proyecto ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.Tipo ;;
  }
  dimension: total_registros {
    type: number
    sql: ${TABLE}.TotalRegistros ;;
  }
  dimension: total_registros_previo {
    type: number
    sql: ${TABLE}.TotalRegistrosPrevio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  #################################################

  dimension: estatus_de_carga {
    type: string
    sql:
    case
    when date_add(${TABLE}.FechaCorte, interval -1 day) = cast(${TABLE}.FechaCreacionTabla as date) then 'New Table'
    when ${TABLE}.TotalRegistros > ${TABLE}.TotalRegistrosPrevio then 'Correcto'
    when ${TABLE}.TotalRegistros = ${TABLE}.TotalRegistrosPrevio then 'Verificar carga, datos similares'
    when ${TABLE}.TotalRegistros < ${TABLE}.TotalRegistrosPrevio then 'Cantidad de registros inconsistentes'
    end ;;
  }

  #################################################

  #################### Filtros ####################

  measure: sum_correcto {
    type: sum
    filters: [fecha_corte_date: "after 2024-03-13", fecha_corte_date: "today", tipo: "Contar"]
    label: "Total Correctos"
    sql: case when ${estatus_de_carga} = 'Correcto' then 1 else 0 End  ;;
  }

  measure: sum_correcto_2 {
    type: sum
    hidden: yes
    filters: [fecha_corte_date: "after 2024-03-13", tipo: "Contar"]
    label: "Total Correctos"
    sql: case when ${estatus_de_carga} = 'Correcto' then 1 else 0 End  ;;
  }

  measure: sum_verificar_carga_datos_similares {
    type: sum
    filters: [fecha_corte_date: "after 2024-03-13", fecha_corte_date: "today", tipo: "Contar"]
    label: "Total Similares"
    sql: case when ${estatus_de_carga} = 'Verificar carga, datos similares' then 1 else 0 End  ;;
  }

  measure: sum_verificar_cantidad_de_registros_inconsistentes {
    type: sum
    filters: [fecha_corte_date: "after 2024-03-13", fecha_corte_date: "today", tipo: "Contar"]
    label: "Total Inconsistentes"
    sql: case when ${estatus_de_carga} = 'Cantidad de registros inconsistentes' then 1 else 0 End  ;;
  }

  measure: sum_new_tables {
    type: sum
    filters: [fecha_corte_date: "after 2024-03-13",fecha_corte_date: "today", tipo: "Contar"]
    label: "Total New Tables"
    sql: case when ${estatus_de_carga} = 'New Table' then 1 else 0 End  ;;
  }

  #################### Filtros ####################

  #################################################

  measure: aproach_percentage {
    type: number
    value_format: "0.00%"
    label: "%Cumplimiento"
    sql: ${sum_correcto_2} / ${count}  ;;
  }

  dimension: tipo_de_carga {
    type: string
    sql: left(${TABLE}.DataSet,strpos(${TABLE}.DataSet,'_') -1) ;;
  }

    ################################################


}
