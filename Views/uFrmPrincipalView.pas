unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConexaoDAO, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uServicoControl, uAcaoModel, Vcl.DBCtrls, uProcedimentoControl;

type
  TuPrincipalForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    dsServicos: TDataSource;
    memServicos: TFDMemTable;
    memServicosID: TIntegerField;
    memServicosdata: TDateField;
    memServicosfarmaceutico: TStringField;
    memServicospaciente: TStringField;
    memServicosvalor_total: TBCDField;
    dsProcedimentos: TDataSource;
    DBMemo1: TDBMemo;
    memServicosobs: TMemoField;
    Label6: TLabel;
    memProcedimentos: TFDMemTable;
    memProcedimentostipo: TStringField;
    memProcedimentosdescricao: TStringField;
    memProcedimentosvalor: TBCDField;
    memProcedimentosid_servico: TIntegerField;
    memProcedimentosid_procedimento: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dsServicosDataChange(Sender: TObject; Field: TField);
  private
    vServicoControl: TServicoControl;
    vProcedimentoControl: TProcedimentoControl;
    procedure BuscarServicos;
    procedure BuscarProcedimentos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPrincipalForm: TuPrincipalForm;

implementation

uses uFrmServicoView;

{$R *.dfm}

procedure TuPrincipalForm.BuscarProcedimentos;
var  vQuery : TFDQuery;
begin
  memProcedimentos.Close;

  vQuery := vProcedimentoControl.GetProcedimentosByServico(memServicosID.Value);
  try
    vQuery.FetchAll;
    memProcedimentos.Data := vQuery.Data;
  finally
    vQuery.Close;
    FreeAndNil(vQuery);
  end;
end;

procedure TuPrincipalForm.BuscarServicos;
var  vQuery : TFDQuery;
begin
  memServicos.Close;

  vQuery := vServicoControl.GetServicos;
  try
    vQuery.FetchAll;
    memServicos.Data := vQuery.Data;
  finally
    vQuery.Close;
    FreeAndNil(vQuery);
  end;
end;

procedure TuPrincipalForm.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmServicoView, frmServicoView);
  try
    if frmServicoView.ShowModal = mrOk then
    begin
      BuscarServicos;
    end;
  finally
    frmServicoView.Release;
  end;

end;

procedure TuPrincipalForm.Button2Click(Sender: TObject);
begin
  if not memServicos.IsEmpty then
  begin
    Application.CreateForm(TfrmServicoView, frmServicoView);
    try
      frmServicoView.LoadServico(memServicos.FieldByName('id_servico').AsInteger);
      if frmServicoView.ShowModal = mrOk then
      begin
        BuscarServicos;
      end;
    finally
      frmServicoView.Release;
    end;
  end
  else
  begin
    ShowMessage('Nenhum serviço selecionado.');
  end;
end;

procedure TuPrincipalForm.Button3Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja deletar este serviço?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vServicoControl.ServicoModel.Acao := uAcaoModel.tDeletar;
    vServicoControl.ServicoModel.id_servico := memServicosID.Value;
    if vServicoControl.Save <> 0 then
      ShowMessage('Excluído com sucesso!');
    Self.BuscarServicos;
  end;
end;

procedure TuPrincipalForm.Button4Click(Sender: TObject);
begin
  Self.BuscarServicos;
end;

procedure TuPrincipalForm.dsServicosDataChange(Sender: TObject;
  Field: TField);
begin
  Self.BuscarProcedimentos;
end;

procedure TuPrincipalForm.FormCreate(Sender: TObject);
begin
  vServicoControl := TServicoControl.Create;
  vProcedimentoControl := TProcedimentoControl.Create;
end;

procedure TuPrincipalForm.FormDestroy(Sender: TObject);
begin
  vServicoControl.Free;
  vProcedimentoControl.Free;
end;

procedure TuPrincipalForm.FormShow(Sender: TObject);
begin
  Self.BuscarServicos;
  Self.BuscarProcedimentos;
end;

end.
