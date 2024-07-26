unit uServicoModel;

interface

uses uAcaoModel, FireDac.Comp.Client;

type
  TServicoModel = class
  private
    FObs: string;
    FPaciente: string;
    FValor_Total: Double;
    FFarmaceutico: string;
    FData: TDate;
    FAcao: TAcao;
    Fid_servico: integer;
    procedure SetData(const Value: TDate);
    procedure SetFarmaceutico(const Value: string);
    procedure SetObs(const Value: string);
    procedure SetPaciente(const Value: string);
    procedure SetValor_Total(const Value: Double);
    procedure SetAcao(const Value: TAcao);
    procedure Setid_servico(const Value: integer);

  public
    function GetServicos: TFDQuery;
    function Save: integer;
    procedure LoadById(AIdServico: Integer);
    property id_servico : integer read Fid_servico write Setid_servico;
    property Data: TDate read FData write SetData;
    property Farmaceutico: string read FFarmaceutico write SetFarmaceutico;
    property Paciente: string read FPaciente write SetPaciente;
    property Obs: string read FObs write SetObs;
    property Valor_Total: Double read FValor_Total write SetValor_Total;
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

function TServicoModel.Save: integer;
var vServicoDAO: TServicoDAO;
begin
  vServicoDAO := TServicoDAO.Create;
  try
    case FAcao of
      uAcaoModel.tAdicionar: Result := vServicoDAO.Add(Self);
      uAcaoModel.tEditar: Result := vServicoDAO.Edit(Self);
      uAcaoModel.tDeletar: Result := vServicoDAO.Delete(Self);
    end;
  finally
    vServicoDAO.Free;
  end;
end;

procedure TServicoModel.LoadById(AIdServico: Integer);
var
  vServicoDAO: TServicoDAO;
  vQuery: TFDQuery;
begin
  vServicoDAO := TServicoDAO.Create;
  try
    vQuery := vServicoDAO.GetServicoById(AIdServico);
    try
      if not vQuery.IsEmpty then
      begin
        Fid_servico := vQuery.FieldByName('id_servico').AsInteger;
        FData := vQuery.FieldByName('data').AsDateTime;
        FFarmaceutico := vQuery.FieldByName('farmaceutico').AsString;
        FPaciente := vQuery.FieldByName('paciente').AsString;
        FObs := vQuery.FieldByName('obs').AsString;
        FValor_Total := vQuery.FieldByName('valor_total').AsFloat;
      end;
    finally
      vQuery.Free;
    end;
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

procedure TServicoModel.Setid_servico(const Value: integer);
begin
  Fid_servico := Value;
end;

procedure TServicoModel.SetObs(const Value: string);
begin
  FObs := Value;
end;

procedure TServicoModel.SetPaciente(const Value: string);
begin
  FPaciente := Value;
end;

procedure TServicoModel.SetValor_Total(const Value: Double);
begin
  FValor_Total := Value;
end;

end.
