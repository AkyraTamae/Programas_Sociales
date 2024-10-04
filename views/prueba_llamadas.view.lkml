
view: prueba_llamadas {
  derived_table: {
    sql: SELECT
        '+525514486653' AS Numero
      UNION ALL
      SELECT
        '+525519518327'
      UNION ALL
      SELECT
        '+527772233498' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: numero {
    type: string
    sql: ${TABLE}.Numero ;;
  }

  dimension: numero_label {
    type: string
    tags: ["phone","undefined"]
    sql: ${TABLE}.Numero ;;
  }

  set: detail {
    fields: [
        numero
    ]
  }
}
