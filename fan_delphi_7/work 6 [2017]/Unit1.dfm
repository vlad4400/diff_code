object Form1: TForm1
  Left = 187
  Top = 130
  BorderStyle = bsToolWindow
  Caption = #1063#1072#1089#1099
  ClientHeight = 270
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 49
    Height = 20
    Caption = #1042#1088#1077#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MemoClock: TMemo
    Left = 64
    Top = 56
    Width = 105
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object RadBForm2: TRadioButton
    Left = 24
    Top = 168
    Width = 145
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1057#1077#1082#1091#1085#1076#1086#1084#1077#1088
    TabOrder = 1
    OnClick = RadBForm2Click
  end
  object RadBForm3: TRadioButton
    Left = 24
    Top = 200
    Width = 137
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1041#1091#1076#1080#1083#1100#1085#1080#1082
    TabOrder = 2
    OnClick = RadBForm3Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 168
    Top = 16
  end
end
