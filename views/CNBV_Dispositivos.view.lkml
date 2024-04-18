view: cnbv_dispositivos {
  derived_table: {
    sql: Select
        ROW_NUMBER() OVER(PARTITION By AA.NumeroSerie Order By AA.FechaSituacion Asc) As Position,
        AA.NumeroSerie,
        AA.FechaSituacion
      From
        (

        Select
          CONCAT('L', REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( md.DeviceName,'LOOP21',''),'MPOS',''),'_TEST',''),'V2',''),'bk',''),'_',''),'MP',''),'XX',''),'X',''),'LOOP',''), 'XX', '')) As NumeroSerie,
          Case
          When REGEXP_INSTR(md.DeviceName, '9021400321') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9021400336') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900011') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900013') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900015') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900030') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900039') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900041') > 0 Then lm.CreationDate
          When REGEXP_INSTR(md.DeviceName, '9102900047') > 0 Then lm.CreationDate
          Else md.CreationDate
          End As FechaSituacion
        From
          `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.MerchantDevice` md
        Join
          `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchant` lm on md.IdMerchant = lm.Id
        Join
          `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchantDetail` lmd on lmd.MerchantId = lm.id
        Left Join
          `mgcp-10078073-bxl-dwh-prod.stg_BroxelCommon.LoopMerchantAddress` lma on lma.id = lmd.MerchantAddressID
        )AA ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: position {
    type: number
    sql: ${TABLE}.Position ;;
  }

  dimension: numero_serie {
    type: string
    sql: ${TABLE}.NumeroSerie ;;
  }

  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, month_name, month_num, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.FechaSituacion ;;
  }

  ######################################

  measure: total_dispositivos_no_acumulado {
    type: count_distinct
    filters: [position: "=1", numero_serie: "-L "]
    sql: ${TABLE}.NumeroSerie ;;
  }

  measure: total_dispositivos_acumulado {
    type: running_total
    sql: ${total_dispositivos_no_acumulado} ;;
  }

  dimension: mes_test {
    type: date
    label: "Date"
    order_by_field: fecha_month
    sql: ${TABLE}.Fecha ;;
    html: {{ rendered_value | date: "%B %Y" }};;
  }

  ######################################

  set: detail {
    fields: [
      position,
      numero_serie
    ]
  }
}
