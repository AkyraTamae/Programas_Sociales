
view: pruebas_lineage {
  derived_table: {
    sql: Select
        B.TableName As 'Oro',
        C.TableName As 'Plata',
        D.TableName As 'Bronce'
      From
        [dbo].[UnionDataLineage] A With (Nolock)
      Left Join
        (
        Select *
        From
          [dbo].[CatTablasOro] With (Nolock)
        )B On A.IdOro = B.IdOro
      Left Join
        (
        Select *
        From
          [dbo].[CatTablasPlata] With (Nolock)
        )C On A.IdPlata = C.IdPlata
      Left Join
        (
        Select *
        From
          [dbo].[CatTablasBronce] With (Nolock)
        )D On A.IdBronce = D.IdBronce ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: oro {
    type: string
    sql: ${TABLE}.Oro ;;
  }

  dimension: plata {
    type: string
    sql: ${TABLE}.Plata ;;
  }

  dimension: bronce {
    type: string
    sql: ${TABLE}.Bronce ;;
  }

  set: detail {
    fields: [
        oro,
	plata,
	bronce
    ]
  }
}
