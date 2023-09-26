view: surveymonkey_prueba {
  sql_table_name: dbo.SurveymonkeyPrueba ;;

  dimension: collector_id {
    type: number
    sql: ${TABLE}.collector_id ;;
  }
  dimension_group: date_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date_created ;;
  }
  dimension_group: date_modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date_modified ;;
  }
  dimension: porquenosdisteestacalificacion {
    type: string
    sql: ${TABLE}.Porquenosdisteestacalificacion ;;
  }
  dimension: quetanfacilfueresolverelmotivodetullamada {
    type: string
    sql: ${TABLE}.Quetanfacilfueresolverelmotivodetullamada ;;
  }
  dimension: quetansatisfechoestasconnuestroservicio {
    type: string
    sql: ${TABLE}.Quetansatisfechoestasconnuestroservicio ;;
  }
  dimension: respondent_id {
    type: number
    sql: ${TABLE}.respondent_id ;;
  }
  dimension: siturespuestafue_si {
    type: string
    sql: ${TABLE}.SiturespuestafueSI ;;
  }
  dimension: tusnecesidadesfueronresueltasalprimercontacto {
    type: string
    sql: ${TABLE}.Tusnecesidadesfueronresueltasalprimercontacto ;;
  }
  measure: count {
    type: count
  }
}
