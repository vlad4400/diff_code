object Form2: TForm2
  Left = 411
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 306
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LSingOperation: TLabel
    Left = 99
    Top = 72
    Width = 13
    Height = 26
    Caption = '?'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LSingEqully: TLabel
    Left = 96
    Top = 136
    Width = 12
    Height = 26
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EOperand1: TEdit
    Left = 24
    Top = 40
    Width = 153
    Height = 21
    TabOrder = 0
    OnChange = OnChangeOperands
  end
  object EOperand2: TEdit
    Left = 24
    Top = 104
    Width = 153
    Height = 21
    TabOrder = 1
    OnChange = OnChangeOperands
  end
  object EResult: TEdit
    Left = 24
    Top = 168
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object BitBtnPlus: TBitBtn
    Left = 24
    Top = 208
    Width = 33
    Height = 33
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnOperatorClick
  end
  object BitBtnMinus: TBitBtn
    Tag = 1
    Left = 64
    Top = 208
    Width = 33
    Height = 33
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnOperatorClick
  end
  object BitBtnMultiplication: TBitBtn
    Tag = 2
    Left = 104
    Top = 208
    Width = 33
    Height = 33
    Caption = '*'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnOperatorClick
  end
  object BitBtnDivision: TBitBtn
    Tag = 3
    Left = 144
    Top = 208
    Width = 33
    Height = 33
    Caption = '/'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BtnOperatorClick
  end
  object BitBtnClear: TBitBtn
    Left = 24
    Top = 256
    Width = 73
    Height = 25
    Caption = 'Clear'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtnClearClick
  end
  object BitBtnClose: TBitBtn
    Left = 104
    Top = 256
    Width = 73
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Kind = bkClose
  end
end
