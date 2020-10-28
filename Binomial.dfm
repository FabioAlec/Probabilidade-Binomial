object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculadora de Probabilidade Binomial'
  ClientHeight = 277
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 77
    Width = 159
    Height = 13
    Caption = 'Qual a probabilidade de sucesso?'
  end
  object Label2: TLabel
    Left = 6
    Top = 93
    Width = 93
    Height = 13
    Caption = 'Informe em fra'#231#227'o.'
  end
  object Label3: TLabel
    Left = 6
    Top = 109
    Width = 52
    Height = 13
    Caption = 'Valor de p.'
  end
  object Label4: TLabel
    Left = 6
    Top = 5
    Width = 262
    Height = 13
    Caption = 'Qual a quantidade de vezes  de ocorr'#234'ncia do evento?'
  end
  object Label6: TLabel
    Left = 6
    Top = 22
    Width = 52
    Height = 13
    Caption = 'Valor de n.'
  end
  object Label5: TLabel
    Left = 6
    Top = 160
    Width = 137
    Height = 13
    Caption = 'Probabilidade de ocorrencia?'
  end
  object Label8: TLabel
    Left = 6
    Top = 177
    Width = 52
    Height = 13
    Caption = 'Valor de K.'
  end
  object MemResultado: TMemo
    Left = 281
    Top = 0
    Width = 468
    Height = 277
    Align = alRight
    Enabled = False
    TabOrder = 4
    ExplicitHeight = 539
  end
  object btnCalcular: TButton
    Left = 6
    Top = 248
    Width = 123
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
  object btLimpar: TButton
    Left = 144
    Top = 248
    Width = 131
    Height = 25
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btLimparClick
  end
  object edValorP: TCurrencyEdit
    Left = 6
    Top = 129
    Width = 159
    Height = 21
    Alignment = taLeftJustify
    DecimalPlaces = 10
    TabOrder = 1
  end
  object edValorN: TCurrencyEdit
    Left = 6
    Top = 41
    Width = 159
    Height = 21
    Alignment = taLeftJustify
    DecimalPlaces = 10
    TabOrder = 0
  end
  object edValorK: TCurrencyEdit
    Left = 6
    Top = 196
    Width = 159
    Height = 21
    Alignment = taLeftJustify
    DecimalPlaces = 10
    TabOrder = 2
  end
end
