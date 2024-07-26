object frmServicoView: TfrmServicoView
  Left = 0
  Top = 0
  Caption = 'Servi'#231'o Farmac'#234'utico'
  ClientHeight = 625
  ClientWidth = 593
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 10
  Padding.Top = 10
  Padding.Right = 10
  Padding.Bottom = 10
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 10
    Top = 10
    Width = 573
    Height = 605
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alClient
    FullRepaint = False
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 510
    ExplicitHeight = 604
    object Label1: TLabel
      Left = 53
      Top = 44
      Width = 45
      Height = 15
      Caption = 'Paciente'
    end
    object Label2: TLabel
      Left = 26
      Top = 70
      Width = 72
      Height = 15
      Caption = 'Farmac'#234'utico'
    end
    object Label3: TLabel
      Left = 74
      Top = 94
      Width = 24
      Height = 15
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 36
      Top = 120
      Width = 62
      Height = 15
      Caption = 'Observa'#231#227'o'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 252
      Width = 553
      Height = 4
    end
    object Label5: TLabel
      Left = 8
      Top = 6
      Width = 133
      Height = 21
      Caption = 'Dados do Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 262
      Width = 115
      Height = 21
      Caption = 'Procedimentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 404
      Top = 580
      Width = 61
      Height = 15
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 484
      Top = 580
      Width = 42
      Height = 15
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 75
      Top = 295
      Width = 23
      Height = 15
      Caption = 'Tipo'
    end
    object Label10: TLabel
      Left = 47
      Top = 320
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object Label11: TLabel
      Left = 72
      Top = 345
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object Memo1: TMemo
      Left = 104
      Top = 119
      Width = 444
      Height = 93
      Lines.Strings = (
        'Memo1')
      TabOrder = 3
    end
    object Button1: TButton
      Left = 26
      Top = 369
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 9
      OnClick = Button1Click
    end
    object DBGrid1: TDBGrid
      Left = 26
      Top = 400
      Width = 522
      Height = 174
      DataSource = dsProcedimentos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'tipo'
          Width = 200
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
    object Button2: TButton
      Left = 26
      Top = 218
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = Button2Click
    end
    object ePaciente: TEdit
      Left = 104
      Top = 41
      Width = 444
      Height = 23
      TabOrder = 0
    end
    object eFarmaceutico: TEdit
      Left = 104
      Top = 65
      Width = 444
      Height = 23
      TabOrder = 1
    end
    object Button3: TButton
      Left = 107
      Top = 369
      Width = 75
      Height = 25
      Caption = 'Remover'
      TabOrder = 10
      OnClick = Button3Click
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 292
      Width = 444
      Height = 23
      Style = csDropDownList
      TabOrder = 5
      StyleName = 'Windows'
      Items.Strings = (
        'Aten'#231#227'o Farmac'#234'utica Domiciliar'
        'Aferi'#231#227'o de Par'#226'metros Fisiol'#243'gicos'
        'Aferi'#231#227'o de Par'#226'metros Bioqu'#237'micos'
        'Administra'#231#227'o de Medicamentos')
    end
    object Edit1: TEdit
      Left = 104
      Top = 317
      Width = 444
      Height = 23
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 104
      Top = 342
      Width = 120
      Height = 23
      TabOrder = 7
    end
    object MaskEdit1: TMaskEdit
      Left = 104
      Top = 91
      Width = 120
      Height = 23
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
  end
  object memProcedimentos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 234
    Top = 480
    object memProcedimentostipo: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 30
      FieldName = 'tipo'
    end
    object memProcedimentosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 30
      FieldName = 'descricao'
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
  object dsProcedimentos: TDataSource
    DataSet = memProcedimentos
    Left = 394
    Top = 472
  end
end
