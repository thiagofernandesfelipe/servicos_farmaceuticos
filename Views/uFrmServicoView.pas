unit uFrmServicoView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Data.DB, Vcl.DBGrids, uServicoControl, uAcaoModel;

type
  TfrmServicoView = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Button2: TButton;
    ePaciente: TEdit;
    eFarmaceutico: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    vServicoControl: TServicoControl;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServicoView: TfrmServicoView;

implementation

{$R *.dfm}

procedure TfrmServicoView.Button2Click(Sender: TObject);
begin
  vServicoControl.ServicoModel.Acao := uAcaoModel.tAdicionar;
  vServicoControl.ServicoModel.Data := StrToDate(MaskEdit1.Text);
  vServicoControl.ServicoModel.Farmaceutico := eFarmaceutico.Text;
  vServicoControl.ServicoModel.Paciente := ePaciente.Text;
  vServicoControl.ServicoModel.Obs := Memo1.Text;

  if vServicoControl.Save then
    ShowMessage('Registro Adicionado!');
end;

procedure TfrmServicoView.FormCreate(Sender: TObject);
begin
  vServicoControl := TServicoControl.Create;
end;

procedure TfrmServicoView.FormDestroy(Sender: TObject);
begin
  vServicoControl.Free;
end;

end.
