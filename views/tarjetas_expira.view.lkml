view: tarjetas_expira {
  sql_table_name: dbo.TarjetasExpira ;;

  dimension: fecha_expira {
    type: string
    sql: ${TABLE}.FechaExpira ;;
  }
  dimension: id_cat_tipo_tarjeta {
    type: number
    sql: ${TABLE}.IdCatTipoTarjeta ;;
  }
  dimension: id_identificador_tarjeta {
    type: number
    sql: ${TABLE}.IdIdentificadorTarjeta ;;
  }
  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }
  dimension: tarjeta {
    type: string
    sql: ${TABLE}.Tarjeta ;;
  }
  measure: count {
    type: count
  }
}
