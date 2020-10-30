unit Binomial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, Vcl.Mask,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    MemResultado: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    btnCalcular: TButton;
    Label5: TLabel;
    Label8: TLabel;
    btLimpar: TButton;
    edValorPCima: TEdit;
    edValorN: TEdit;
    edValorK: TEdit;
    Label7: TLabel;
    edValorPBaixo: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    edValorPDecimal: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edValorPCimaAcum: TEdit;
    edValorPBaixoAcum: TEdit;
    edValorPDecimalAcum: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    edValorNAcum: TEdit;
    btnCalcularAcum: TButton;
    Button2: TButton;
    procedure btLimparClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnCalcularAcumClick(Sender: TObject);
  private
    function CalcularFatorialCvirgulaK: Double;
    function CalcularPElevadoK: Double;
    function CalcularUmMenosPElevadoNMenosK: Double;
    function CalcularFatorial(Valor: Integer): Double;
    function CalcularPotencia(expoente, base: Double): Double;
    function CalcularQuantidadeVezesVetor(eValorDeP: Double; eFrequencia, eQuantidadeVezes: Integer): Double;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btLimparClick(Sender: TObject);
begin
  edValorPCima.Clear;
  edValorPBaixo.Clear;
  edValorPDecimal.Clear;
  edValorN.Clear;
  edValorK.Clear;
  MemResultado.Clear;
end;

procedure TForm1.btnCalcularAcumClick(Sender: TObject);
var
  I, II, Count,
  aFrequencia: Integer;
  aValorDeP: Double;
  VetorValores : array of Double;
begin
  aFrequencia := StrToInt(edValorNAcum.Text);

  if Trim(edValorPCimaAcum.Text) <> EmptyStr then
    aValorDeP := (StrToInt(edValorPCimaAcum.Text) / StrToInt(edValorPBaixoAcum.Text))
  else
    aValorDeP := (StrToFloat(edValorPDecimalAcum.Text)/100);

  Count := 0;

  SetLength(VetorValores, aFrequencia+1);
  for I := 0 to aFrequencia do
  begin
    if Count = 0 then
    begin
      for II := 0 to Count do
      begin
        Count := 1;
        VetorValores[I] := CalcularQuantidadeVezesVetor(aValorDeP, aFrequencia, 0);
        MemResultado.Lines.Add('P('+IntToStr(I)+') = ' + FloatToStr(VetorValores[I]));
      end;
    end;
  end;
end;

function TForm1.CalcularQuantidadeVezesVetor(eValorDeP: Double; eFrequencia, eQuantidadeVezes: Integer): Double;
var
  I, II : Integer;
  aValorAuxMult, aValorAuxSom: Double;
begin
  aValorAuxMult := 0;
  aValorAuxSom := 0;
  for I := 0 to eFrequencia do
  begin
    aValorAuxMult := aValorAuxMult * eValorDeP;
  end;
  for II := 0 to eQuantidadeVezes do
  begin
    aValorAuxSom := aValorAuxSom + aValorAuxMult;
  end;
  Result := aValorAuxSom;
end;

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  aValorFatorialCVigulaK,
  aValorPElevadoK,
  aValorUmMenosPElevadoNMenosK,
  aValorDaProbabilidade: Double;
begin
  aValorFatorialCVigulaK       := CalcularFatorialCvirgulaK;
  aValorPElevadoK              := CalcularPElevadoK;
  aValorUmMenosPElevadoNMenosK := CalcularUmMenosPElevadoNMenosK;

  aValorDaProbabilidade := (aValorFatorialCVigulaK * aValorPElevadoK * aValorUmMenosPElevadoNMenosK);

  MemResultado.Lines.Add('Valor Probabilidade é: ' + FloatToStr(aValorDaProbabilidade));
  MemResultado.Lines.Add('Valor Probabilidade * 100 é: ' + FloatToStr(StrToFloat(FormatFloat('#0.00', aValorDaProbabilidade))*100)+ '%.');
end;

function TForm1.CalcularFatorialCvirgulaK: Double;
var
  aFatorialdeN,
  aFatorialdeX: Double;
  aValorDeN,
  aValorDeK: Integer;
begin
  aValorDeN := StrToInt(edValorN.Text);
  aValorDeK := StrToInt(edValorK.Text);

  aFatorialdeN := CalcularFatorial(aValorDeN);
  aFatorialdeX := (CalcularFatorial(aValorDeK)*CalcularFatorial(aValorDeN - aValorDeK));

  Result := (aFatorialdeN/aFatorialdeX);

  MemResultado.Lines.Add('Valor fatorial de Cn,k é: ' + FloatToStr(Result));
end;

function TForm1.CalcularPElevadoK: Double;
var
  aValorDeP: Double;
  aValordeK,
  I: Integer;
begin
  if Trim(edValorPCima.Text) <> EmptyStr then
    aValorDeP := (StrToInt(edValorPCima.Text) / StrToInt(edValorPBaixo.Text))
  else
    aValorDeP := (StrToFloat(edValorPDecimal.Text)/100);

  aValordeK := StrToInt(edValorK.Text);

  Result := CalcularPotencia(aValordeK, aValorDeP);

  MemResultado.Lines.Add('Valor de P elevado a K é: ' + FloatToStr(Result));
end;

function TForm1.CalcularUmMenosPElevadoNMenosK: Double;
var
  aValorDeP,
  aValordeK,
  aValordeN,
  aUmMenosValordeP,
  aNMenosValordeK : double;
begin
  if Trim(edValorPCima.Text) <> EmptyStr then
    aValorDeP := (StrToInt(edValorPCima.Text) / StrToInt(edValorPBaixo.Text))
  else
    aValorDeP := (StrToFloat(edValorPDecimal.Text)/100);

  aValordeK := StrToInt(edValorK.Text);

  aValorDeN := StrToInt(edValorN.Text);

  aUmMenosValordeP := (1 - aValorDeP);

  aNMenosValordeK := aValorDeN - aValordeK;

  Result := CalcularPotencia(aNMenosValordeK, aUmMenosValordeP);

  MemResultado.Lines.Add('Valor de (1 - P) elevado a (N - K) é: ' + FloatToStr(Result));
end;

function TForm1.CalcularFatorial(Valor: Integer): Double;
var
x,n,i:integer;
begin
  n := 1;
  i := Valor;
  for x := i downto 1 do
  begin
   n := n * x;
  end;
  Result := n;
end;

function TForm1.CalcularPotencia(Expoente, Base: Double): Double;
var
  ExpoenteAux, BaseAux, Potencia: Double;
begin
  ExpoenteAux := Expoente;
  BaseAux := Base;
  Potencia := exp(ExpoenteAux * ln(BaseAux));

  Result := Potencia;
end;
end.
