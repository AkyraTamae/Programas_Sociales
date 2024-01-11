
view: remesas {
  derived_table: {
    sql: Select
        CONVERT(Date,AA.FechaCreacion) As 'Date',
        AA.ProductoOrigen,
        AA.ProductoDestino,
        AA.Receptor_1,
        AA.Emisor_2,
        AA.Estatus_3,
        AA.Comision_4,
        AA.MontoUSD_Op,
        AA.MontoMXN_Op,
        AA.ComisionUSD,
        AA.ComisionMXN,
        IIF(AA.Receptor_1 = 4 And AA.Emisor_2 = 4 And AA.Estatus_3 = 0, 'Success','Denied') As 'Status_Op',
        Case
        When ZZ.FoundRmtt Is Not Null Then ZZ.FoundRmtt
        When ZZZ.FoundRmtt Is Not Null Then ZZZ.FoundRmtt
        When ZZA.FoundRmttC Is Not Null Then ZZA.FoundRmttC
        When ZZB.FoundRmttC Is Not Null Then ZZB.FoundRmttC
        End As 'Status_Rmt',
        AA.CuentaOrigen,
        AA.CuentaDestino,
        AA.IdOperacion,
        AA.IdMeltsan,
        Case
        When ZZ.RemittanceKey Is Not Null Then ZZ.RemittanceKey
        When ZZZ.RemittanceKey Is Not Null Then ZZZ.RemittanceKey
        When ZZA.RemittanceKey Is Not Null Then ZZA.RemittanceKey
        When ZZB.RemittanceKey Is Not Null Then ZZB.RemittanceKey
        End As 'RemittanceKey',
        AA.AuthNum,
        Case
        When ZZ.TxnDate Is Not Null Then ZZ.TxnDate
        When ZZZ.TxnDate Is Not Null Then ZZZ.TxnDate
        When ZZA.TxnDate Is Not Null Then ZZA.TxnDate
        When ZZB.TxnDate Is Not Null Then ZZB.TxnDate
        End As 'TxnDate',
        Case
        When ZZ.AmountUSD Is Not Null Then ZZ.AmountUSD
        When ZZZ.AmountUSD Is Not Null Then ZZZ.AmountUSD
        When ZZA.AmountUSD Is Not Null Then ZZA.AmountUSD
        When ZZB.AmountUSD Is Not Null Then ZZB.AmountUSD
        End As 'AmountUSD',
        AA.MontoMXN As 'AmountMXN',
        /*Case
        When ZZ.AmountMXN Is Not Null Then ZZ.AmountMXN
        When ZZZ.AmountMXN Is Not Null Then ZZZ.AmountMXN
        When ZZA.AmountMXN Is Not Null Then ZZA.AmountMXN
        When ZZB.AmountMXN Is Not Null Then ZZB.AmountMXN
        End As 'AmountMXN',*/
        AA.SenderCountry,
        AA.SenderAccountNum,
        AA.SenderName,
        AA.SenderEmail,
        AA.RecipientCountry,
        AA.RecipientAccountNum,
        AA.RecipientName,
        AA.RecipientEmail,
        Case
        When ZZ.primarykey Is Not Null Then ZZ.primarykey
        When ZZZ.primarykey Is Not Null Then ZZZ.primarykey
        When ZZA.primarykey Is Not Null Then ZZA.primarykey
        When ZZB.primarykey Is Not Null Then ZZB.primarykey
        End As 'primarykey'
      From
        (
        Select
          A.*,
          C.Producto As 'ProductoOrigen',
          E.Producto As 'ProductoDestino',
          CONCAT(RANK()Over(Partition By CONCAT(A.CuentaOrigen,'_',CONVERT(Decimal(20,1),A.MontoMXN),'_',REPLACE(CONVERT(Varchar(10),A.FechaCreacion,101),'/','')) Order By A.IdMeltsan),'-',A.CuentaOrigen,'_',CONVERT(Decimal(20,1),A.MontoMXN),'_',REPLACE(CONVERT(Varchar(10),A.FechaCreacion,101),'/','')) As 'primarykey',
          Case
          When B.GalileoAccountId Is Null Then D.GalileoAccountId
          Else B.GalileoAccountId
          End As 'AuthNum',
          A.MontoMXN As 'AmountMXN',
          Case
          When B.GAL Is Null Then A.CuentaOrigen
          Else B.GAL
          End As 'SenderAccountNum',
          Case
          When B.GAL IS Null Then 'MXN'
          Else 'USD'
          End As 'SenderCountry',
          C.Titular As 'SenderName',
          C.CorreoContacto As 'SenderEmail',
          Case
          When D.GAL Is Null Then A.CuentaDestino
          Else D.GAL
          End As 'RecipientAccountNum',
          Case
          When D.GAL Is Null Then 'MXN'
          Else 'USD'
          End As 'RecipientCountry',
          E.Titular As 'RecipientName',
          E.CorreoContacto As 'RecipientEmail',
          F.Receptor_1,
          F.Emisor_2,
          F.Estatus_3,
          F.Comision_4,
          F.MontoUSD_Op,
          F.MontoMXN_Op,
          F.ComisionUSD,
          F.ComisionMXN
        From
          [dbo].[BroxelCoreRemesas] A With (Nolock)
        --Código GAL Sender
        Left Join
          (
          Select
            PRN,
            MAX(GalileoAccountId) As 'GalileoAccountId',
            CONCAT('GAL',MAX(ProgramId),MAX(GalileoAccountId),MAX(CardId)) As 'GAL'
          From
            [broxelco_rdg].[ind_movi_galileo_post_tran] With (Nolock)
          Group By
            PRN,
            GalileoAccountId
          ) B On A.CuentaOrigen = B.PRN
          --Nombre y Correo Sender
        Left Join
          (
          Select Distinct
            A.Producto,
            Case
            When LEN(A.Titular) > LEN(B.razonSocial) Then A.Titular
            When LEN(B.razonSocial) > LEN(C.nombre_completo) Then B.razonSocial
            When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
            Else C.nombre_completo
            End As 'Titular',
            A.Cuenta,
            LOWER(Case
            When B.CorreoContacto Is Null Or B.CorreoContacto = '' Then C.Email
            Else B.CorreoContacto
            End) As 'CorreoContacto'
          From
            [recursos].[CatalogoCuentas] A With (Nolock)
          Left Join
            [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
          Left Join
            (
            Select
              nombre_completo,
              cuenta,
              Email
            From
              [broxelco_rdg].[accessos_clientes] With (Nolock)
            Union
            Select
              nombre_completo,
              cuenta,
              Email
            From
              [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
            ) C On A.Cuenta = C.cuenta
          ) C On A.CuentaOrigen = C.Cuenta
        --Código GAL Recipient
        Left Join
          (
          Select
            PRN,
            MAX(GalileoAccountId) As 'GalileoAccountId',
            CONCAT('GAL',MAX(ProgramId),MAX(GalileoAccountId),MAX(CardId)) As 'GAL'
          From
            [broxelco_rdg].[ind_movi_galileo_post_tran] With (Nolock)
          Group By
            PRN,
            GalileoAccountId
          ) D On A.CuentaDestino = D.PRN
        --Nombre y Correo Recipient
        Left Join
          (
          Select Distinct
            A.Producto,
            Case
            When LEN(A.Titular) > LEN(B.razonSocial) Then A.Titular
            When LEN(B.razonSocial) > LEN(C.nombre_completo) Then B.razonSocial
            When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
            Else C.nombre_completo
            End As 'Titular',
            A.Cuenta,
            LOWER(Case
            When B.CorreoContacto Is Null Or B.CorreoContacto = '' Then C.Email
            Else B.CorreoContacto
            End) As 'CorreoContacto'
          From
            [recursos].[CatalogoCuentas] A With (Nolock)
          Left Join
            [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
          Left Join
            (
            Select
              nombre_completo,
              cuenta,
              Email
            From
              [broxelco_rdg].[accessos_clientes] With (Nolock)
            Union
            Select
              nombre_completo,
              cuenta,
              Email
            From
              [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
            ) C On A.Cuenta = C.cuenta
          ) E On A.CuentaDestino = E.Cuenta
        --Estatus de remesa (juego de códigos)
        Left Join
          (
          Select
            IdOperacion,
            MAX(IIF(Tipo = 1, Estatus, 0)) As 'Receptor_1',
            MAX(IIF(Tipo = 2, Estatus, 0)) As 'Emisor_2',
            MAX(IIF(Tipo = 3, Estatus, 0)) As 'Estatus_3',
            MAX(IIF(Tipo = 4, Estatus, 0)) As 'Comision_4',
            MAX(IIF(Procesador = 7 And Tipo Not In (4,3), Monto, 0)) As 'MontoUSD_Op',
            MAX(IIF(Procesador <> 7 And Tipo not in (4,3),Monto,0)) As 'MontoMXN_Op',
            MAX(IIF(Procesador = 7 And Tipo = 4,Monto,0)) As 'ComisionUSD',
            MAX(IIF(Procesador <> 7 And Tipo = 4,Monto,0)) As 'ComisionMXN'
          From
            [dbo].[OperacionesDetalle] With (Nolock)
          Group By
            IdOperacion
          )F On A.IdOperacion = F.IdOperacion
        )AA
        Left Join
          (
          Select
            CONCAT(RANK()Over(Partition By CONCAT(Case When B.Cuenta Is NUll Then A.IdUserOrigin Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','')) Order BY A.RemittanceKey),'-',Case When B.Cuenta Is NUll Then A.IdUserOrigin Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','')) As 'primarykey',
            'Success' As 'FoundRmtt',
            A.IdRemittance,
            A.RemittanceKey,
            A.IdUserOrigin,
            A.IdCurrencyOrigin,
            A.IdCurrencyDestination,
            DATEADD(HOUR,-6,A.DateRegister) As 'DateMXN',
            REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','') As 'TxnDate',
            CONVERT(Decimal(20,2),A.RemittanceAmount) As 'RemittanceAmount',
            CONVERT(Decimal(20,2),A.BeneficiaryAmount,0) As 'BeneficiaryAmount',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOrigin = 'MXN' Then A.BeneficiaryAmount
            ELSE A.BeneficiaryAmount/A.FinalExchangeAmount
            End) As 'AmountUSD',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount
            Else A.BeneficiaryAmount
            End) As 'AmountMXN'
          From
            [dbo].[Remittance] A With (Nolock)
        Left Join
          (
          Select *
          From
            (
            Select Distinct
              RANK()Over(Partition By CONCAT(A.Cuenta, LOWER(Case When C.Email Is Null Or C.Email = '' Then B.CorreoContacto Else C.Email End )) Order By Case When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular End) As 'DistinctKey',
              Case
              When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
              When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular
              End As 'Titular',
              A.Cuenta,
              LOWER(Case
              When C.Email Is Null Or C.Email = '' Then B.CorreoContacto
              Else C.Email
              End) As 'CorreoContacto',
              Case
              When LEN(A.Cuenta) > 10 Then 'USD'
              Else 'MXN'
              End As 'UserType'
            From
              [recursos].[CatalogoCuentas] A With (Nolock)
            Left Join
              [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
            Left Join
              (
              Select
                nombre_completo,
                cuenta,
                Email
              From
                [broxelco_rdg].[accessos_clientes] With (Nolock)
              Union
              Select
                nombre_completo,
                cuenta,
                Email
              From
                [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
              ) C On A.Cuenta = C.cuenta
            Where
              C.Cuenta Not Like '%S%'
            ) AA
          Where
            AA.DistinctKey = 1
          )B On CONCAT(A.IdUserOrigin,A.IdCurrencyOrigin) = CONCAT(B.CorreoContacto,B.UserType)
        )ZZ On AA.primaryKey = ZZ.primarykey

        Left Join
          (
          Select
            CONCAT(RANK()Over(Partition By CONCAT(Case When B.Cuenta Is NUll Then A.IdUserOrigin Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-5,A.DateRegister),101),'/','')) Order BY A.RemittanceKey),'-',Case When B.Cuenta Is NUll Then A.IdUserOrigin Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-5,A.DateRegister),101),'/','')) As 'primarykey',
            'Success' As 'FoundRmtt',
            A.IdRemittance,
            A.RemittanceKey,
            A.IdUserOrigin,
            A.IdCurrencyOrigin,
            A.IdCurrencyDestination,
            DATEADD(HOUR,-6,A.DateRegister) As 'DateMXN',
            REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','') As 'TxnDate',
            CONVERT(Decimal(20,2),A.RemittanceAmount) As 'RemittanceAmount',
            CONVERT(Decimal(20,2),A.BeneficiaryAmount,0) As 'BeneficiaryAmount',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOrigin = 'MXN' Then A.BeneficiaryAmount
            ELSE A.BeneficiaryAmount/A.FinalExchangeAmount
            End) As 'AmountUSD',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOrigin = 'MXN' Then A.RemittanceAmount
            Else A.BeneficiaryAmount
            End) As 'AmountMXN'
          From
            [dbo].[Remittance] A With (Nolock)
          Left Join
            (
            Select *
            From
              (
              Select Distinct
                RANK()Over(Partition By CONCAT(A.Cuenta, LOWER(Case When C.Email Is Null Or C.Email = '' Then B.CorreoContacto Else C.Email End )) Order By Case When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular End) As 'DistinctKey',
                Case
                When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
                When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular
                End As 'Titular',
                A.Cuenta,
                LOWER(Case
                When C.Email Is Null Or C.Email = '' Then B.CorreoContacto
                Else C.Email
                End) As 'CorreoContacto',
                Case
                When LEN(A.Cuenta) > 10 Then 'USD'
                Else 'MXN'
                End As 'UserType'
              From
                [recursos].[CatalogoCuentas] A With (Nolock)
              Left Join
                [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
              Left Join
                (
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes] With (Nolock)
                Union
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
                ) C On A.Cuenta = C.cuenta
              Where
                C.Cuenta Not Like '%S%'
              ) AA
            Where
              AA.DistinctKey = 1
            )B On CONCAT(A.IdUserOrigin,A.IdCurrencyOrigin) = CONCAT(B.CorreoContacto,B.UserType)
          )ZZZ On AA.primaryKey = ZZZ.primarykey
        Left Join
          (
          Select
            CONCAT(RANK()Over(Partition By CONCAT(Case When B.Cuenta Is NUll Then A.IdUserOriginCancel Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','')) Order BY A.RemittanceKey),'-',Case When B.Cuenta Is NUll Then A.IdUserOriginCancel Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','')) As 'primarykey',
            'Denied' As 'FoundRmttC',
            A.IdRemittanceCancel,
            A.RemittanceKey,
            A.IdUserOriginCancel,
            A.IdCurrencyOriginCancel,
            A.IdCurrencyDestinationCancel,
            DATEADD(HOUR,-6,A.DateRegister) As 'DateMXN',
            REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','') As 'TxnDate',
            CONVERT(Decimal(20,2),A.RemittanceAmountCancel) As 'RemittanceAmount',
            CONVERT(Decimal(20,2),A.BeneficiaryAmount,0) As 'BeneficiaryAmount',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOriginCancel = 'MXN' Then A.BeneficiaryAmount
            ELSE A.BeneficiaryAmount/A.FinalExchangeAmountCancel
            End) As 'AmountUSD',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel
            Else A.BeneficiaryAmount
            End) As 'AmountMXN'
          From
            [dbo].[RemittanceCancel] A With (Nolock)
          Left Join
            (
            Select *
            From
              (
              Select Distinct
                RANK()Over(Partition By CONCAT(A.Cuenta, LOWER(Case When C.Email Is Null Or C.Email = '' Then B.CorreoContacto Else C.Email End )) Order By Case When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular End) As 'DistinctKey',
                Case
                When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
                When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular
                End As 'Titular',
                A.Cuenta,
                LOWER(Case
                When C.Email Is Null Or C.Email = '' Then B.CorreoContacto
                Else C.Email
                End) As 'CorreoContacto',
                Case
                When LEN(A.Cuenta) > 10 Then 'USD'
                Else 'MXN'
                End As 'UserType'
              From
                [recursos].[CatalogoCuentas] A With (Nolock)
              Left Join
                [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
              Left Join
                (
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes] With (Nolock)
                Union
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
                ) C On A.Cuenta = C.cuenta
              Where
                C.Cuenta Not Like '%S%'
              ) AA
            Where
              AA.DistinctKey = 1
            )B On CONCAT(A.IdUserOriginCancel,A.IdCurrencyOriginCancel) = CONCAT(B.CorreoContacto,B.UserType)
          Where
            DATEADD(HOUR,-6,A.DateRegister) >= '2023-01-01'
        )ZZA On AA.primaryKey = ZZA.primarykey

        Left Join
          (
          Select
            CONCAT(RANK()Over(Partition By CONCAT(Case When B.Cuenta Is NUll Then A.IdUserOriginCancel Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-5,A.DateRegister),101),'/','')) Order BY A.RemittanceKey),'-',Case When B.Cuenta Is NUll Then A.IdUserOriginCancel Else B.Cuenta End,'_', CONVERT(Decimal(20,1),Case When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel Else A.BeneficiaryAmount End),'_',REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-5,A.DateRegister),101),'/','')) As 'primarykey',
            'Denied' As 'FoundRmttC',
            A.IdRemittanceCancel,
            A.RemittanceKey,
            A.IdUserOriginCancel,
            A.IdCurrencyOriginCancel,
            A.IdCurrencyDestinationCancel,
            DATEADD(HOUR,-6,A.DateRegister) As 'DateMXN',
            REPLACE(CONVERT(Varchar(10),DATEADD(HOUR,-6,A.DateRegister),101),'/','') As 'TxnDate',
            CONVERT(Decimal(20,2),A.RemittanceAmountCancel) As 'RemittanceAmount',
            CONVERT(Decimal(20,2),A.BeneficiaryAmount,0) As 'BeneficiaryAmount',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOriginCancel = 'MXN' Then A.BeneficiaryAmount
            ELSE A.BeneficiaryAmount/A.FinalExchangeAmountCancel
            End) As 'AmountUSD',
            CONVERT(Decimal(20,2),Case
            When A.IdCurrencyOriginCancel = 'MXN' Then A.RemittanceAmountCancel
            Else A.BeneficiaryAmount
            End) As 'AmountMXN'
          From
            [dbo].[RemittanceCancel] A With (Nolock)
          Left Join
            (
            Select *
            From
              (
              Select Distinct
                RANK()Over(Partition By CONCAT(A.Cuenta, LOWER(Case When C.Email Is Null Or C.Email = '' Then B.CorreoContacto Else C.Email End )) Order By Case When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular End) As 'DistinctKey',
                Case
                When LEN(C.nombre_completo) > LEN(A.Titular) Then C.nombre_completo
                When LEN(A.Titular) > LEN(C.nombre_completo) Then A.Titular
                End As 'Titular',
                A.Cuenta,
                LOWER(Case
                When C.Email Is Null Or C.Email = '' Then B.CorreoContacto
                Else C.Email
                End) As 'CorreoContacto',
                Case
                When LEN(A.Cuenta) > 10 Then 'USD'
                Else 'MXN'
                End As 'UserType'
              From
                [recursos].[CatalogoCuentas] A With (Nolock)
              Left Join
                [broxelco_rdg].[ClientesBroxel] B With (Nolock) On A.Cliente = B.claveCliente
              Left Join
                (
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes] With (Nolock)
                Union
                Select
                  nombre_completo,
                  cuenta,
                  Email
                From
                  [broxelco_rdg].[accessos_clientes_baja] With (Nolock)
                ) C On A.Cuenta = C.cuenta
              Where
                C.Cuenta Not Like '%S%'
              ) AA
            Where
              AA.DistinctKey = 1
            )B On CONCAT(A.IdUserOriginCancel,A.IdCurrencyOriginCancel) = CONCAT(B.CorreoContacto,B.UserType)
          Where
            DATEADD(HOUR,-6,A.DateRegister) >= '2023-01-01'
        )ZZB On AA.primaryKey = ZZB.primarykey
      Where
        CONVERT(Date,AA.FechaCreacion) >= '2023-01-01' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: producto_origen {
    type: string
    sql: ${TABLE}.ProductoOrigen ;;
  }

  dimension: producto_destino {
    type: string
    sql: ${TABLE}.ProductoDestino ;;
  }

  dimension: receptor_1 {
    type: number
    sql: ${TABLE}.Receptor_1 ;;
  }

  dimension: emisor_2 {
    type: number
    sql: ${TABLE}.Emisor_2 ;;
  }

  dimension: estatus_3 {
    type: number
    sql: ${TABLE}.Estatus_3 ;;
  }

  dimension: comision_4 {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.Comision_4 ;;
  }

  dimension: monto_usd_op {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoUSD_Op ;;
  }

  dimension: monto_mxn_op {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.MontoMXN_Op ;;
  }

  dimension: comision_usd {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ComisionUSD ;;
  }

  dimension: comision_mxn {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.ComisionMXN ;;
  }

  dimension: status_op {
    type: string
    sql: ${TABLE}.Status_Op ;;
  }

  dimension: status_rmt {
    type: string
    sql: ${TABLE}.Status_Rmt ;;
  }

  dimension: cuenta_origen {
    type: string
    sql: ${TABLE}.CuentaOrigen ;;
  }

  dimension: cuenta_destino {
    type: string
    sql: ${TABLE}.CuentaDestino ;;
  }

  dimension: id_operacion {
    type: number
    sql: ${TABLE}.IdOperacion ;;
  }

  dimension: id_meltsan {
    type: number
    sql: ${TABLE}.IdMeltsan ;;
  }

  dimension: remittance_key {
    type: string
    sql: ${TABLE}.RemittanceKey ;;
  }

  dimension: auth_num {
    type: string
    sql: ${TABLE}.AuthNum ;;
  }

  dimension: txn_date {
    type: string
    sql: ${TABLE}.TxnDate ;;
  }

  dimension: amount_usd {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.AmountUSD ;;
  }

  dimension: amount_mxn {
    type: number
    value_format: "$#,##0.00;-$#,##0.00"
    sql: ${TABLE}.AmountMXN ;;
  }

  dimension: sender_country {
    type: string
    sql: ${TABLE}.SenderCountry ;;
  }

  dimension: sender_account_num {
    type: string
    sql: ${TABLE}.SenderAccountNum ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.SenderName ;;
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.SenderEmail ;;
  }

  dimension: recipient_country {
    type: string
    sql: ${TABLE}.RecipientCountry ;;
  }

  dimension: recipient_account_num {
    type: string
    sql: ${TABLE}.RecipientAccountNum ;;
  }

  dimension: recipient_name {
    type: string
    sql: ${TABLE}.RecipientName ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}.RecipientEmail ;;
  }

  dimension: primarykey {
    type: string
    sql: ${TABLE}.primarykey ;;
  }

  set: detail {
    fields: [
        producto_origen,
        producto_destino,
        receptor_1,
        emisor_2,
        estatus_3,
        comision_4,
        monto_usd_op,
        monto_mxn_op,
        comision_usd,
        comision_mxn,
        status_op,
        status_rmt,
        cuenta_origen,
        cuenta_destino,
        id_operacion,
        id_meltsan,
        remittance_key,
        auth_num,
        txn_date,
        amount_usd,
        amount_mxn,
        sender_country,
        sender_account_num,
        sender_name,
        sender_email,
        recipient_country,
        recipient_account_num,
        recipient_name,
        recipient_email,
        primarykey
    ]
  }
}
