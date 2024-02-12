
view: astro_destino {
  derived_table: {
    sql: Select Top 100
        B.DescripcionIntento,
        CONCAT(A.MensajeID -1, '_', A.ConversacionID) As 'KeyID'
      From
        [Core].[TMensaje] A With (Nolock)
      Left Join
        [Core].[CatIntento] B With (Nolock) On A.IntentoID = B.IntentoID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: descripcion_intento {
    type: string
    sql: ${TABLE}.DescripcionIntento ;;
  }

  dimension: key_id {
    type: string
    sql: ${TABLE}.KeyID ;;
  }

  set: detail {
    fields: [
        descripcion_intento,
	key_id
    ]
  }
}
