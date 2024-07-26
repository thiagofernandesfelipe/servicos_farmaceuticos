unit uServicoDAO;

interface

uses FireDac.Comp.Client, uConexaoControl, uConexaoDAO;

type
  TServicoDAO = class
  private
    FConexao : TConexaoDAO;

  public
    constructor Create;
    function GetServicos: TFDQuery;

  end;

implementation

{ TServicoDAO }

constructor TServicoDAO.Create;
begin
  FConexao :=  TConexaoControl.GetInstance().Conexao;
end;

function TServicoDAO.GetServicos: TFDQuery;
var vQuery : TFDQuery;
begin
  vQuery := FConexao.CriarQuery();

  vQuery.Open('select id_servico, data, farmaceutico, paciente, obs, valor_total from servico_farmaceutico');
  //vQuery.FetchAll;

  Result := vQuery;
end;

end.
