
view: prueba_llamadas {
  derived_table: {
    sql: SELECT
        '+525514486653' AS Numero
      /*UNION ALL
      SELECT
        '+525519518327'
      UNION ALL
      SELECT
        '+527772233498'
      UNION ALL
      SELECT
        '+525514732593'
      UNION ALL
      SELECT
        '+525543572580'
      UNION ALL
      SELECT
        '+527772572237'
      UNION ALL
      SELECT
        '+527227010721'
      UNION ALL
      SELECT
        '+525533224970'
      UNION ALL
      SELECT
        '+525569056515'*/ ;;
  }

  #Mensaje de prueba para campaña SMS

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
