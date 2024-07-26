unit uProcedimentoControl;

interface

uses uProcedimentoModel, System.SysUtils, FireDac.Comp.Client;

type
  TProcedimentoControl = class

  private
     FProcedimentoModel: TProcedimentoModel;

  public
    function Save: Boolean;
    function GetProcedimentosByServico(AIdProcedimento: integer): TFDQuery;
    function GetValorTotal(AIdServico: Integer): Double;

    constructor Create;
    destructor Destroy; override;

    property ProcedimentoModel: TProcedimentoModel read FProcedimentoModel write FProcedimentoModel;

  end;

implementation

{ TProcedimentoControl }

constructor TProcedimentoControl.Create;
begin
  FProcedimentoModel := TProcedimentoModel.Create;
end;

destructor TProcedimentoControl.Destroy;
begin
  FreeAndNil(FProcedimentoModel);
  inherited;
end;

function TProcedimentoControl.GetProcedimentosByServico(AIdProcedimento: integer): TFDQuery;
begin
  Result := FProcedimentoModel.GetProcedimentosByServico(AIdProcedimento);
end;

function TProcedimentoControl.GetValorTotal(AIdServico: Integer): Double;
begin
  Result := FProcedimentoModel.GetValorTotal(AidServico);
end;

function TProcedimentoControl.Save: Boolean;
begin
  Result := FProcedimentoModel.Save;
end;

end.
