
view: reporte_audios {
  derived_table: {
    sql: SELECT
        A.Id,
        GENERATE_UUID() AS RegistroLlamada,
        CAST(B.Fecha AS DATETIME ) AS FechaInicio,
        CAST(DATE_ADD(B.Fecha, INTERVAL 12 MINUTE) AS DATETIME ) AS FechaFin,
        D.NombreTitular,
        A.NumeroCuenta,
        C.credito,
        A.Comentarios,
        'samantha.cornejo@broxe_back' AS CorreoCAC,
        'SAMANTHA' AS Nombre,
        'CORNEJO' AS Paterno,
        'BAUTISTA' AS Materno,
        B.NombreArchivo,
        C.accionConsecutivo,
        CASE
        WHEN C.idEstatusCargo = 2 THEN 'EnProceso'
        WHEN C.idEstatusCargo = 3 THEN 'Exitoso'
        END AS EstatusCargo,
        CASE
        WHEN C.accionConsecutivo < 3 AND C.accionConsecutivo < 5 THEN '0'
        WHEN C.accionConsecutivo > 4 THEN '19.72' ELSE '15.08'
        END AS Monto,
        E.Descripcion,
        F.Descripcion AS Descripcion_2,
        CASE
        WHEN A.Producto = 'K182' THEN 'Mejoravit'
        WHEN A.Producto = 'K281' THEN 'Renueva'
        WHEN A.Producto = 'K303' THEN 'Equip Tu Casa'
        WHEN A.Producto = 'K671' THEN 'Repara'
        WHEN A.Producto = 'K672' THEN 'Repara'
        END AS Programa
      FROM
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCommon.LlamadasCallCenter` A
      JOIN
        `mgcp-10078073-bxl-bi-snd.BIPlata.MejoravitOutsourceCallsFaltantes` B ON  B.folio = A.folio
      JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelTPV.ControlCuentasLlamadasDetalle` C ON B.folio = C.referencia
      JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelTPV.ControlCuentasLlamadas` D ON D.credito = C.credito
      JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCommon.CategoriasServiceNow` E ON E.id = A.IdCategoria
      JOIN
        `mgcp-10078073-bxl-dwh-prod.cdc_BroxelCommon.CategoriasServiceNow` F ON F.Id = A.IdSubcategoria
      WHERE
        A.Producto IN ('K182', 'K281', 'K303', 'K671', 'K672') AND B.NombreArchivo LIKE '%London%' AND CAST(B.Fecha AS DATE) >= '2024-01-01'
      ORDER BY
        B.Fecha ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.Id ;;
  }

  dimension: registro_llamada {
    type: string
    sql: ${TABLE}.RegistroLlamada ;;
  }

  dimension_group: fecha_inicio {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: cast(${TABLE}.FechaInicio as date) ;;
  }

  dimension_group: fecha_fin {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: cast(${TABLE}.FechaFin as date) ;;
  }

  dimension: nombre_titular {
    type: string
    sql: ${TABLE}.NombreTitular ;;
  }

  dimension: numero_cuenta {
    type: string
    sql: ${TABLE}.NumeroCuenta ;;
  }

  dimension: credito {
    type: string
    sql: ${TABLE}.credito ;;
  }

  dimension: comentarios {
    type: string
    sql: ${TABLE}.Comentarios ;;
  }

  dimension: correo_cac {
    type: string
    sql: ${TABLE}.CorreoCAC ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.Nombre ;;
  }

  dimension: paterno {
    type: string
    sql: ${TABLE}.Paterno ;;
  }

  dimension: materno {
    type: string
    sql: ${TABLE}.Materno ;;
  }

  dimension: nombre_archivo {
    type: string
    sql: ${TABLE}.NombreArchivo ;;
  }

  dimension: accion_consecutivo {
    type: number
    sql: ${TABLE}.accionConsecutivo ;;
  }

  dimension: estatus_cargo {
    type: string
    sql: ${TABLE}.EstatusCargo ;;
  }

  dimension: monto {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Monto ;;
  }

  dimension: descripcion {
    type: string
    sql: ${TABLE}.Descripcion ;;
  }

  dimension: descripcion_2 {
    type: string
    sql: ${TABLE}.Descripcion_2 ;;
  }

  dimension: programa {
    type: string
    sql: ${TABLE}.Programa ;;
  }

  dimension: filtro {
    type: string
    sql:
      case
        when ${TABLE}.Descripcion_2 = 'Tarjeta comprometida' then 'Prevención de fraudes'
        when ${TABLE}.Descripcion_2 = 'Prevención de fraudes' then 'Prevención de fraudes'
        when ${TABLE}.Descripcion_2 = 'Error en autenticación' then 'Error en autenticación'
        when ${TABLE}.Descripcion_2 = 'A petición de usuarios' then 'A petición de usuarios'
        when ${TABLE}.Descripcion_2 = 'Cargos no reconocidos' then 'Cargos no reconocidos'
        when ${TABLE}.Descripcion_2 = 'Cambio Correo/Telefono' then 'Cambio de dato'
        else null
      end

        ;;
  }

  ###########################################

  dimension: fecha_inicio_txt {
    type: string
    label: "Fecha Inicio"
    sql: ${TABLE}.FechaInicio ;;
    html: {{ rendered_value | date: "%F %T" }};;
  }

  dimension: fecha_fin_txt {
    type: string
    label: "Fecha Fin"
    sql: ${TABLE}.FechaFin ;;
    html: {{ rendered_value | date: "%F %T" }};;
  }

  ###########################################

  set: detail {
    fields: [
        id,
  registro_llamada,
  nombre_titular,
  numero_cuenta,
  credito,
  comentarios,
  correo_cac,
  nombre,
  paterno,
  materno,
  nombre_archivo,
  accion_consecutivo,
  estatus_cargo,
  monto,
  descripcion,
  descripcion_2,
  programa
    ]
  }
}
