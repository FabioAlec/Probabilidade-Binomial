unit Binomial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Math, Vcl.Mask,
  RxToolEdit, RxCurrEdit;

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
    edValorP: TCurrencyEdit;
    edValorN: TCurrencyEdit;
    edValorK: TCurrencyEdit;
    procedure btLimparClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    function CalcularFatorialCvirgulaK: Double;
    function CalcularPElevadoK: Double;
    function CalcularUmMenosPElevadoNMenosK: Double;
    function CalcularFatorial(Valor: Integer): Double;
    function CalcularPotencia(expoente, base: Double): Double;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btLimparClick(Sender: TObject);
begin
  edValorP.Clear;
  edValorN.Clear;
  edValorK.Clear;
  MemResultado.Clear;
end;

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  aValorFatorialCVigulaK,
  aValorPElevadoK,
  aValorUmMenosPElevadoNMenosK: Double;
begin
  aValorFatorialCVigulaK       := CalcularFatorialCvirgulaK;
  aValorPElevadoK              := CalcularPElevadoK;
  aValorUmMenosPElevadoNMenosK := CalcularUmMenosPElevadoNMenosK;
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
  aValorDeP := StrToFloat(edValorP.Text);
  aValordeK := StrToInt(edValorK.Text);

  Result := CalcularPotencia(aValordeK, aValorDeP);

  MemResultado.Lines.Add('Valor de P elevado a K é: ' + FloatToStr(Result));
end;

function TForm1.CalcularUmMenosPElevadoNMenosK: Double;
begin

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
