object uPrincipalForm: TuPrincipalForm
  Left = 0
  Top = 0
  BorderWidth = 10
  Caption = 'Servi'#231'os Farmac'#234'uticos'
  ClientHeight = 758
  ClientWidth = 1335
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1335
    Height = 758
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
    ExplicitWidth = 1331
    ExplicitHeight = 757
    DesignSize = (
      1335
      758)
    object Label6: TLabel
      Left = 8
      Top = 592
      Width = 90
      Height = 21
      Anchors = [akLeft, akBottom]
      Caption = 'Observa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 40
      Width = 845
      Height = 547
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsServicos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'id_servico'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'paciente'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'farmaceutico'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 859
      Top = 40
      Width = 457
      Height = 709
      Anchors = [akTop, akRight, akBottom]
      DataSource = dsProcedimentos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'tipo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Visible = True
        end>
    end
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 89
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 170
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = Button3Click
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 618
      Width = 836
      Height = 131
      Anchors = [akLeft, akRight, akBottom]
      DataField = 'obs'
      DataSource = dsServicos
      Enabled = False
      TabOrder = 6
      ExplicitTop = 617
      ExplicitWidth = 832
    end
    object Button4: TButton
      Left = 251
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object memServicos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 320
    object memServicosID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'id_servico'
    end
    object memServicosdata: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'data'
    end
    object memServicosfarmaceutico: TStringField
      DisplayLabel = 'Farmac'#234'utico'
      DisplayWidth = 100
      FieldName = 'farmaceutico'
      Size = 100
    end
    object memServicospaciente: TStringField
      DisplayLabel = 'Paciente'
      DisplayWidth = 100
      FieldName = 'paciente'
      Size = 100
    end
    object memServicosvalor_total: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
      Size = 2
    end
    object memServicosobs: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
  end
  object dsServicos: TDataSource
    DataSet = memServicos
    OnDataChange = dsServicosDataChange
    Left = 368
    Top = 304
  end
  object dsProcedimentos: TDataSource
    DataSet = memProcedimentos
    Left = 920
    Top = 304
  end
  object memProcedimentos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 762
    Top = 312
    object memProcedimentostipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 30
      FieldName = 'tipo'
      Size = 100
    end
    object memProcedimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'descricao'
      Size = 100
    end
    object memProcedimentosvalor: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Size = 2
    end
    object memProcedimentosid_servico: TIntegerField
      FieldName = 'id_servico'
    end
    object memProcedimentosid_procedimento: TIntegerField
      FieldName = 'id_procedimento'
    end
  end
end
