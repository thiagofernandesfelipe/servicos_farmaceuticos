unit uFrmServicoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Data.DB, Vcl.DBGrids, uServicoControl, uAcaoModel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uProcedimentoControl;

type
  TfrmServicoView = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    ePaciente: TEdit;
    eFarmaceutico: TEdit;
    Button3: TButton;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    memProcedimentos: TFDMemTable;
    dsProcedimentos: TDataSource;
    Edit2: TEdit;
    memProcedimentostipo: TStringField;
    memProcedimentosdescricao: TStringField;
    memProcedimentosvalor: TBCDField;
    memProcedimentosid_servico: TIntegerField;
    memProcedimentosid_procedimento: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    vServicoControl: TServicoControl;
    vProcedimentoControl: TProcedimentoControl;
    procedure BuscarProcedimentos;
    { Private declarations }
  public
    procedure LoadServico(AIdServico: Integer);
    { Public declarations }
  end;

var
  frmServicoView: TfrmServicoView;

implementation

{$R *.dfm}

procedure TfrmServicoView.BuscarProcedimentos;
var  vQuery : TFDQuery;
     valorTotal : Double;
begin
  memProcedimentos.Close;

  vQuery := vProcedimentoControl.GetProcedimentosByServico(vServicoControl.ServicoModel.id_servico);
  try
    vQuery.FetchAll;
    memProcedimentos.Data := vQuery.Data;

    valorTotal := vProcedimentoControl.GetValorTotal(vServicoControl.ServicoModel.id_servico);
    Label8.Caption := 'R$ ' + FormatFloat('0.00', valorTotal);

    vServicoControl.ServicoModel.Acao := uAcaoModel.tEditar;
    vServicoControl.ServicoModel.Valor_Total := valorTotal;

    vServicoControl.ServicoModel.Save;
  finally
    vQuery.Close;
    FreeAndNil(vQuery);
  end;
end;

procedure TfrmServicoView.Button1Click(Sender: TObject);
begin
  vProcedimentoControl.ProcedimentoModel.Acao := uAcaoModel.tAdicionar;
  vProcedimentoControl.ProcedimentoModel.Id_Servico := vServicoControl.ServicoModel.id_servico;
  vProcedimentoControl.ProcedimentoModel.Tipo := ComboBox1.Text;
  vProcedimentoControl.ProcedimentoModel.Descricao := Edit1.Text;
  vProcedimentoControl.ProcedimentoModel.Valor := StrToFloat(Edit2.Text);

  if vProcedimentoControl.Save then
    ShowMessage('Procedimento Adicionado!');

  ComboBox1.ItemIndex := -1;
  Edit1.Text := '';
  Edit2.Text := '';

  Self.BuscarProcedimentos;
end;

procedure TfrmServicoView.Button2Click(Sender: TObject);
begin
  vServicoControl.ServicoModel.Data := StrToDate(MaskEdit1.Text);
  vServicoControl.ServicoModel.Farmaceutico := eFarmaceutico.Text;
  vServicoControl.ServicoModel.Paciente := ePaciente.Text;
  vServicoControl.ServicoModel.Obs := Memo1.Text;

  vServicoControl.ServicoModel.id_servico := vServicoControl.Save;

  if vServicoControl.ServicoModel.id_servico <> 0 then
  begin
    ShowMessage('Registro Salvo!');
  end;
end;

procedure TfrmServicoView.Button3Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja deletar este serviço?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vProcedimentoControl.ProcedimentoModel.Acao := uAcaoModel.tDeletar;
    vProcedimentoControl.ProcedimentoModel.id_servico := memProcedimentosid_servico.Value;
    vProcedimentoControl.ProcedimentoModel.id_procedimento := memProcedimentosid_procedimento.Value;
    if vProcedimentoControl.Save then
      ShowMessage('Excluído com sucesso!');
    Self.BuscarProcedimentos;
  end;
end;

procedure TfrmServicoView.LoadServico(AIdServico: Integer);
begin
  try
    vServicoControl.ServicoModel.LoadById(AIdServico);
    MaskEdit1.Text := DateToStr(vServicoControl.ServicoModel.Data);
    eFarmaceutico.Text := vServicoControl.ServicoModel.Farmaceutico;
    ePaciente.Text := vServicoControl.ServicoModel.Paciente;
    Memo1.Text := vServicoControl.ServicoModel.Obs;
    vServicoControl.ServicoModel.Acao := uAcaoModel.tEditar;
    Self.BuscarProcedimentos;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar serviço: ' + E.Message);
      ModalResult := mrCancel;
    end;
  end;
end;


procedure TfrmServicoView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TfrmServicoView.FormCreate(Sender: TObject);
begin
  Memo1.Text := '';
  vServicoControl := TServicoControl.Create;
  vServicoControl.ServicoModel.Acao := uAcaoModel.tAdicionar;

  vProcedimentoControl := TProcedimentoControl.Create;
end;

procedure TfrmServicoView.FormDestroy(Sender: TObject);
begin
  vServicoControl.Free;
  vProcedimentoControl.Free;
end;

end.
