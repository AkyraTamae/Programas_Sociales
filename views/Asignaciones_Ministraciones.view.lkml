
view: asignaciones_ministraciones {
  derived_table: {
    sql: --Asignaciones
      SELECT DISTINCT
        rf.NumeroCuenta,
        cc.NumeroCredito,
        FechaAcreditacion,
        cc.MontoCredito,
        ds.fechaEjecucion,
        ds.fechaCreacion,
        ds.folio AS FolioAsignacionLinea,
        AA.MontoMinistrado,
        AA.Ministraciones,
        dis.disponible
      FROM
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.CreditoYoConstruyo` cc
      JOIN
        `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.RespuestaFondeador` rf  ON rf.IdCreditoYoConstruyo = cc.Id
      LEFT JOIN
        (
        SELECT
          *
        FROM
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.dispersionesInternas`
        UNION DISTINCT
        SELECT
          * EXCEPT(_sequence_num, _is_deleted, _row_id, _source_timestamp)
        FROM
          `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.dispersionesInternas_20231115`
        )di ON rf.NumeroCuenta = di.cuenta AND di.producto = 'K258' AND di.claveCliente = '16BRC00403'
      LEFT JOIN
        (
        SELECT
          *
        FROM
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.dispersionesSolicitudes`
        UNION DISTINCT
        SELECT
          * EXCEPT(_sequence_num, _is_deleted, _row_id, _source_timestamp)
        FROM
          `mgcp-10078073-bxl-dwh-prod.cdc_broxelco_rdg.dispersionesSolicitudes_20231115`
        )ds ON rf.FolioAsignacionLinea = ds.folio AND ds.producto = 'K258' AND ds.claveCliente ='16BRC00403'
      LEFT JOIN
        (
          --Minisraciones
        SELECT
          NumeroCuenta,
          Dispersiones.NumeroCredito,
          SUM(MC.Monto) AS MontoMinistrado,
          COUNT(1) AS Ministraciones
        FROM
          `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.MovimientoYoConstruyo` MC
        LEFT JOIN
          `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.DispersionYoConstruyo` Dispersiones ON MC.IdDispersionMinistracion = Dispersiones.Id
        LEFT JOIN
          `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.CreditoYoConstruyo` CC ON Dispersiones.NumeroCredito = CC.NumeroCredito
        LEFT JOIN
          `mgcp-10078073-bxl-dwh-prod.stg_YoConstruyo.RespuestaFondeador` RF ON RF.IdCreditoYoConstruyo = CC.Id
        WHERE
          NumeroMinistracion IS NOT NULL AND UserResponse IN ('Transacción exitosa', 'Transacción Exitosa', 'SPEI REALIZADO.', 'SPEI REALIZADO') AND MC.Success IS TRUE
        GROUP BY
          NumeroCuenta,
          Dispersiones.NumeroCredito
        )AA ON rf.NumeroCuenta = AA.NumeroCuenta AND rf.NumeroCredito = AA.NumeroCredito
      LEFT JOIN
        (
        SELECT
          A.Cuenta,
          CAST(A.Fecha AS DATE) AS Fecha,
          A.Disponible
        FROM
          `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCommon.Disponibles` A
        LEFT JOIN
          (
          SELECT
            Cuenta,
            MAX(CAST(Fecha AS DATE)) AS Fecha
          FROM
            `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCommon.Disponibles`
          GROUP BY
            Cuenta
          )B ON CAST(A.Fecha AS DATE) = B.Fecha AND A.Cuenta = B.Cuenta
        WHERE
          B.Fecha IS NOT NULL
        )dis ON rf.NumeroCuenta = dis.Cuenta
      WHERE
        rf.NumeroCuenta IS NOT NULL AND FolioAsignacionLinea IS NOT NULL AND di.codigoRespuestaPOS = '-1' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }

  dimension: numero_credito {
    type: string
    sql: ${TABLE}.NumeroCredito ;;
  }

  dimension_group: fecha_acreditacion {
    type: time
    datatype: datetime
    sql: ${TABLE}.FechaAcreditacion ;;
  }

  dimension: monto_credito {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoCredito ;;
  }

  dimension_group: fecha_ejecucion {
    type: time
    datatype: datetime
    sql: ${TABLE}.fechaEjecucion ;;
  }

  dimension_group: fecha_creacion {
    type: time
    datatype: datetime
    sql: ${TABLE}.fechaCreacion ;;
  }

  dimension: monto_ministrado {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMinistrado ;;
  }

  dimension: folio_asignacion_linea {
    type: number
    sql: ${TABLE}.FolioAsignacionLinea ;;
  }

  dimension: ministraciones {
    type: number
    sql: ${TABLE}.Ministraciones ;;
  }

  dimension: disponible {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.disponible ;;
  }

  ############################################################

  measure: sum_monto_credito {
    type: sum
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoCredito ;;
  }

  ############################################################

  set: detail {
    fields: [
        numero_cuenta,
  numero_credito,
  fecha_acreditacion_time,
  monto_credito,
  fecha_ejecucion_time,
  fecha_creacion_time,
  folio_asignacion_linea,
  monto_ministrado,
  ministraciones,
  disponible
    ]
  }
}
