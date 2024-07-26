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
    ExplicitWidth = 1094
    ExplicitHeight = 707
    DesignSize = (
      1098
      708)
    object DBGrid1: TDBGrid
      Left = 8
      Top = 102
      Width = 607
      Height = 597
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 630
      Top = 102
      Width = 457
      Height = 597
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
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 3
    end
    object Button3: TButton
      Left = 8
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
    end
  end
end
