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

  vQuery.Open('select * from servico_farmaceutico');

  Result := vQuery;
end;

end.
