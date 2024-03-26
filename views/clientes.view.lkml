
view: clientes {
  derived_table: {
    sql: Select
        A.GrupoCliente,
        A.claveCliente,
        A.razonSocial,
        A.rfc,
        A.curpRepLegal As CURP,
        A.FechaCreacion As Fecha_Alta,
        Case When A.claveCliente Like '%Onbo%' Then A.claveCliente Else REGEXP_EXTRACT(A.claveCliente, '[A-Z]{3}') End As Tipo_Cliente,
        Case When A.claveCliente Like '%Onbo%' Then A.claveCliente Else Left(A.claveCliente, 2) End As Prefijo_Clave_Cliente,
        B.Productos
      From
        `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.clientesBroxel` A
      Left Join
        (
        Select
          clave_cliente,
          COUNT(Distinct producto) As Productos
        From
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.maquila`
        Where
          producto Not Like 'K4%'
        Group By
          clave_cliente
        )B On A.claveCliente = B.clave_cliente
      Where
        A.claveCliente In
        (
        Select
          Distinct clave_cliente
        From
          `mgcp-10078073-bxl-dwh-prod.stg_broxelco_rdg.maquila`
        Where
          producto Not Like 'K4%'
        ) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: grupo_cliente {
    type: string
    sql: ${TABLE}.GrupoCliente ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.claveCliente ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razonSocial ;;
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.rfc ;;
  }

  dimension: curp {
    type: string
    sql: ${TABLE}.CURP ;;
  }

  dimension_group: fecha_alta {
    type: time
    sql: ${TABLE}.Fecha_Alta ;;
  }

  dimension: tipo_cliente {
    type: string
    sql: ${TABLE}.Tipo_Cliente ;;
  }

  dimension: prefijo_clave_cliente {
    type: string
    sql: ${TABLE}.Prefijo_Clave_Cliente ;;
  }

  dimension: productos {
    type: number
    sql: ${TABLE}.Productos ;;
  }

  set: detail {
    fields: [
        grupo_cliente,
  clave_cliente,
  razon_social,
  rfc,
  curp,
  fecha_alta_time,
  tipo_cliente,
  prefijo_clave_cliente,
  productos
    ]
  }
}
