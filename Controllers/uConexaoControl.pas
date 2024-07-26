unit uConexaoControl;

interface

uses uConexaoDAO, System.SysUtils;

type
  TConexaoControl = class
  private
    FConexao: TConexaoDAO;
    class var FInstance: TConexaoControl;

  public
    constructor Create;
    destructor Destroy; override;

    class function GetInstance: TConexaoControl;

    property Conexao: TConexaoDAO read FConexao write FConexao;
  end;

implementation

{ TConexaoControl }

constructor TConexaoControl.Create;
begin
  FConexao := TConexaoDAO.Create;
end;

destructor TConexaoControl.Destroy;
begin
  FConexao.Free;

  inherited;
end;

class function TConexaoControl.GetInstance: TConexaoControl;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TConexaoControl.Create();
  end;

  Result := Self.FInstance;
end;

end.
