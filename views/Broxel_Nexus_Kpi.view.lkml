view: broxel_nexus_kpi {
  derived_table: {
    sql: SELECT
    A.Id,
    AA.AssignedToUserId,
    AA.AssignedTo,
    AB.CreatedByUserId,
    AB.CreatedBy,
    B.WorkItemType,
    B.Title,
    B.AreaPath,
    B.IterationPath,
    AC.Team,
    CAST(REPLACE(REPLACE(REPLACE(REPLACE(IIF(PATINDEX('%sprint%', LOWER(IterationPath)) = 0, NULL, RIGHT(IterationPath, (LEN(IterationPath) - PATINDEX('%sprint%', LOWER(IterationPath)) -6))), '\Sprint ', 0), 'Test ', 0), 'Core', 0), '0.', '') AS INT) AS 'Sprint',
    --Calculos de tiempos, del primer Ready a Done, si no hay Ready va del primer Committed a Done
    --CASE
    --WHEN MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END) IS NULL THEN DATEDIFF(DAY, MIN(CASE WHEN A.State = 'Committed' THEN A.ChangedDate END), MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END))
    --ELSE DATEDIFF(DAY, MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END), MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END))
    --END AS 'TimeElapsed',

    DATEDIFF(DAY,
        CASE
        WHEN
            CASE
            WHEN MIN(AD.FirstCommitterDate) IS NULL THEN MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END)
            ELSE MIN(AD.FirstCommitterDate)
            END IS NULL
        THEN MIN(CASE WHEN A.State = 'Committed' THEN A.ChangedDate END)
        ELSE
          CASE
          WHEN MIN(AD.FirstCommitterDate) IS NULL THEN MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END)
          ELSE MIN(AD.FirstCommitterDate)
          END
        END, MAX(CASE WHEN A.State = 'Done' THEN A.ChangedDate END)) AS 'TimeElapsed',











    --DATEDIFF(DAY, MIN(CASE WHEN AD.FirstCommitterDate IS NOT NULL THEN AD.FirstCommitterDate ELSE CASE WHEN A.State = 'Committed' THEN A.ChangedDate END END), MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END)) AS 'TimeElapsed',
    --DATEDIFF(DAY, MIN(CASE WHEN A.State = 'Committed' THEN A.ChangedDate END), MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END)) AS 'TimeElapsed',
    MIN(B.CreatedDate) AS CreatedDate,
    MIN(CASE WHEN A.State = 'Ready' THEN A.ChangedDate END) AS 'Ready',
    MIN(AD.FirstCommitterDate) AS 'FirstCommitterDate',
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
    LEFT JOIN
    (
    --Consulta que genera el Equipo, se va a relacionar con el User Id y A AssignedTo
    SELECT
    A.Nombre,
    A.Correo,
    B.Nombre AS 'Team',
    C.Id AS 'UserId'
    FROM
    dbo.Integrantes A WITH (NOLOCK)
    LEFT JOIN
    dbo.BroxelTeams B WITH (NOLOCK) ON A.BroxelTeamId = B.Id
    LEFT JOIN
    dbo."User" C WITH (NOLOCK) ON A.Correo = C.UniqueName
    )AC ON AA.AssignedToUserId = AC.UserId
    LEFT JOIN
    (
    SELECT
    w.Id AS WorkItemId,
    MIN(c.CommitterDate) AS FirstCommitterDate
    FROM
    dbo.WorkItem w
    LEFT JOIN
    dbo.PullRequestXWorkItem prxw ON w.Id = prxw.WorkItemsId
    LEFT JOIN
    dbo.PullRequestXCommit prxc ON prxw.PullRequestsPullRequestId = prxc.PullRequestsPullRequestId
    LEFT JOIN
    dbo.[Commit] c ON prxc.CommitsCommitId = c.CommitId AND prxc.CommitsRepositoryId = c.RepositoryId
    WHERE
    Id = 277302
    GROUP BY
    w.Id
    )AD ON A.Id = AD.WorkItemId
    WHERE
    CAST(REPLACE(REPLACE(REPLACE(REPLACE(IIF(PATINDEX('%sprint%', LOWER(IterationPath)) = 0, NULL, RIGHT(IterationPath, (LEN(IterationPath) - PATINDEX('%sprint%', LOWER(IterationPath)) -6))), '\Sprint ', 0), 'Test ', 0), 'Core', 0), '0.', '') AS INT) >= 132
    GROUP BY
    A.Id,
    AA.AssignedToUserId,
    AA.AssignedTo,
    AB.CreatedByUserId,
    AB.CreatedBy,
    B.WorkItemType,
    B.Title,
    B.AreaPath,
    B.IterationPath,
    AC.Team,
    CAST(REPLACE(REPLACE(REPLACE(REPLACE(IIF(PATINDEX('%sprint%', LOWER(IterationPath)) = 0, NULL, RIGHT(IterationPath, (LEN(IterationPath) - PATINDEX('%sprint%', LOWER(IterationPath)) -6))), '\Sprint ', 0), 'Test ', 0), 'Core', 0), '0.', '') AS INT) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: assigned_to_user_id {
    type: string
    sql: ${TABLE}.AssignedToUserId ;;
  }

  dimension: assigned_to {
    type: string
    sql: ${TABLE}.AssignedTo ;;
  }

  dimension: created_by_user_id {
    type: string
    sql: ${TABLE}.CreatedByUserId ;;
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

  dimension: team {
    type: string
    sql: ${TABLE}.Team ;;
  }

  dimension: sprint {
    type: string
    sql: ${TABLE}.Sprint ;;
  }

  dimension: time_elapsed {
    type: number
    sql: ${TABLE}.TimeElapsed ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.CreatedDate ;;
  }

  dimension_group: ready {
    type: time
    sql: ${TABLE}.Ready ;;
  }

  dimension_group: first_committer_date {
    type: time
    sql: ${TABLE}.FirstCommitterDate ;;
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
      assigned_to_user_id,
      assigned_to,
      created_by_user_id,
      created_by,
      work_item_type,
      title,
      area_path,
      iteration_path,
      team,
      sprint,
      time_elapsed,
      created_date_time,
      ready_time,
      first_committer_date_time,
      committed_time,
      done_time
    ]
  }
}
