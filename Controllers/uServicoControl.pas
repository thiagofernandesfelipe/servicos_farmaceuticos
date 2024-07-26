unit uServicoControl;

interface

uses uServicoModel, System.SysUtils, FireDac.Comp.Client;

type
  TServicoControl = class
  private
    FServicoModel: TServicoModel;

  public

    function GetServicos: TFDQuery;

    constructor Create;
    destructor Destroy; override;

    property ServicoModel: TServicoModel read FServicoModel write FServicoModel;
  end;

implementation

{ TServicoControl }

constructor TServicoControl.Create;
begin
  FServicoModel := TServicoModel.Create;
end;

destructor TServicoControl.Destroy;
begin
  FreeAndNil(FServicoModel);
  inherited;
end;

function TServicoControl.GetServicos: TFDQuery;
begin
  Result := FServicoModel.GetServicos;
end;

end.
