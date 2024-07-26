unit uProcedimentoModel;

interface

type
  TProcedimentoModel = class
  private
    FValor: Double;
    FDescricao: string;
    FId_Procedimento: integer;
    procedure SetDescricao(const Value: string);
    procedure SetValor(const Value: Double);
    procedure SetId_Procedimento(const Value: integer);

  public
    property Id_Procedimento: integer read FId_Procedimento write SetId_Procedimento;
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: Double read FValor write SetValor;

  end;

implementation

{ TProcedimentoModel }

procedure TProcedimentoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProcedimentoModel.SetId_Procedimento(const Value: integer);
begin
  FId_Procedimento := Value;
end;

procedure TProcedimentoModel.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
