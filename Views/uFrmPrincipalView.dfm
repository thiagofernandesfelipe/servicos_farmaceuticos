object uPrincipalForm: TuPrincipalForm
  Left = 0
  Top = 0
  BorderWidth = 10
  Caption = 'Servi'#231'os Farmac'#234'uticos'
  ClientHeight = 708
  ClientWidth = 1098
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1098
    Height = 708
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alClient
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1098
      708)
    object DBGrid1: TDBGrid
      Left = 8
      Top = 40
      Width = 603
      Height = 659
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsServicos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 626
      Top = 40
      Width = 457
      Height = 659
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 89
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 3
    end
    object Button3: TButton
      Left = 170
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
    end
  end
  object Button4: TButton
    Left = 251
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = Button4Click
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 320
    object FDMemTable1ID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'id_servico'
    end
    object FDMemTable1data: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'data'
    end
    object FDMemTable1farmaceutico: TStringField
      DisplayLabel = 'Farmac'#234'utico'
      DisplayWidth = 30
      FieldName = 'farmaceutico'
    end
    object FDMemTable1paciente: TStringField
      DisplayLabel = 'Paciente'
      FieldName = 'paciente'
    end
    object FDMemTable1valor_total: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      Size = 2
    end
  end
  object dsServicos: TDataSource
    DataSet = FDMemTable1
    Left = 368
    Top = 304
  end
end
