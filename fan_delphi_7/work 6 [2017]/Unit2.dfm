object Form2: TForm2
  Left = 403
  Top = 130
  BorderStyle = bsDialog
  Caption = #1057#1077#1082#1091#1085#1076#1086#1084#1077#1088
  ClientHeight = 270
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BStartStop: TButton
    Tag = 1
    Left = 32
    Top = 120
    Width = 65
    Height = 25
    Caption = #1057#1090#1072#1088#1090
    TabOrder = 0
    OnClick = BStartStopClick
  end
  object EditStopwatch: TEdit
    Left = 32
    Top = 56
    Width = 145
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '00:00.00'
  end
  object ButtonR: TButton
    Left = 112
    Top = 120
    Width = 67
    Height = 25
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 2
    OnClick = ButtonRClick
  end
  object BitBtnClose: TBitBtn
    Left = 72
    Top = 200
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 168
    Top = 16
  end
end
