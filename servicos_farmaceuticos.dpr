program servicos_farmaceuticos;

uses
  Vcl.Forms,
  uConexaoDAO in 'DAO\uConexaoDAO.pas',
  uFrmPrincipalView in 'Views\uFrmPrincipalView.pas' {uPrincipalForm},
  uConexaoControl in 'Controllers\uConexaoControl.pas',
  uServicoModel in 'Models\uServicoModel.pas',
  uServicoDAO in 'DAO\uServicoDAO.pas',
  uAcaoModel in 'Models\uAcaoModel.pas',
  uFrmServicoView in 'Views\uFrmServicoView.pas' {frmServicoView},
  uServicoControl in 'Controllers\uServicoControl.pas',
  uProcedimentoControl in 'Controllers\uProcedimentoControl.pas',
  uProcedimentoDAO in 'DAO\uProcedimentoDAO.pas',
  uProcedimentoModel in 'Models\uProcedimentoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TuPrincipalForm, uPrincipalForm);
  Application.Run;
end.
