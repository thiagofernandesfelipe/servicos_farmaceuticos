unit uPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uConexaoDAO;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  VConexao : TConexaoDAO;
begin
  VConexao := TConexaoDAO.Create;

  VConexao.GetConn.Connected := true;

  if VConexao.GetConn.Connected then
    ShowMessage('porra do caralho buceta filha da puta!!! conectou nesse caralho');

end;

end.
