unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    EOperand1: TEdit;
    EOperand2: TEdit;
    EResult: TEdit;
    LSingOperation: TLabel;
    LSingEqully: TLabel;
    BitBtnPlus: TBitBtn;
    BitBtnMinus: TBitBtn;
    BitBtnMultiplication: TBitBtn;
    BitBtnDivision: TBitBtn;
    BitBtnClear: TBitBtn;
    BitBtnClose: TBitBtn;
    procedure BitBtnClearClick(Sender: TObject);
    procedure BtnOperatorClick(Sender: TObject);
    procedure OnChangeOperands(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

{
Процедура обнуления афифмометра, ставит их в исходное состояние.
}
procedure TForm2.BitBtnClearClick(Sender: TObject);
begin
    EOperand1.Clear;
    EOperand2.Clear;
    EResult.Clear;
    LSingOperation.Caption := '?';
end;

{
*Процедура ыполняет одну из четерех арифметических операций +, -, *, /.
*Отлавливает ошибки, и выводит сообщение о типе ошибке, если оно известна,
иначе вывести что тип ошибки неизвестен.
}
procedure TForm2.BtnOperatorClick(Sender: TObject);
begin

  try

    case (Sender as TBitBtn).Tag of
      0: EResult.Text := FloatToStr(StrToFloat(EOperand1.Text)
        + StrToFloat(EOperand2.Text));
      1: EResult.Text := FloatToStr(StrToFloat(EOperand1.Text)
        - StrToFloat(EOperand2.Text));
      2: EResult.Text := FloatToStr(StrToFloat(EOperand1.Text)
        * StrToFloat(EOperand2.Text));
      3: EResult.Text := FloatToStr(StrToFloat(EOperand1.Text)
        / StrToFloat(EOperand2.Text));
    end;

  except
    on EConvertError do ShowMessage('Попытка неверного преобразования типов'
      + 'например при вызове функций StrToInt, StrToFloat, StrToDate.');
    on EZeroDivide do ShowMessage('Деление на ноль');
      on EIntError do ShowMessage('Ошибка с целочисленной математической'
      + ' операцией');
  else
    ShowMessage('Неизвестная ошибка');
  end;

end;

{
При изменении значения первого или второго операнда очищаем поле результа.
}
procedure TForm2.OnChangeOperands(Sender: TObject);
begin
  EResult.Clear;
end;

end.
