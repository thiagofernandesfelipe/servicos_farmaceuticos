unit uProcedimentoModel;

interface

uses uAcaoModel, FireDac.Comp.Client;

type
  TProcedimentoModel = class
  private
    FValor: Double;
    FDescricao: string;
    FId_Procedimento: integer;
    FId_Servico: integer;
    FAcao: TAcao;
    FTipo: string;
    procedure SetDescricao(const Value: string);
    procedure SetValor(const Value: Double);
    procedure SetId_Procedimento(const Value: integer);
    procedure SetId_Servico(const Value: integer);
    procedure SetAcao(const Value: TAcao);
    procedure SetTipo(const Value: string);

  public
    function Save: Boolean;
    function GetProcedimentosByServico(AIdProcedimento: integer): TFDQuery;
    function GetValorTotal(AIdServico: integer): Double;

    property Id_Servico:integer read FId_Servico write SetId_Servico;
    property Id_Procedimento: integer read FId_Procedimento write SetId_Procedimento;
    property Tipo: string read FTipo write SetTipo;
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: Double read FValor write SetValor;
    property Acao: TAcao read FAcao write SetAcao;

  end;

implementation

uses uProcedimentoDAO;

{ TProcedimentoModel }

function TProcedimentoModel.GetProcedimentosByServico(AIdProcedimento: integer): TFDQuery;
var vProcedimentoDAO: TProcedimentoDAO;
begin
  vProcedimentoDAO := TProcedimentoDAO.Create;
  try
    Result := vProcedimentoDAO.GetProcedimentosByServico(AIdProcedimento);
  finally
    vProcedimentoDAO.Free;
  end;
end;

function TProcedimentoModel.GetValorTotal(AIdServico: integer): Double;
var vProcedimentoDAO: TProcedimentoDAO;
begin
  vProcedimentoDAO := TProcedimentoDAO.Create;
  try
    Result := vProcedimentoDAO.GetValorTotal(AIdServico);
  finally
    vProcedimentoDAO.Free;
  end;
end;

function TProcedimentoModel.Save: Boolean;
var vProcedimentoDAO: TProcedimentoDAO;
begin
  vProcedimentoDAO := TProcedimentoDAO.Create;
  try
    case FAcao of
      uAcaoModel.tAdicionar: Result := vProcedimentoDAO.Add(Self);
      //uAcaoModel.tEditar: Result := vServicoDAO.Edit(Self);
      uAcaoModel.tDeletar: Result := vProcedimentoDAO.Delete(Self);
    end;
  finally
    vProcedimentoDAO.Free;
  end;
end;

procedure TProcedimentoModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TProcedimentoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProcedimentoModel.SetId_Procedimento(const Value: integer);
begin
  FId_Procedimento := Value;
end;

procedure TProcedimentoModel.SetId_Servico(const Value: integer);
begin
  FId_Servico := Value;
end;

procedure TProcedimentoModel.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TProcedimentoModel.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
