unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConexaoDAO, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls;

type
  TuPrincipalForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPrincipalForm: TuPrincipalForm;

implementation

uses uFrmServicoView;

{$R *.dfm}

procedure TuPrincipalForm.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmServicoView, frmServicoView);
  try
    frmServicoView.ShowModal;
  finally
    frmServicoView.Release;
  end;

end;

end.
