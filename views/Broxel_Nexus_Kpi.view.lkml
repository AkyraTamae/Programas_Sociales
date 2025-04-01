view: broxel_nexus_kpi {
  derived_table: {
    sql: SELECT
        A.Id,
        --AA.AssignedToUserId,
        AA.AssignedTo,
        --AB.CreatedByUserId,
        AB.CreatedBy,
        B.WorkItemType,
        B.Title,
        B.AreaPath,
        B.IterationPath,
        CASE
        WHEN SUBSTRING(B.IterationPath, PATINDEX('%[0-9]%', B.IterationPath), 5) = 'Brox' THEN 0
        ELSE CAST(SUBSTRING(B.IterationPath, PATINDEX('%[0-9]%', B.IterationPath), 5) AS INT)
        END AS 'Sprint',
        --Calculos de tiempos, del primer Ready a Done, si no hay Ready va del primer Committed a Done
        CASE
        WHEN MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END) IS NULL THEN DATEDIFF(HOUR, MIN(CASE WHEN A.State = 'Committed' THEN A.ChangedDate END), MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END))
        ELSE DATEDIFF(HOUR, MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END), MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END))
        END AS 'TimeElapsed',
        MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END) AS 'Ready',
        MIN(CASE WHEN A.State = 'Committed' THEN A.ChangedDate END) AS 'Committed',
        MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END) AS 'Done'
      FROM
        dbo.Revision A WITH (NOLOCK)
      LEFT JOIN
        (
        --Usuario Asignación
        SELECT
          B.Id,
          A.Id AS 'AssignedToUserId',
          A.DisplayName AS 'AssignedTo'
        FROM
          dbo."User" A WITH (NOLOCK)
        LEFT JOIN
          dbo.WorkItem B WITH (NOLOCK) ON  A.Id = B.AssignedToId
        )AA ON A.Id = AA.Id
      LEFT JOIN
        (
        --Usuario Creación
        SELECT
          B.Id,
          A.Id AS 'CreatedByUserId',
          A.DisplayName AS 'CreatedBy'
        FROM
          dbo."User" A WITH (NOLOCK)
        LEFT JOIN
          dbo.WorkItem B WITH (NOLOCK) ON  A.Id = B.CreatedById
        )AB ON A.Id = AB.Id
      LEFT JOIN
      --Titulo, Área, Sprint
          dbo.WorkItem B WITH (NOLOCK) ON A.Id = B.Id
      WHERE
        SUBSTRING(B.IterationPath, PATINDEX('%[0-9]%', B.IterationPath), 5) != 'Brox'
      GROUP BY
        A.Id,
        AA.AssignedTo,
        AB.CreatedBy,
        B.WorkItemType,
        B.Title,
        B.AreaPath,
        B.IterationPath,
        CASE
        WHEN SUBSTRING(B.IterationPath, PATINDEX('%[0-9]%', B.IterationPath), 5) = 'Brox' THEN 0
        ELSE CAST(SUBSTRING(B.IterationPath, PATINDEX('%[0-9]%', B.IterationPath), 5) AS INT)
        END ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: assigned_to {
    type: string
    sql: ${TABLE}.AssignedTo ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.CreatedBy ;;
  }

  dimension: work_item_type {
    type: string
    sql: ${TABLE}.WorkItemType ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: area_path {
    type: string
    sql: ${TABLE}.AreaPath ;;
  }

  dimension: iteration_path {
    type: string
    sql: ${TABLE}.IterationPath ;;
  }

  dimension: sprint {
    type: number
    sql: ${TABLE}.Sprint ;;
  }

  dimension: time_elapsed {
    type: number
    sql: ${TABLE}.TimeElapsed ;;
  }

  dimension_group: ready {
    type: time
    sql: ${TABLE}.Ready ;;
  }

  dimension_group: committed {
    type: time
    sql: ${TABLE}.Committed ;;
  }

  dimension_group: done {
    type: time
    sql: ${TABLE}.Done ;;
  }

  ###########################################

  measure: sum_time_elapsed {
    type: sum
    sql: ${TABLE}.TimeElapsed ;;
  }

  measure: avg_time_elapsed {
    type: average
    sql: ${TABLE}.TimeElapsed ;;
  }

  ###########################################


  set: detail {
    fields: [
        id,
  assigned_to,
  created_by,
  work_item_type,
  title,
  area_path,
  iteration_path,
  sprint,
  time_elapsed,
  ready_time,
  committed_time,
  done_time
    ]
  }
}
