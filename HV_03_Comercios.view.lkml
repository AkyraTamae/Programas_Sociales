
view: hv_03_comercios {
  derived_table: {
    sql: Select
        comercio,
        razon_social,
        rfc
      From broxelco_rdg.Comercio With (Nolock) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.comercio ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }

  set: detail {
    fields: [
        comercio,
	razon_social,
	rfc
    ]
  }
}
