
view: transacciones_pruebas {
  derived_table: {
    sql: Select Top 5000
        AA.Fecha,
        COUNT(Distinct AA.Cuentas) As 'Cuentas',
        COUNT(AA.Cuentas) As 'Transacciones',
        AA.Producto,
        AA.Clave_Cliente,
        SUM(AA.Importe_Pesos) As 'Importe_Pesos',
        SUM(AA.Monto_Intercambio) As 'Monto_Intercambio',
        AA.Comercio,
        AA.Clasificacion_Cliente,
        AA.TipoMovimiento,
        AA.Procesador
      From
        (
        Select Top 10000
          DATETRUNC(MONTH, CONVERT(Date,A.Fecha)) As 'Fecha',
          A.NumCuenta As 'Cuentas',
          A.Producto,
          A.ClaveCliente As 'Clave_Cliente',
          A.ImpTotalDEC As 'Importe_Pesos',
          A.ExchangeRateDEC As 'Monto_Intercambio',
          Case
          When B.Comercio Is Not Null Then B.razon_social
          Else A.DenMov
          End As 'Comercio',
          F.Clasificacion As 'Clasificacion_Cliente',
          Case
          When C.Categoria Is Not Null Then C.Categoria
          When A.TipoReg = 'A' Then 'Otros'
          When A.TipoReg = 'B' Then 'Comisiones'
          When A.TipoReg = 'C' Then 'POS'
          When A.TipoReg = 'D' Then 'Devoluciones'
          When A.TipoReg = 'F' Then 'Devoluciones'
          When A.TipoReg = 'G' Then 'Otros'
          When A.TipoReg = 'H' Then 'Otros'
          When A.TipoReg = 'I' Then 'Comisiones'
          When A.TipoReg = 'J' Then 'Devoluciones'
          When A.TipoReg = 'K' Then 'Devoluciones'
          When A.TipoReg = 'L' Then 'Comisiones'
          When A.TipoReg = 'M' Then 'Comisiones'
          When A.TipoReg = 'N' Then 'Comisiones'
          When A.TipoReg = 'O' Then 'Otros'
          When A.TipoReg = 'P' Then 'No Aplica'
          When A.TipoReg = 'Q' Then 'Comisiones'
          When A.TipoReg = 'R' Then 'ATM'
          When A.TipoReg = 'S' Then 'Comisiones'
          When A.TipoReg = 'T' Then 'Otros'
          When A.TipoReg = 'U' Then 'Devoluciones'
          When A.TipoReg = 'V' Then 'No Aplica'
          When A.TipoReg = 'W' Then 'No Aplica'
          When A.TipoReg = 'X' Then 'Devoluciones'
          When A.TipoReg = 'Y' Then 'Otros'
          When A.TipoReg = 'Z' Then 'Comisiones'
          End As 'TipoMovimiento',
          'PayStudio' As 'Procesador'
        From
          [broxelpaymentsws].[PrePayStudioMovements_v] A With (Nolock)
        Left Join
          [broxelco_rdg].[Comercio] B With (Nolock) On A.DenMov = B.Comercio
        Left Join
          [broxelco_rdg].[CatalogoCategoriaComercio] C On B.Categoria = C.Id
        Left Join
          [broxelco_rdg].[ClientesBroxel] E With (Nolock) On A.ClaveCliente = E.claveCliente
        Left Join
          [broxelco_rdg].[CatalogoClasificacionClientes] F With (Nolock) On E.ClasificacionCtesBroxel = F.Codigo
        Where
          CONVERT(Date,A.Fecha) Between '2023-01-01' And '2023-01-31'
        Union All

        Select Top 10000
          DATETRUNC(MONTH, A.FClear),
          B.Cuenta,
          A.CodPtoCuota,
          B.Cliente,
          Case
          When ISNULL(A.importe_pesos, 0) <> 0 Then A.importe_pesos
          Else A.ImpTotal
          End  As 'ImportePesos',
          Case
          When A.CodMont <> '484' Then (A.TasaIntercambio * (A.importe_pesos/A.ImpTotal))
          Else A.TasaIntercambio
          End As 'MontoIntercambio',
          Case
          When D.razon_social Is Null Then A.DenMov
          Else D.razon_social
          End As 'Comercio',
          E.Clasificacion,
          G.CategoriaTransaccion As 'TipoMovimiento',
          H.Nombre
        From
          [broxelco_rdg].[ind_movimientos] A With (Nolock)
        Left Join
          [recursos].[CatalogoCuentas] B With (Nolock) On A.NroRuc = B.Cuenta
        Left Join
          [broxelco_rdg].[ClientesBroxel] C With (Nolock) On B.Cliente = C.claveCliente
        Left Join
          [broxelco_rdg].[Comercio] D With (Nolock) On A.DenMov = D.Comercio
        Left Join
          [broxelco_rdg].[CatalogoClasificacionClientes] E With (Nolock) On C.ClasificacionCtesBroxel = E.Codigo
        Left Join
          [broxelco_rdg].[CatalogoCategoriaComercio] F With (Nolock) On D.Categoria = F.Id
        Left Join
          [broxelco_rdg].[CatalogoTipoTransaccion] G With (Nolock) On A.CodTransac = G.CodigoTransaccional
        Left Join
          [dbo].[Cat_Procesador] H With (Nolock) On B.Procesador = H.Nombre
        Where
          H.Nombre <> 'PayStudio' And A.FClear Between '2023-01-01' And '2023-01-31'
        )AA
      Where
        AA.Fecha = '2023-01-01'
      Group By
        AA.Fecha,
        AA.Producto,
        AA.Clave_Cliente,
        AA.Comercio,
        AA.Clasificacion_Cliente,
        AA.TipoMovimiento,
        AA.Procesador ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.Fecha ;;
  }

  dimension: cuentas {
    type: number
    sql: ${TABLE}.Cuentas ;;
  }

  dimension: transacciones {
    type: number
    sql: ${TABLE}.Transacciones ;;
  }

  dimension: producto {
    type: string
    sql: ${TABLE}.Producto ;;
  }

  dimension: clave_cliente {
    type: string
    sql: ${TABLE}.Clave_Cliente ;;
  }

  dimension: importe_pesos {
    type: number
    sql: ${TABLE}.Importe_Pesos ;;
  }

  dimension: monto_intercambio {
    type: number
    sql: ${TABLE}.Monto_Intercambio ;;
  }

  dimension: comercio {
    type: string
    sql: ${TABLE}.Comercio ;;
  }

  dimension: clasificacion_cliente {
    type: string
    sql: ${TABLE}.Clasificacion_Cliente ;;
  }

  dimension: tipo_movimiento {
    type: string
    sql: ${TABLE}.TipoMovimiento ;;
  }

  dimension: procesador {
    type: string
    sql: ${TABLE}.Procesador ;;
  }

  set: detail {
    fields: [
      fecha,
      cuentas,
      transacciones,
      producto,
      clave_cliente,
      importe_pesos,
      monto_intercambio,
      comercio,
      clasificacion_cliente,
      tipo_movimiento,
      procesador
    ]
  }
}
