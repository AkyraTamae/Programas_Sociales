view: sesion_v5 {
  sql_table_name: dbo.SesionV5 ;;

  dimension: broxeluserid {
    type: string
    sql: ${TABLE}.broxeluserid ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: lastnamefather {
    type: string
    sql: ${TABLE}.lastnamefather ;;
  }
  dimension: lastnamemother {
    type: string
    sql: ${TABLE}.lastnamemother ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
