
view: replica_fn_17 {
  derived_table: {
    sql: select a.rfc AS RFC,
      a.razon_social,
      a.num_cuenta_clabe,
      a.numCuentaBroxel,
      c.code as Producto,
      c.disponible,
      count(b.comercio) afiliaciones,
      sum(d.liquidacion_comercio) pendienteLiquidacion,
      (select case when count(cppc.id) > 0 then 1 else 0 end from CatParamsProgramaComercio cppc join Comercio com on cppc.idComercio = com.idComercio where com.rfc = a.rfc and cppc.idPrograma = 5 limit 1) mejoravit,
      (select case when count(cppc.id) > 0 then 1 else 0 end from CatParamsProgramaComercio cppc join Comercio com on cppc.idComercio = com.idComercio where com.rfc = a.rfc and cppc.idPrograma = 10 limit 1) HipotecaVerde
      FROM Comercio a
      JOIN CatParamsProgramaComercio b ON a.Comercio = b.Comercio
      JOIN correr_disponibles c ON a.numCuentaBroxel = c.nruco
      left join bp_detalle_diario_comercio d on a.comercio = d.comercio and b.idPrograma = d.idPrograma and d.stPago is null
      where b.idPrograma in (5,10)
      group by a.numCuentaBroxel,
      c.code,
      a.rfc ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rfc {
    type: string
    sql: ${TABLE}.RFC ;;
  }

  dimension: razon_social {
    type: string
    sql: ${TABLE}.razon_social ;;
  }

  dimension: num_cuenta_clabe {
    type: string
    sql: ${TABLE}.num_cuenta_clabe ;;
  }

  dimension: num_cuenta_broxel {
    type: string
    sql: ${TABLE}.numCuentaBroxel ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: disponible {
    type: number
    sql: ${TABLE}.disponible ;;
  }

  dimension: afiliaciones {
    type: number
    sql: ${TABLE}.afiliaciones ;;
  }

  dimension: pendiente_liquidacion {
    type: number
    sql: ${TABLE}.pendienteLiquidacion ;;
  }

  dimension: mejoravit {
    type: number
    sql: ${TABLE}.mejoravit ;;
  }

  dimension: hipoteca_verde {
    type: number
    sql: ${TABLE}.HipotecaVerde ;;
  }

  set: detail {
    fields: [
        rfc,
	razon_social,
	num_cuenta_clabe,
	num_cuenta_broxel,
	producto,
	disponible,
	afiliaciones,
	pendiente_liquidacion,
	mejoravit,
	hipoteca_verde
    ]
  }
}
