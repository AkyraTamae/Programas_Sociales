view: broxel_core_operaciones {
  sql_table_name: dbo.BroxelCoreOperaciones ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension: estatus {
    type: number
    sql: ${TABLE}.Estatus ;;
  }
  dimension_group: fecha_creacion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FechaCreacion ;;
  }
  dimension: referencia {
    type: string
    sql: ${TABLE}.Referencia ;;
  }
  dimension: tipo_operacion {
    type: number
    sql: ${TABLE}.TipoOperacion ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
