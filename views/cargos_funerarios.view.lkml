
view: cargos_funerarios {
  derived_table: {
    sql: SELECT
        AA.FechaAsignacionCredito,
        AA.NumeroCredito,
        B.Cuenta as CuentaB2B,
        AA.FolioAsignacionCredito as FolioAsignacionB2B,
        AA.FechaEjecucionFolioB2B,
        A.FechaCreacion AS FechaCreacionCargo,
        A.FechaEjecucion AS FechaEjecucionCargo,
        A.Estado,
        A.ClaveCliente,
        A.Producto,
        CASE
        WHEN A.Producto = 'K303' THEN 'Equipa Tu Casa'
        WHEN A.Producto = 'K281' THEN 'Renueva'
        WHEN A.Producto IN ('K671', 'K672') THEN 'Repara'
        END AS Programa,
        A.Folio AS FolioCargo


      FROM
        `mgcp-10078073-bxl-dwh-prod.raw_Broxel.CargosSolicitudes` A
      LEFT JOIN
        `mgcp-10078073-bxl-dwh-prod.raw_Broxel.CargosDetalle` B ON A.Id = B.IdSolicitud
      LEFT JOIN
        (
        SELECT
          FechaCreacion AS FechaAsignacionCredito,
          NumeroCredito,
          ProductoB2B,
          CuentaB2B,
          FolioB2B AS FolioAsignacionCredito,
          FechaEjecucionFolioB2B,
          EstatusEntrega as EstatusCredito
        FROM
          `mgcp-10078073-bxl-bi-snd.BIOro.RepEquipaTuCasa`

        UNION ALL
        SELECT
          FechaCreacion,
          NumeroCredito,
          ProductoB2B,
          CuentaB2B,
          FolioB2B,
          FechaEjecucionFolioB2B,
          EstatusCredito
        FROM
          `mgcp-10078073-bxl-bi-snd.BIOro.RepRenuevaRepara`
        WHERE
          EstatusCredito = 'OK, ASIGNACION'
        )AA ON B.Cuenta = AA.CuentaB2B
      WHERE
       A.NombreComercio = '19CBX00750' AND A.Producto IN ('K303', 'K281', 'K671', 'K672') ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha_asignacion_credito {
    type: date
    datatype: date
    sql: ${TABLE}.FechaAsignacionCredito ;;
  }

  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }

  dimension: cuenta_b2_b {
    type: string
    sql: ${TABLE}.CuentaB2B ;;
  }

  dimension: folio_asignacion_b2_b {
    type: string
    sql: ${TABLE}.FolioAsignacionB2B ;;
  }

  dimension: fecha_ejecucion_folio_b2_b {
    type: date
    datatype: date
    sql: ${TABLE}.FechaEjecucionFolioB2B ;;
  }

  dimension_group: fecha_creacion_cargo {
    type: time
    datatype: datetime
    sql: ${TABLE}.FechaCreacionCargo ;;
  }

  dimension_group: fecha_ejecucion_cargo {
    type: time
    datatype: datetime
    sql: ${TABLE}.FechaEjecucionCargo ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}.Estado ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.ClaveCliente ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }

  dimension: folio_cargo {
    type: string
    sql: ${TABLE}.FolioCargo ;;
  }

  set: detail {
    fields: [
        fecha_asignacion_credito,
  numero_credito,
  cuenta_b2_b,
  folio_asignacion_b2_b,
  fecha_ejecucion_folio_b2_b,
  fecha_creacion_cargo_time,
  fecha_ejecucion_cargo_time,
  estado,
  clave_cliente,
producto,
programa,
folio_cargo
    ]
  }
}
