object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSizeToolWin
  Caption = 'Importar y Exportar CSV-Txt'
  ClientHeight = 772
  ClientWidth = 1988
  Color = clBtnFace
  Constraints.MaxHeight = 884
  Constraints.MaxWidth = 2030
  Constraints.MinHeight = 505
  Constraints.MinWidth = 1160
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  StyleName = 'Windows'
  PixelsPerInch = 168
  TextHeight = 23
  object LbTiempoInicial: TLabel
    Left = 12
    Top = 14
    Width = 106
    Height = 28
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Gauge1: TGauge
    Left = 12
    Top = 172
    Width = 587
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Progress = 0
  end
  object Bevel1: TBevel
    Left = 609
    Top = 14
    Width = 1369
    Height = 148
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  object BtImportar: TButton
    Left = 348
    Top = 109
    Width = 251
    Height = 52
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Importar al Memo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtImportarClick
  end
  object MmList: TMemo
    Left = 12
    Top = 215
    Width = 587
    Height = 585
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object EdDelimitador: TLabeledEdit
    Left = 560
    Top = 14
    Width = 35
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    EditLabel.Width = 137
    EditLabel.Height = 31
    EditLabel.Margins.Left = 5
    EditLabel.Margins.Top = 5
    EditLabel.Margins.Right = 5
    EditLabel.Margins.Bottom = 5
    EditLabel.Caption = 'Delimitador :'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    MaxLength = 1
    TabOrder = 2
    Text = ';'
  end
  object EdRutaArchivo: TLabeledEdit
    Left = 203
    Top = 61
    Width = 392
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    EditLabel.Width = 185
    EditLabel.Height = 31
    EditLabel.Margins.Left = 5
    EditLabel.Margins.Top = 5
    EditLabel.Margins.Right = 5
    EditLabel.Margins.Bottom = 5
    EditLabel.Caption = 'Ruta del Archivo :'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    MaxLength = 1
    TabOrder = 3
    Text = ''
  end
  object BtArchivo: TButton
    Left = 12
    Top = 109
    Width = 255
    Height = 52
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Seleccionar Archivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtArchivoClick
  end
  object DBGrid1: TDBGrid
    Left = 604
    Top = 172
    Width = 1388
    Height = 628
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    DataSource = DsClientes
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTEID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRES'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APELLIDOS'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAIS'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAPITAL'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_CONTRATO'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CARGO'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_NACIMIENTO'
        Width = 200
        Visible = True
      end>
  end
  object BtImpTabla: TButton
    Left = 845
    Top = 81
    Width = 307
    Height = 52
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Importar a la Tabla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtImpTablaClick
  end
  object BtExportarTxt: TButton
    Left = 1556
    Top = 81
    Width = 306
    Height = 52
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Exportar la Tabla a txt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BtExportarTxtClick
  end
  object opd: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'csv'
        FileMask = '*.csv'
      end
      item
        DisplayName = 'txt'
        FileMask = '*.txt'
      end>
    Options = []
    Left = 399
    Top = 21
  end
  object DsClientes: TDataSource
    DataSet = MtClientes
    Left = 263
    Top = 466
  end
  object MtClientes: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'CLIENTEID'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRES'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'APELLIDOS'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TELEFONO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CAPITAL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SALARIO'
        DataType = ftCurrency
        Precision = 2
      end
      item
        Name = 'FECHA_CONTRATO'
        DataType = ftDateTime
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FECHA_NACIMIENTO'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 266
    Top = 350
    Content = {
      414442531000000083050000FF00010001FF02FF030400140000004D00740043
      006C00690065006E007400650073000500140000004D00740043006C00690065
      006E00740065007300060000000000070000080032000000090000FF0AFF0B04
      001200000043004C00490045004E00540045004900440005001200000043004C
      00490045004E0054004500490044000C00010000000E000D000F000110000111
      000112000113000114000115001200000043004C00490045004E005400450049
      004400FEFF0B04000E0000004E004F004D00420052004500530005000E000000
      4E004F004D0042005200450053000C00020000000E00160017003C0000000F00
      0110000111000112000113000114000115000E0000004E004F004D0042005200
      4500530018003C000000FEFF0B0400120000004100500045004C004C00490044
      004F0053000500120000004100500045004C004C00490044004F0053000C0003
      0000000E00160017003C0000000F000110000111000112000113000114000115
      00120000004100500045004C004C00490044004F00530018003C000000FEFF0B
      040010000000540045004C00450046004F004E004F0005001000000054004500
      4C00450046004F004E004F000C00040000000E0016001700140000000F000110
      0001110001120001130001140001150010000000540045004C00450046004F00
      4E004F00180014000000FEFF0B04000800000050004100490053000500080000
      0050004100490053000C00050000000E00160017001E0000000F000110000111
      0001120001130001140001150008000000500041004900530018001E000000FE
      FF0B04000E0000004300410050004900540041004C0005000E00000043004100
      50004900540041004C000C00060000000E00160017001E0000000F0001100001
      11000112000113000114000115000E0000004300410050004900540041004C00
      18001E000000FEFF0B04000A00000045004D00410049004C0005000A00000045
      004D00410049004C000C00070000000E00160017001E0000000F000110000111
      000112000113000114000115000A00000045004D00410049004C0018001E0000
      00FEFF0B04000E000000530041004C004100520049004F0005000E0000005300
      41004C004100520049004F000C00080000000E0019001A00020000001B000400
      00000F000110000111000112000113000114000115000E000000530041004C00
      4100520049004F001C00020000001D0004000000FEFF0B04001C000000460045
      004300480041005F0043004F004E0054005200410054004F0005001C00000046
      0045004300480041005F0043004F004E0054005200410054004F000C00090000
      000E001E000F000110000111000112000113000114000115001C000000460045
      004300480041005F0043004F004E0054005200410054004F00FEFF0B04000E00
      000045004D005000520045005300410005000E00000045004D00500052004500
      530041000C000A0000000E0016001700320000000F0001100001110001120001
      13000114000115000E00000045004D0050005200450053004100180032000000
      FEFF0B04000A00000043004100520047004F0005000A00000043004100520047
      004F000C000B0000000E00160017001E0000000F000110000111000112000113
      000114000115000A00000043004100520047004F0018001E000000FEFF0B0400
      20000000460045004300480041005F004E004100430049004D00490045004E00
      54004F00050020000000460045004300480041005F004E004100430049004D00
      490045004E0054004F000C000C0000000E001E000F0001100001110001120001
      130001140001150020000000460045004300480041005F004E00410043004900
      4D00490045004E0054004F00FEFEFF1FFEFF20FEFF21FEFEFEFF22FEFF23FF24
      FEFEFE0E004D0061006E0061006700650072001E005500700064006100740065
      0073005200650067006900730074007200790012005400610062006C0065004C
      006900730074000A005400610062006C00650008004E0061006D006500140053
      006F0075007200630065004E0061006D0065000A005400610062004900440024
      0045006E0066006F0072006300650043006F006E00730074007200610069006E
      00740073001E004D0069006E0069006D0075006D004300610070006100630069
      0074007900180043006800650063006B004E006F0074004E0075006C006C0014
      0043006F006C0075006D006E004C006900730074000C0043006F006C0075006D
      006E00100053006F007500720063006500490044000E006400740049006E0074
      0033003200100044006100740061005400790070006500140053006500610072
      0063006800610062006C006500120041006C006C006F0077004E0075006C006C
      000800420061007300650014004F0041006C006C006F0077004E0075006C006C
      0012004F0049006E0055007000640061007400650010004F0049006E00570068
      006500720065001A004F0072006900670069006E0043006F006C004E0061006D
      00650018006400740041006E007300690053007400720069006E006700080053
      0069007A006500140053006F007500720063006500530069007A006500140064
      007400430075007200720065006E006300790012005000720065006300690073
      0069006F006E000A005300630061006C0065001E0053006F0075007200630065
      0050007200650063006900730069006F006E00160053006F0075007200630065
      005300630061006C0065001400640074004400610074006500540069006D0065
      001C0043006F006E00730074007200610069006E0074004C0069007300740010
      0056006900650077004C006900730074000E0052006F0077004C006900730074
      001800520065006C006100740069006F006E004C006900730074001C00550070
      00640061007400650073004A006F00750072006E0061006C000E004300680061
      006E00670065007300}
  end
end
