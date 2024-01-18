
view: data_lineage {
  derived_table: {
    sql: Select
        A.IdTablero,
        A.IdOro,
        B.[Source] As 'SourceOro',
        B.[Schema] As 'SchemaOro',
        B.ServerId As 'ServerIdOro',
        B.TableName As 'TableNameOro',
        A.IdPlata,
        C.[Source] As 'SourcePlata',
        C.[Schema] As 'SchemaPlata',
        C.ServerId As 'ServerIdPlata',
        C.TableName As 'TableNamePlata',
        A.IdBronce,
        D.[Source] As 'SourceBronce',
        D.[Schema] As 'SchemaBronce',
        D.ServerId As 'ServerIdBronce',
        D.TableName As 'TableNameBronce',
        E.VisualizationTool,
        E.[Dashboard/ReportName],
        E.DatasetName,
        E.[DataSourceConnection],
        E.[Query/ViewName],
        E.[VisualizationElements],
        E.[Dashboard/ReportSchedule],
        E.Linkdashboard,
        E.[UsersViews/Visits],
        E.[Owner/Creator],
        E.[Purpose/Description],
        E.[Tags/Labels],
        E.DataLineageIdentifier,
        E.DataQualityMetrics,
        E.[Security/AccessControls],
        E.[Version/RevisionHistory],
        E.TeamsConsultingInfo,
        E.BusinessLead,
        E.LeaderBusinessLead,
        E.ReasonForThisInformation
      From
        [dbo].[UnionDataLineage] A With (Nolock)
      Left Join
        (
        Select
          *,
          'Oro' As 'Source'
        From
          [dbo].[CatTablasOro]
        )B On A.IdOro = B.IdOro
      Left Join
        (
        Select
          *,
          'Plata' As 'Source'
        From
          [dbo].[CatTablasPlata]
        )C On A.IdPlata = C.IdPlata
      Left Join
        (
        Select
          *,
          'Bronce' As 'Source'
        From
          [dbo].[CatTablasBronce]
        )D On A.IdBronce = D.IdBronce
      Left Join
        (
        Select
          *
        From
          [dbo].[CatTablerosLooker]
        )E On A.Idtablero = E.IdTablero ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_tablero {
    type: number
    sql: ${TABLE}.IdTablero ;;
  }

  dimension: id_oro {
    type: number
    sql: ${TABLE}.IdOro ;;
  }

  dimension: source_oro {
    type: string
    sql: ${TABLE}.SourceOro ;;
  }

  dimension: schema_oro {
    type: string
    sql: ${TABLE}.SchemaOro ;;
  }

  dimension: server_id_oro {
    type: string
    sql: ${TABLE}.ServerIdOro ;;
  }

  dimension: table_name_oro {
    type: string
    sql: ${TABLE}.TableNameOro ;;
  }

  dimension: id_plata {
    type: number
    sql: ${TABLE}.IdPlata ;;
  }

  dimension: source_plata {
    type: string
    sql: ${TABLE}.SourcePlata ;;
  }

  dimension: schema_plata {
    type: string
    sql: ${TABLE}.SchemaPlata ;;
  }

  dimension: server_id_plata {
    type: string
    sql: ${TABLE}.ServerIdPlata ;;
  }

  dimension: table_name_plata {
    type: string
    sql: ${TABLE}.TableNamePlata ;;
  }

  dimension: id_bronce {
    type: number
    sql: ${TABLE}.IdBronce ;;
  }

  dimension: source_bronce {
    type: string
    sql: ${TABLE}.SourceBronce ;;
  }

  dimension: schema_bronce {
    type: string
    sql: ${TABLE}.SchemaBronce ;;
  }

  dimension: server_id_bronce {
    type: string
    sql: ${TABLE}.ServerIdBronce ;;
  }

  dimension: table_name_bronce {
    type: string
    sql: ${TABLE}.TableNameBronce ;;
  }

  dimension: visualization_tool {
    type: string
    sql: ${TABLE}.VisualizationTool ;;
  }

  dimension: dashboardreport_name {
    type: string
    sql: ${TABLE}."Dashboard/ReportName" ;;
  }

  dimension: dataset_name {
    type: string
    sql: ${TABLE}.DatasetName ;;
  }

  dimension: data_source_connection {
    type: string
    sql: ${TABLE}.DataSourceConnection ;;
  }

  dimension: queryview_name {
    type: string
    sql: ${TABLE}."Query/ViewName" ;;
  }

  dimension: visualization_elements {
    type: string
    sql: ${TABLE}.VisualizationElements ;;
  }

  dimension: dashboardreport_schedule {
    type: string
    sql: ${TABLE}."Dashboard/ReportSchedule" ;;
  }

  dimension: linkdashboard {
    type: string
    sql: ${TABLE}.Linkdashboard ;;
  }

  dimension: users_viewsvisits {
    type: string
    sql: ${TABLE}."UsersViews/Visits" ;;
  }

  dimension: ownercreator {
    type: string
    sql: ${TABLE}."Owner/Creator" ;;
  }

  dimension: purposedescription {
    type: string
    sql: ${TABLE}."Purpose/Description" ;;
  }

  dimension: tagslabels {
    type: string
    sql: ${TABLE}."Tags/Labels" ;;
  }

  dimension: data_lineage_identifier {
    type: string
    sql: ${TABLE}.DataLineageIdentifier ;;
  }

  dimension: data_quality_metrics {
    type: string
    sql: ${TABLE}.DataQualityMetrics ;;
  }

  dimension: securityaccess_controls {
    type: string
    sql: ${TABLE}."Security/AccessControls" ;;
  }

  dimension: versionrevision_history {
    type: string
    sql: ${TABLE}."Version/RevisionHistory" ;;
  }

  dimension: teams_consulting_info {
    type: string
    sql: ${TABLE}.TeamsConsultingInfo ;;
  }

  dimension: business_lead {
    type: string
    sql: ${TABLE}.BusinessLead ;;
  }

  dimension: leader_business_lead {
    type: string
    sql: ${TABLE}.LeaderBusinessLead ;;
  }

  dimension: reason_for_this_information {
    type: string
    sql: ${TABLE}.ReasonForThisInformation ;;
  }

#############################Filtros#############################

  parameter: field_variable {
    type: unquoted
    label: "Source"

    allowed_value: {
      value: "SourceOro"
      label: "SourceOro"
    }
    allowed_value: {
      value: "SourcePlata"
      label: "SourcePlata"
    }
    allowed_value: {
      value: "SourceBronce"
      label: "SourceBronce"
    }
  }

  dimension: filter_source{
    label: "{% parameter field_variable %}"
    type: string
    sql:
      {% if field_variable._parameter_value == 'SourceOro' %} ${table_name_oro}
      {% elsif field_variable._parameter_value == 'SourcePlata' %} ${table_name_plata}
      {% elsif field_variable._parameter_value == 'SourceBronce' %} ${table_name_bronce}
      {% endif %} ;;
  }


#############################Filtros#############################



  set: detail {
    fields: [
        id_tablero,
  id_oro,
  source_oro,
  schema_oro,
  server_id_oro,
  table_name_oro,
  id_plata,
  source_plata,
  schema_plata,
  server_id_plata,
  table_name_plata,
  id_bronce,
  source_bronce,
  schema_bronce,
  server_id_bronce,
  table_name_bronce,
  visualization_tool,
  dashboardreport_name,
  dataset_name,
  data_source_connection,
  queryview_name,
  visualization_elements,
  dashboardreport_schedule,
  linkdashboard,
  users_viewsvisits,
  ownercreator,
  purposedescription,
  tagslabels,
  data_lineage_identifier,
  data_quality_metrics,
  securityaccess_controls,
  versionrevision_history,
  teams_consulting_info,
  business_lead,
  leader_business_lead,
  reason_for_this_information
    ]
  }
}
