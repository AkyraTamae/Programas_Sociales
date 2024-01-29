
view: catalogo_data_lineage_v2 {
  derived_table: {
    sql: Select *
      From
        (
        Select
          A.Idtablero,
          A.IdOro As 'Id',
          B.[Source],
          B.[Schema],
          B.ServerId,
          B.TableName
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
        Union All
        Select
          A.Idtablero,
          A.IdPlata,
          B.[Source],
          B.[Schema],
          B.ServerId,
          B.TableName
        From
          [dbo].[UnionDataLineage] A With (Nolock)
         Left Join
          (
          Select
          *,
          'Plata' As 'Source'
          From
            [dbo].[CatTablasPlata]
          )B On A.IdPlata = B.IdPlata
        Union All
        Select
          A.Idtablero,
          A.IdBronce,
          B.[Source],
          B.[Schema],
          B.ServerId,
          B.TableName
        From
          [dbo].[UnionDataLineage] A With (Nolock)
         Left Join
          (
          Select
          *,
          'Bronce' As 'Source'
          From
            [dbo].[CatTablasBronce]
          )B On A.IdBronce = B.IdBronce
        )A
      Left Join
        (
        Select
          *
        From
          [dbo].[CatTablerosLooker] With (Nolock)
        )B On A.Idtablero = B.IdTablero ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: idtablero {
    type: number
    sql: ${TABLE}.Idtablero ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.Source ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}."Schema" ;;
  }

  dimension: server_id {
    type: string
    sql: ${TABLE}.ServerId ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TableName ;;
  }

  dimension: id_tablero {
    type: number
    sql: ${TABLE}.IdTablero ;;
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

  set: detail {
    fields: [
        idtablero,
	id,
	source,
	schema,
	server_id,
	table_name,
	id_tablero,
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
