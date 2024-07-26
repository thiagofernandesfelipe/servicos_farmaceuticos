unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConexaoDAO, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uServicoControl;

type
  TuPrincipalForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    FDMemTable1: TFDMemTable;
    dsServicos: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    vServicoControl: TServicoControl;
    procedure BuscarServicos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPrincipalForm: TuPrincipalForm;

implementation

uses uFrmServicoView;

{$R *.dfm}

procedure TuPrincipalForm.BuscarServicos;
var  vQuery : TFDQuery;
begin
  FDMemTable1.Close;
  try
    vQuery := vServicoControl.GetServicos;
    try
      vQuery.FetchAll;
      FDMemTable1.Data := vQuery.Data;
    finally
      vQuery.Close;
      vQuery.Free;
      end;
  finally
    FreeAndNil(vServicoControl);
  end;
end;

procedure TuPrincipalForm.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmServicoView, frmServicoView);
  try
    frmServicoView.ShowModal;
  finally
    frmServicoView.Release;
  end;

end;

procedure TuPrincipalForm.Button4Click(Sender: TObject);
begin
  Self.BuscarServicos;
end;

procedure TuPrincipalForm.FormCreate(Sender: TObject);
begin
  vServicoControl := TServicoControl.Create;
end;

procedure TuPrincipalForm.FormDestroy(Sender: TObject);
begin
  vServicoControl.Free;
end;

end.
