unit uProcedimentoModel;

interface

type
  TProcedimentoModel = class
  private
    FValor: Double;
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    procedure SetValor(const Value: Double);

  public
    property Descricao: string read FDescricao write SetDescricao;
    property Valor: Double read FValor write SetValor;

  end;

implementation

{ TProcedimentoModel }

procedure TProcedimentoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProcedimentoModel.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
