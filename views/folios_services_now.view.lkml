view: folios_services_now {
  sql_table_name: dbo.FoliosServicesNow ;;

  dimension: alta_usuario_service_now {
    type: string
    sql: ${TABLE}.AltaUsuarioServiceNow ;;
  }
  dimension: area {
    type: string
    sql: ${TABLE}.Area ;;
  }
  dimension: assigment_shield {
    type: string
    sql: ${TABLE}.AssigmentShield ;;
  }
  dimension: assigned_to {
    type: string
    sql: ${TABLE}.AssignedTo ;;
  }
  dimension: assignment_group {
    type: string
    sql: ${TABLE}.AssignmentGroup ;;
  }
  dimension: caller {
    type: string
    sql: ${TABLE}.Caller ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Created ;;
  }
  dimension: createdby {
    type: string
    sql: ${TABLE}.Createdby ;;
  }
  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }
  dimension: folio {
    type: string
    sql: ${TABLE}.Folio ;;
  }
  dimension_group: opened {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Opened ;;
  }
  dimension: resolution_notes {
    type: string
    sql: ${TABLE}.ResolutionNotes ;;
  }
  dimension_group: resolved {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Resolved ;;
  }
  dimension: sladue {
    type: string
    sql: ${TABLE}.SLAdue ;;
  }
  dimension: slaestatus {
    type: string
    sql: ${TABLE}.SLAEstatus ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: state_development {
    type: string
    sql: ${TABLE}.StateDevelopment ;;
  }
  dimension: sub_type {
    type: string
    sql: ${TABLE}.SubType ;;
  }
  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }
  dimension: titulo_incidente {
    type: string
    sql: ${TABLE}.TituloIncidente ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Updated ;;
  }
  dimension: updatedby {
    type: string
    sql: ${TABLE}.Updatedby ;;
  }
  dimension: watch_list {
    type: string
    sql: ${TABLE}.WatchList ;;
  }
  dimension: work_notes {
    type: string
    sql: ${TABLE}.WorkNotes ;;
  }
  dimension: work_notes_list {
    type: string
    sql: ${TABLE}.WorkNotesList ;;
  }
  measure: count {
    type: count
  }
}
