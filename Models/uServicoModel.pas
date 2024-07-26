unit uServicoModel;

interface

uses uAcaoModel, FireDac.Comp.Client;

type
  TServicoModel = class
  private
    FObs: string;
    FPaciente: string;
    FValorTotal: Double;
    FFarmaceutico: string;
    FData: TDate;
    FAcao: TAcao;
    procedure SetData(const Value: TDate);
    procedure SetFarmaceutico(const Value: string);
    procedure SetObs(const Value: string);
    procedure SetPaciente(const Value: string);
    procedure SetValorTotal(const Value: Double);
    procedure SetAcao(const Value: TAcao);

  public
    function GetServicos: TFDQuery;
    property Data: TDate read FData write SetData;
    property Farmaceutico: string read FFarmaceutico write SetFarmaceutico;
    property Paciente: string read FPaciente write SetPaciente;
    property Obs: string read FObs write SetObs;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property Acao: TAcao read FAcao write SetAcao;

  end;

implementation

uses uServicoDAO;

{ TServicoModel }

function TServicoModel.GetServicos: TFDQuery;
var vServicoDAO: TServicoDAO;
begin
  vServicoDAO := TServicoDAO.Create;
  try
    Result := vServicoDAO.GetServicos;
  finally
    vServicoDAO.Free;
  end;
end;

procedure TServicoModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;

procedure TServicoModel.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TServicoModel.SetFarmaceutico(const Value: string);
begin
  FFarmaceutico := Value;
end;

procedure TServicoModel.SetObs(const Value: string);
begin
  FObs := Value;
end;

procedure TServicoModel.SetPaciente(const Value: string);
begin
  FPaciente := Value;
end;

procedure TServicoModel.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
