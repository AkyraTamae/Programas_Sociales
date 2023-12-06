view: PV04_monitoreo_B2B {

  derived_table: {
    sql: Select
        COUNT(1) As 'Cuentas',
        A.clave_cliente,
        A.producto,
        A.estado_operativo,
        AA.Productos
      From
        [broxelco_rdg].[maquila] A With (Nolock)
      Left Join
        (
        Select
          ClaveCliente,
          RazonSocialCliente,
          STRING_AGG(CodigoProducto, ';') As 'Productos'
        From
          recursos.CatalogoClientesProductos with(nolock)
        Where
          ClaveCliente like '%BRC%'
        Group By
          ClaveCliente,
          RazonSocialCliente
        )AA On A.clave_cliente = AA.ClaveCliente
      Where
        clave_cliente Like '%BRC%' And num_cuenta Is Not Null
      Group By
        A.clave_cliente,
        A.producto,
        A.estado_operativo,
        AA.ClaveCliente,
        AA.RazonSocialCliente,
        AA.Productos ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.clave_cliente ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.producto ;;
  }

  dimension: estado_operativo {
    type: string
    sql: ${TABLE}.estado_operativo ;;
  }

  dimension: productos {
    type: string
    sql: ${TABLE}.Productos ;;
  }

  set: detail {
    fields: [
      cuentas,
      clave_cliente,
      producto,
      estado_operativo,
      productos
    ]
  }

}
