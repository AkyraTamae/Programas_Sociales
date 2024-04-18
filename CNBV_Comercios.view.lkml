
view: cnbv_comercios {
  derived_table: {
    sql: Select 
        Count(Distinct(Username)) As TotalComercios,
        DATE_TRUNC(CAST(CreationDate As Date), Month) As Fecha
      From
        `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchant`
      Group By
        DATE_TRUNC(CAST(CreationDate As Date), Month) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: total_comercios {
    type: number
    sql: ${TABLE}.TotalComercios ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.Fecha ;;
  }

  set: detail {
    fields: [
        total_comercios,
	fecha
    ]
  }
}
