object Form1: TForm1
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Calculadora de Probabilidade Binomial'
  ClientHeight = 610
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 610
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 6
    ExplicitTop = 5
    ExplicitWidth = 737
    ExplicitHeight = 444
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 361
      Height = 609
      Align = alCustom
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 101
        Width = 159
        Height = 13
        Caption = 'Qual a probabilidade de sucesso?'
      end
      object Label10: TLabel
        Left = 70
        Top = 133
        Width = 36
        Height = 13
        Caption = 'Decimal'
      end
      object Label2: TLabel
        Left = 8
        Top = 133
        Width = 33
        Height = 13
        Caption = 'Fra'#231#227'o'
      end
      object Label3: TLabel
        Left = 6
        Top = 117
        Width = 52
        Height = 13
        Caption = 'Valor de P.'
      end
      object Label4: TLabel
        Left = 6
        Top = 29
        Width = 262
        Height = 13
        Caption = 'Qual a quantidade de vezes  de ocorr'#234'ncia do evento?'
      end
      object Label5: TLabel
        Left = 6
        Top = 204
        Width = 137
        Height = 13
        Caption = 'Probabilidade de ocorrencia?'
      end
      object Label6: TLabel
        Left = 6
        Top = 46
        Width = 53
        Height = 13
        Caption = 'Valor de N.'
      end
      object Label7: TLabel
        Left = 6
        Top = 159
        Width = 36
        Height = 13
        Caption = '______'
      end
      object Label8: TLabel
        Left = 6
        Top = 221
        Width = 52
        Height = 13
        Caption = 'Valor de K.'
      end
      object Label9: TLabel
        Left = 48
        Top = 160
        Width = 14
        Height = 13
        Caption = 'Ou'
      end
      object Label11: TLabel
        Left = 8
        Top = 8
        Width = 161
        Height = 19
        Caption = 'Lei Binomial Individual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 6
        Top = 309
        Width = 170
        Height = 19
        Caption = 'Lei Binomial Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 5
        Top = 333
        Width = 159
        Height = 13
        Caption = 'Qual a probabilidade de sucesso?'
      end
      object Label14: TLabel
        Left = 5
        Top = 365
        Width = 33
        Height = 13
        Caption = 'Fra'#231#227'o'
      end
      object Label15: TLabel
        Left = 5
        Top = 349
        Width = 52
        Height = 13
        Caption = 'Valor de P.'
      end
      object Label16: TLabel
        Left = 3
        Top = 391
        Width = 36
        Height = 13
        Caption = '______'
      end
      object Label17: TLabel
        Left = 45
        Top = 392
        Width = 14
        Height = 13
        Caption = 'Ou'
      end
      object Label18: TLabel
        Left = 67
        Top = 365
        Width = 36
        Height = 13
        Caption = 'Decimal'
      end
      object Label19: TLabel
        Left = 5
        Top = 435
        Width = 262
        Height = 13
        Caption = 'Qual a quantidade de vezes  de ocorr'#234'ncia do evento?'
      end
      object Label20: TLabel
        Left = 5
        Top = 452
        Width = 53
        Height = 13
        Caption = 'Valor de N.'
      end
      object btLimpar: TButton
        Left = 144
        Top = 272
        Width = 131
        Height = 25
        Caption = 'Limpar'
        TabOrder = 0
        OnClick = btLimparClick
      end
      object btnCalcular: TButton
        Left = 6
        Top = 272
        Width = 123
        Height = 25
        Caption = 'Calcular'
        TabOrder = 1
        OnClick = btnCalcularClick
      end
      object edValorK: TEdit
        Left = 6
        Top = 239
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edValorN: TEdit
        Left = 6
        Top = 65
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object edValorPBaixo: TEdit
        Left = 6
        Top = 175
        Width = 35
        Height = 21
        TabOrder = 4
      end
      object edValorPCima: TEdit
        Left = 6
        Top = 147
        Width = 35
        Height = 21
        TabOrder = 5
      end
      object edValorPDecimal: TEdit
        Left = 70
        Top = 152
        Width = 95
        Height = 21
        TabOrder = 6
      end
      object edValorPCimaAcum: TEdit
        Left = 3
        Top = 379
        Width = 35
        Height = 21
        TabOrder = 7
      end
      object edValorPBaixoAcum: TEdit
        Left = 3
        Top = 407
        Width = 35
        Height = 21
        TabOrder = 8
      end
      object edValorPDecimalAcum: TEdit
        Left = 67
        Top = 384
        Width = 95
        Height = 21
        TabOrder = 9
      end
      object edValorNAcum: TEdit
        Left = 5
        Top = 471
        Width = 121
        Height = 21
        TabOrder = 10
      end
      object btnCalcularAcum: TButton
        Left = 6
        Top = 504
        Width = 123
        Height = 25
        Caption = 'Calcular'
        TabOrder = 11
        OnClick = btnCalcularAcumClick
      end
      object Button2: TButton
        Left = 144
        Top = 504
        Width = 131
        Height = 25
        Caption = 'Limpar'
        TabOrder = 12
        OnClick = btLimparClick
      end
    end
  end
  object MemResultado: TMemo
    Left = 360
    Top = 0
    Width = 399
    Height = 609
    Align = alCustom
    Enabled = False
    TabOrder = 1
  end
end
