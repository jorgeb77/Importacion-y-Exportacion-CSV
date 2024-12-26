object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'USO DE LA CLASE TCSVParser PARA LEER ARCHIVOS CVS.'
  ClientHeight = 627
  ClientWidth = 1261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  StyleName = 'Windows'
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 23
  object Bevel1: TBevel
    Left = 10
    Top = 14
    Width = 1241
    Height = 121
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
  end
  object LbTiempo: TLabel
    Left = 10
    Top = 570
    Width = 7
    Height = 28
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Gauge1: TGauge
    Left = 263
    Top = 28
    Width = 707
    Height = 37
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Progress = 0
  end
  object Memo1: TMemo
    Left = 1243
    Top = 145
    Width = 1241
    Height = 415
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ScrollBars = ssBoth
    TabOrder = 2
    Visible = False
  end
  object EdDelimitador: TLabeledEdit
    Left = 217
    Top = 30
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
    TabOrder = 0
    Text = ';'
  end
  object EdRutaArchivo: TLabeledEdit
    Left = 217
    Top = 78
    Width = 753
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
    TabOrder = 1
    Text = ''
  end
  object BtArchivo: TButton
    Left = 978
    Top = 66
    Width = 255
    Height = 53
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
    TabOrder = 3
    OnClick = BtArchivoClick
  end
  object BtImportar: TButton
    Left = 1076
    Top = 563
    Width = 157
    Height = 53
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Importar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtImportarClick
  end
  object ActivityIndicator1: TActivityIndicator
    Left = 476
    Top = 238
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    IndicatorSize = aisXLarge
    IndicatorType = aitSectorRing
  end
  object DBGrid1: TDBGrid
    Left = 10
    Top = 145
    Width = 1241
    Height = 411
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    Left = 145
    Top = 250
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 520
    Top = 310
  end
  object FDMemTable1: TFDMemTable
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
    Left = 518
    Top = 210
  end
end
