object FRPrincipal: TFRPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Importaci'#243'n y Exportaci'#243'n de Archivos Delimitados'
  ClientHeight = 630
  ClientWidth = 1174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 23
  object PageControl1: TPageControl
    Left = 19
    Top = 21
    Width = 1135
    Height = 586
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Importacion'
      object Label1: TLabel
        Left = 266
        Top = 98
        Width = 188
        Height = 31
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'clase TStringList'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 616
        Top = 98
        Width = 199
        Height = 31
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'clase TCSVParser'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtImportMetodo1: TButton
        Left = 280
        Top = 154
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Metodo 1'
        TabOrder = 0
        OnClick = BtImportMetodo1Click
      end
      object BtImportMetodo2: TButton
        Left = 658
        Top = 154
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Metodo 2'
        TabOrder = 1
        OnClick = BtImportMetodo2Click
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Exportaci'#243'n'
      ImageIndex = 1
      object Label3: TLabel
        Left = 84
        Top = 58
        Width = 284
        Height = 31
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Con la clase TFileStream'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 481
        Top = 58
        Width = 269
        Height = 31
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Con la clase TStringList'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 910
        Top = 58
        Width = 144
        Height = 31
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Con TextFile'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -26
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtExportMetodo1: TButton
        Left = 126
        Top = 100
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Exportar'
        TabOrder = 0
        OnClick = BtExportMetodo1Click
      end
      object BtExportMetodo2: TButton
        Left = 527
        Top = 100
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Exportar'
        TabOrder = 1
        OnClick = BtExportMetodo2Click
      end
      object BtExportMetodo3: TButton
        Left = 910
        Top = 100
        Width = 131
        Height = 44
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Exportar'
        TabOrder = 2
        OnClick = BtExportMetodo3Click
      end
    end
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 259
    Top = 336
  end
end
