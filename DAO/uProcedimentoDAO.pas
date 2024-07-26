unit uProcedimentoDAO;

interface

uses FireDac.Comp.Client, uConexaoControl, uConexaoDAO, uProcedimentoModel, SysUtils;

type
  TProcedimentoDAO = class

  private
    FConexao: TConexaoDAO;

  public
    constructor Create;

    function GetProcedimentosByServico(AIdServico: integer): TFDQuery;
    function Add(AProcedimentoModel: TProcedimentoModel): Boolean;
    function Delete(AprocedimentoModel: TProcedimentoModel): Boolean;
    function GetValorTotal(AIdServico: Integer): Double;

  end;

implementation

{ TProcedimentoDAO }

function TProcedimentoDAO.Add(AProcedimentoModel: TProcedimentoModel): Boolean;
var vQuery : TFDQuery;
    sql, sqlIdProcedimento, max : string;
begin
  vQuery := FConexao.CriarQuery();
  try
    sqlIdProcedimento := 'select COALESCE(MAX(id_procedimento), 0) + 1 as max from servico_procedimentos'+
                         ' where id_servico = '+IntToStr(AProcedimentoModel.Id_Servico);

    vQuery.Open(sqlIdProcedimento);
    max := vQuery.FieldByName('max').AsString;
    vQuery.SQL.Clear;


    sql := 'insert into servico_procedimentos(id_servico, id_procedimento, tipo, descricao, valor)'+
           ' values(:id_servico,'+max+', :tipo, :descricao, :valor)';

    vQuery.ExecSQL(sql, [AProcedimentoModel.Id_Servico,
                         AprocedimentoModel.Tipo,
                         AProcedimentoModel.Descricao,
                         AProcedimentoModel.Valor]);
    Result := true;
  finally
    vQuery.Free;
  end;
end;

constructor TProcedimentoDAO.Create;
begin
  FConexao :=  TConexaoControl.GetInstance().Conexao;
end;

function TProcedimentoDAO.Delete(AprocedimentoModel: TProcedimentoModel): Boolean;
var
  vQuery: TFDQuery;
begin
  try
    vQuery := FConexao.CriarQuery();
    vQuery.ExecSQL('delete from servico_procedimentos'+
                ' where id_servico = :id_servico'+
                ' and id_procedimento = :id_procedimento', [AProcedimentoModel.Id_Servico, AProcedimentoModel.Id_Procedimento]);
    Result := true;
  finally
    vQuery.Free;
  end;
end;

function TProcedimentoDAO.GetProcedimentosByServico(AIdServico: integer): TFDQuery;
var
  vQuery: TFDQuery;
begin
  vQuery := FConexao.CriarQuery();
  vQuery.Open('select id_servico, id_procedimento, tipo, descricao, valor from servico_procedimentos'+
              ' where id_servico = :id_servico', [AIdServico]);
  Result := vQuery;
end;

function TProcedimentoDAO.GetValorTotal(AIdServico: Integer): Double;
var
  vQuery: TFDQuery;
begin
  try
    vQuery := FConexao.CriarQuery();
    vQuery.Open('select sum(valor) as valor_total from servico_procedimentos'+
                ' where id_servico = :id_servico', [AIdServico]);
    Result := vQuery.FieldByName('valor_total').AsFloat;
  finally
    vQuery.Free;
  end;
end;

end.
