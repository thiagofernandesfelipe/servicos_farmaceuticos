object frmServicoView: TfrmServicoView
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 528
  ClientWidth = 534
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
  TextHeight = 15
  object Panel1: TPanel
    Left = 10
    Top = 10
    Width = 514
    Height = 508
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alClient
    FullRepaint = False
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 25
    ExplicitHeight = 544
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
      Top = 222
      Width = 497
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
      Top = 232
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
      Left = 332
      Top = 479
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
      Left = 412
      Top = 479
      Width = 56
      Height = 15
      Caption = 'R$ 310,50'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 104
      Top = 41
      Width = 385
      Height = 23
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 104
      Top = 66
      Width = 385
      Height = 23
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 104
      Top = 117
      Width = 385
      Height = 93
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
    object Button1: TButton
      Left = 26
      Top = 268
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
    end
    object DBGrid1: TDBGrid
      Left = 26
      Top = 299
      Width = 463
      Height = 174
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object MaskEdit1: TMaskEdit
    Left = 114
    Top = 101
    Width = 120
    Height = 23
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
end
