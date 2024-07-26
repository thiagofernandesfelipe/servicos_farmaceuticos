unit uServicoDAO;

interface

uses FireDac.Comp.Client, uConexaoControl, uConexaoDAO, uServicoModel, SysUtils;

type
  TServicoDAO = class
  private
    FConexao : TConexaoDAO;

  public
    constructor Create;
    function GetServicos: TFDQuery;
    function GetServicoById(AIdServico: Integer): TFDQuery;
    function Add(AServicoModel: TServicoModel): Boolean;
    function Edit(AServicoModel: TServicoModel): Boolean;
    function Delete(AServicoModel: TServicoModel): Boolean;
  end;

implementation

{ TServicoDAO }

function TServicoDAO.Add(AServicoModel: TServicoModel): Boolean;
var vQuery : TFDQuery;
    sql : string;
begin
  vQuery := FConexao.CriarQuery();
  try
    sql := 'insert into servico_farmaceutico(data, farmaceutico, paciente, obs, valor_total)'+
           ' values(:data, :farmaceutico, :paciente, :obs, :valor_total)';

    vQuery.ExecSQL(sql, [FormatDateTime('yyyy-mm-dd', AServicoModel.Data),
                         AServicoModel.Farmaceutico,
                         AServicoModel.Paciente,
                         AServicoModel.Obs,
                         AServicoModel.Valor_Total]);
    Result := true;
  finally
    vQuery.Free;
  end;
end;

constructor TServicoDAO.Create;
begin
  FConexao :=  TConexaoControl.GetInstance().Conexao;
end;

function TServicoDAO.Delete(AServicoModel: TServicoModel): Boolean;
var vQuery : TFDQuery;
    sql : string;
begin
  vQuery := FConexao.CriarQuery();
  try
    sql := 'delete from servico_farmaceutico'+
           ' where id_servico = :idservico';

    vQuery.ExecSQL(sql, [AServicoModel.id_servico]);
    Result := true;
  finally
    vQuery.Free;
  end;
end;

function TServicoDAO.Edit(AServicoModel: TServicoModel): Boolean;
var vQuery : TFDQuery;
    sql : string;
begin
  vQuery := FConexao.CriarQuery();
  try
    sql := 'update servico_farmaceutico'+
           ' set data = :data,'+
           ' farmaceutico = :farmaceutico,'+
           ' paciente = :paciente,'+
           ' obs = :obs,'+
           ' valor_total = :valor_total'+
           ' where id_servico = :idservico';

    vQuery.ExecSQL(sql, [AServicoModel.Data,
                         AServicoModel.Farmaceutico,
                         AServicoModel.Paciente,
                         AServicoModel.Obs,
                         AServicoModel.Valor_Total,
                         AServicoModel.id_servico]);
    Result := true;
  finally
    vQuery.Free;
  end;
end;

function TServicoDAO.GetServicos: TFDQuery;
var vQuery : TFDQuery;
begin
  vQuery := FConexao.CriarQuery();

  vQuery.Open('select id_servico, data, farmaceutico, paciente, obs, valor_total from servico_farmaceutico');

  Result := vQuery;
end;

function TServicoDAO.GetServicoById(AIdServico: Integer): TFDQuery;
var
  vQuery: TFDQuery;
begin
  vQuery := FConexao.CriarQuery();
  vQuery.Open('select id_servico, data, farmaceutico, paciente, obs, valor_total from servico_farmaceutico'+
              ' where id_servico = :id_servico', [AIdServico]);
  Result := vQuery;
end;


end.
