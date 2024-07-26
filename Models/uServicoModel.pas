unit uServicoModel;

interface

type
  TServicoModel = class
  private
    FObs: string;
    FPaciente: string;
    FValorTotal: Double;
    FFarmaceutico: string;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetFarmaceutico(const Value: string);
    procedure SetObs(const Value: string);
    procedure SetPaciente(const Value: string);
    procedure SetValorTotal(const Value: Double);

  public
    property Data: TDate read FData write SetData;
    property Farmaceutico: string read FFarmaceutico write SetFarmaceutico;
    property Paciente: string read FPaciente write SetPaciente;
    property Obs: string read FObs write SetObs;
    property ValorTotal: Double read FValorTotal write SetValorTotal;


  end;

implementation

{ TServicoModel }

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
