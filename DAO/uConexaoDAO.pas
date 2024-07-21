unit uConexaoDAO;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait;

type
  TConexaoDAO = class
  private
    FConn: TFDConnection;

    procedure ConfigurarConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

implementation

{ TConexao }

procedure TConexaoDAO.ConfigurarConexao;
begin
  FConn.Params.DriverID := 'MySQL';
  FConn.Params.Database := 'teste';
  FConn.Params.UserName := 'root';
  FConn.Params.Password := 'rootroot';
  FConn.Params.Add('Server=localhost');
  FConn.LoginPrompt     := False;
end;

constructor TConexaoDAO.Create;
begin
  FConn := TFDConnection.Create(nil);

  Self.ConfigurarConexao();
end;

function TConexaoDAO.CriarQuery: TFDQuery;
var
  VQuery: TFDQuery;
begin
  VQuery := TFDQuery.Create(nil);
  VQuery.Connection := FConn;

  Result := VQuery;
end;

destructor TConexaoDAO.Destroy;
begin
  FConn.Free;

  inherited;
end;

function TConexaoDAO.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
