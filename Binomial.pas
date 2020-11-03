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
    procedure edValorNKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPCimaKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPBaixoKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPDecimalKeyPress(Sender: TObject; var Key: Char);
    procedure edValorKKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPCimaAcumKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPBaixoAcumKeyPress(Sender: TObject; var Key: Char);
    procedure edValorPDecimalAcumKeyPress(Sender: TObject; var Key: Char);
    procedure edValorNAcumKeyPress(Sender: TObject; var Key: Char);
  private
    function CalcularFatorialCvirgulaK: Double;
    function CalcularPElevadoK: Double;
    function CalcularUmMenosPElevadoNMenosK: Double;
    function CalcularFatorial(Valor: Integer): Double;
    function CalcularPotencia(expoente, base: Double): Double;
    function CalcularQuantidadeVezesVetor(eValorDePAcumulado: Double; eQuantidadeVezes: Integer): Double;
    function CalcularValorDeVezesNoVetor(eValorDePAcumulado: Double; eFrequencia: Integer): Double;
    procedure CalcularProbaAcumulada;
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
  aValorDeP, aValorAcumuladoAux, aValorAcumulado: Double;
  VetorValores : array of Double;
begin
  if MemResultado.Lines.Text <> EmptyStr then
    MemResultado.Lines.Add('---------------------------------------------------');
  MemResultado.Lines.Add('LEI BINOMIAL NORMAL');

  aFrequencia := StrToInt(edValorNAcum.Text);

  if Trim(edValorPCimaAcum.Text) <> EmptyStr then
    aValorDeP := (StrToInt(edValorPCimaAcum.Text) / StrToInt(edValorPBaixoAcum.Text))
  else
    aValorDeP := (StrToFloat(edValorPDecimalAcum.Text)/100);

  Count               := 0;
  aValorAcumuladoAux  := 0;
  aValorAcumulado     := 0;

  SetLength(VetorValores, aFrequencia);

  aValorAcumulado := CalcularValorDeVezesNoVetor(aValorDeP, aFrequencia);
  for I := 0 to aFrequencia do
  begin
    if Count = aFrequencia then
    begin
      VetorValores[I] := CalcularQuantidadeVezesVetor(aValorAcumulado, 1);
      MemResultado.Lines.Add('P('+IntToStr(I)+') = ' + FloatToStr(VetorValores[I]));
    end
    else
    if Count = 0 then
    begin
      Inc(Count);
      VetorValores[I] := CalcularQuantidadeVezesVetor(aValorAcumulado, 1);
      MemResultado.Lines.Add('P('+IntToStr(I)+') = ' + FloatToStr(VetorValores[I]));
    end
    else
    begin
      Inc(Count);
      VetorValores[I] := CalcularQuantidadeVezesVetor(aValorAcumulado, aFrequencia);
      MemResultado.Lines.Add('P('+IntToStr(I)+') = ' + FloatToStr(VetorValores[I]));
    end;
  end;

  MemResultado.Lines.Add('Valores na frequência acumulada: ');
  for I := 0 to aFrequencia do
  begin
    aValorAcumuladoAux := (aValorAcumuladoAux + VetorValores[I]);
    MemResultado.Lines.Add('P('+IntToStr(I)+') = ' + FloatToStr(aValorAcumuladoAux));
  end;

end;

function TForm1.CalcularValorDeVezesNoVetor(eValorDePAcumulado: Double; eFrequencia: Integer): Double;
var
  I : Integer;
  aValorPAux,
  aValordePAuxMult : Double;
begin
  aValordePAuxMult  := eValorDePAcumulado;

  for I := 1 to (eFrequencia-1) do
  begin
    aValordePAuxMult := (aValordePAuxMult * eValorDePAcumulado);
  end;

  Result := aValordePAuxMult;
end;

function TForm1.CalcularQuantidadeVezesVetor(eValorDePAcumulado: Double; eQuantidadeVezes: Integer): Double;
var
  I : Integer;
  aValorAuxMult, aValorAuxSom: Double;
begin
  aValorAuxMult := eValorDePAcumulado;

  for I := 1 to (eQuantidadeVezes) do
  begin
    aValorAuxSom := (aValorAuxSom + aValorAuxMult);
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
  if MemResultado.Lines.Text <> EmptyStr then
    MemResultado.Lines.Add('---------------------------------------------------');
  MemResultado.Lines.Add('LEI BINOMIAL INDIVIDUAL');


  aValorFatorialCVigulaK       := CalcularFatorialCvirgulaK;
  aValorPElevadoK              := CalcularPElevadoK;
  aValorUmMenosPElevadoNMenosK := CalcularUmMenosPElevadoNMenosK;

  aValorDaProbabilidade := (aValorFatorialCVigulaK * aValorPElevadoK * aValorUmMenosPElevadoNMenosK);

  MemResultado.Lines.Add('Valor Probabilidade é: ' + FloatToStr(aValorDaProbabilidade));
  MemResultado.Lines.Add('Valor Probabilidade * 100 é: ' + FloatToStr(StrToFloat(FormatFloat('#0.00', aValorDaProbabilidade))*100)+ '%.');

end;

procedure TForm1.CalcularProbaAcumulada;
begin

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

procedure TForm1.edValorKKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TForm1.edValorNAcumKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TForm1.edValorNKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TForm1.edValorPBaixoAcumKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TForm1.edValorPBaixoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TForm1.edValorPCimaAcumKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TForm1.edValorPCimaKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TForm1.edValorPDecimalAcumKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9', ','] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TForm1.edValorPDecimalKeyPress(Sender: TObject; var Key: Char);
begin
  if ((key in ['0'..'9', ','] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

end.
