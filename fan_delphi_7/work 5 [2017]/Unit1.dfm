object Form1: TForm1
  Left = 190
  Top = 266
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 291
  ClientWidth = 186
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = AllMamoryClick
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 80
    Width = 105
    Height = 137
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 169
    Height = 21
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 0
    Text = '0'
  end
  object BOff: TButton
    Left = 8
    Top = 40
    Width = 25
    Height = 25
    Caption = 'Off'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BOffClick
  end
  object BC: TButton
    Left = 56
    Top = 40
    Width = 25
    Height = 25
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BCClick
  end
  object BCE: TButton
    Left = 88
    Top = 40
    Width = 25
    Height = 25
    Caption = 'CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BCEClick
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 224
    Width = 113
    Height = 57
    Caption = #1060#1091#1085#1082#1094#1080#1080
    TabOrder = 4
    object BFunc1: TButton
      Left = 0
      Top = 16
      Width = 33
      Height = 33
      Caption = 'exp(x)'
      TabOrder = 0
      OnClick = BFunc1Click
    end
    object BFunc2: TButton
      Tag = 5
      Left = 40
      Top = 16
      Width = 65
      Height = 33
      Caption = 'sqrt(x^2+y^2)'
      TabOrder = 1
      OnClick = BAllControlClick
    end
  end
  object BPlus: TButton
    Tag = 1
    Left = 128
    Top = 80
    Width = 25
    Height = 97
    Caption = '+'
    TabOrder = 5
    OnClick = BAllControlClick
  end
  object BDiv: TButton
    Tag = 4
    Left = 152
    Top = 80
    Width = 25
    Height = 25
    Caption = '/'
    TabOrder = 6
    OnClick = BAllControlClick
  end
  object BMult: TButton
    Tag = 3
    Left = 152
    Top = 104
    Width = 25
    Height = 25
    Caption = '*'
    TabOrder = 7
    OnClick = BAllControlClick
  end
  object BMinus: TButton
    Tag = 2
    Left = 152
    Top = 128
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 8
    OnClick = BAllControlClick
  end
  object BResult: TButton
    Tag = 5
    Left = 152
    Top = 152
    Width = 25
    Height = 25
    Caption = '='
    TabOrder = 9
    OnClick = BResultClick
  end
  object GroupBox1: TGroupBox
    Left = 128
    Top = 192
    Width = 49
    Height = 89
    Caption = #1055#1072#1084#1103#1090#1100
    Color = clSilver
    ParentColor = False
    TabOrder = 10
    object BMC: TButton
      Tag = 1
      Left = 8
      Top = 16
      Width = 33
      Height = 17
      Caption = #1052#1057
      TabOrder = 0
      OnClick = AllMamoryClick
    end
    object BMP: TButton
      Tag = 2
      Left = 8
      Top = 32
      Width = 33
      Height = 17
      Caption = #1052'+'
      TabOrder = 1
      OnClick = AllMamoryClick
    end
    object BMR: TButton
      Tag = 3
      Left = 8
      Top = 48
      Width = 33
      Height = 17
      Caption = 'MR'
      TabOrder = 2
      OnClick = AllMamoryClick
    end
    object BMS: TButton
      Tag = 4
      Left = 8
      Top = 64
      Width = 33
      Height = 17
      Caption = 'MS'
      TabOrder = 3
      OnClick = AllMamoryClick
    end
  end
  object B7: TButton
    Left = 16
    Top = 88
    Width = 25
    Height = 25
    Caption = '7'
    TabOrder = 11
    OnClick = BAllClick
  end
  object B8: TButton
    Left = 48
    Top = 88
    Width = 25
    Height = 25
    Caption = '8'
    TabOrder = 12
    OnClick = BAllClick
  end
  object B9: TButton
    Left = 80
    Top = 88
    Width = 25
    Height = 25
    Caption = '9'
    TabOrder = 13
    OnClick = BAllClick
  end
  object B4: TButton
    Left = 16
    Top = 120
    Width = 25
    Height = 25
    Caption = '4'
    TabOrder = 14
    OnClick = BAllClick
  end
  object B5: TButton
    Left = 48
    Top = 120
    Width = 25
    Height = 25
    Caption = '5'
    TabOrder = 15
    OnClick = BAllClick
  end
  object B6: TButton
    Left = 80
    Top = 120
    Width = 25
    Height = 25
    Caption = '6'
    TabOrder = 16
    OnClick = BAllClick
  end
  object B1: TButton
    Left = 16
    Top = 152
    Width = 25
    Height = 25
    Caption = '1'
    TabOrder = 17
    OnClick = BAllClick
  end
  object B2: TButton
    Left = 48
    Top = 152
    Width = 25
    Height = 25
    Caption = '2'
    TabOrder = 18
    OnClick = BAllClick
  end
  object B3: TButton
    Left = 80
    Top = 152
    Width = 25
    Height = 25
    Caption = '3'
    TabOrder = 19
    OnClick = BAllClick
  end
  object BChangeSing: TButton
    Left = 16
    Top = 184
    Width = 25
    Height = 25
    Caption = '+/-'
    TabOrder = 20
    OnClick = BChangeSingClick
  end
  object B0: TButton
    Left = 48
    Top = 184
    Width = 25
    Height = 25
    Caption = '0'
    TabOrder = 21
    OnClick = BAllClick
  end
  object BComa: TButton
    Left = 80
    Top = 184
    Width = 25
    Height = 25
    Caption = ','
    TabOrder = 22
    OnClick = BComaClick
  end
end
