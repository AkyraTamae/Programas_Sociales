
view: hv_03_consulta_personalizada {
  derived_table: {
    sql: Select
        IdMovimiento,
        NoCredito,
        ConciliacionesEcoWebID,
        A.EstadosConciliacionEcoWebID,
        Estado,
        Descripcion
      From
        ConciliacionesEcoWeb a with(nolock)
      inner join CatEstadosConciliacionEcoWeb b with(nolock) on a.EstadosConciliacionEcoWebID=b.EstadosConciliacionEcoWebID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_movimiento {
    type: number
    sql: ${TABLE}.IdMovimiento ;;
  }

  dimension: no_credito {
    type: string
    sql: ${TABLE}.NoCredito ;;
  }

  dimension: conciliaciones_eco_web_id {
    type: number
    sql: ${TABLE}.ConciliacionesEcoWebID ;;
  }

  dimension: estados_conciliacion_eco_web_id {
    type: number
    sql: ${TABLE}.EstadosConciliacionEcoWebID ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  set: detail {
    fields: [
        id_movimiento,
	no_credito,
	conciliaciones_eco_web_id,
	estados_conciliacion_eco_web_id,
	estado,
	descripcion
    ]
  }
}
