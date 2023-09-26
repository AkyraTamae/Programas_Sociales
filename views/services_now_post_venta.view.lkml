view: services_now_post_venta {
  sql_table_name: dbo.ServicesNowPostVenta ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: categoria {
    type: string
    sql: ${TABLE}.Categoria ;;
  }
  dimension: correo {
    type: string
    sql: ${TABLE}.Correo ;;
  }
  dimension: ejecutivo {
    type: string
    sql: ${TABLE}.Ejecutivo ;;
  }
  dimension: equipo {
    type: string
    sql: ${TABLE}.Equipo ;;
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
  dimension: puesto {
    type: string
    sql: ${TABLE}.Puesto ;;
  }
  dimension: subcategoria {
    type: string
    sql: ${TABLE}.Subcategoria ;;
  }
  dimension: tipodefolio {
    type: string
    sql: ${TABLE}.Tipodefolio ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
