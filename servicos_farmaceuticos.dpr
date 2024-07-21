program servicos_farmaceuticos;

uses
  Vcl.Forms,
  uPrincipalView in 'uPrincipalView.pas' {Form1},
  uConexaoDAO in 'DAO\uConexaoDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
