unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Spin, ExtCtrls;

type
  TForm3 = class(TForm)
    SpeedButtonOn: TSpeedButton;
    SpeedButtonOff: TSpeedButton;
    EditHour: TEdit;
    SpinButtonHour: TSpinButton;
    SpinButtonMin: TSpinButton;
    EditMin: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure SpinButtonHourDownClick(Sender: TObject);
    procedure SpinButtonHourUpClick(Sender: TObject);
    procedure SpinButtonMinDownClick(Sender: TObject);
    procedure SpinButtonMinUpClick(Sender: TObject);
    procedure SpeedButtonOffClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButtonOnClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  TimeAlarm: TDateTime;
  rr : integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.SpinButtonHourUpClick(Sender: TObject);
begin
  EditHour.Text := IntToStr((StrToInt(EditHour.Text) + 1) mod 24);

  if Length(EditHour.Text) = 1 then
    EditHour.Text := '0' + EditHour.Text;
    
end;

procedure TForm3.SpinButtonHourDownClick(Sender: TObject);
begin
  EditHour.Text := IntToStr((StrToInt(EditHour.Text) - 1));

  if EditHour.Text = '-1' then
    EditHour.Text := '23';

  if Length(EditHour.Text) = 1 then
    EditHour.Text := '0' + EditHour.Text;
    
end;

procedure TForm3.SpinButtonMinUpClick(Sender: TObject);
begin
  EditMin.Text := IntToStr((StrToInt(EditMin.Text) + 1) mod 60);

  if Length(EditMin.Text) = 1 then
    EditMin.Text := '0' + EditMin.Text;
    
end;

procedure TForm3.SpinButtonMinDownClick(Sender: TObject);
begin
  EditMin.Text := IntToStr((StrToInt(EditMin.Text) - 1));

  if EditMin.Text = '-1' then
    EditMin.Text := '59';

  if Length(EditMin.Text) = 1 then
    EditMin.Text := '0' + EditMin.Text;
    
end;

procedure TForm3.SpeedButtonOffClick(Sender: TObject);
begin

  if Timer1.Enabled = False then Exit;

  Timer1.Enabled := False;

  ShowMessage('Будильник отключен.');
end;

procedure TForm3.Timer1Timer(Sender: TObject);
var
  HourNow, MinNow, SecNow, MSecNow, HourAlm, MinAlm, SecAlm, MSecAlm: word;
begin
  DecodeTime(Time, HourNow, MinNow, SecNow, MSecNow);
  DecodeTime(TimeAlarm, HourAlm, MinAlm, SecAlm, MSecAlm);

  If (HourNow = HourAlm) and (MinNow = MinAlm) then
  begin
    rr := 4;
    
    Timer1.Enabled := False;
    SpeedButtonOff.Down := True;
    ShowMessage('Сейчас ' + TimeToStr(TimeAlarm));
    SpeedButtonOff.Down := True;
    MessageBeep(0);

  end;
end;

procedure TForm3.SpeedButtonOnClick(Sender: TObject);
begin

  If Timer1.Enabled then Exit;

  TimeAlarm := EncodeTime(StrToInt(EditHour.Text),
    StrToInt(EditMin.Text), 0, 0);
    
  Timer1.Enabled := true;

  ShowMessage('Включен будильник на ' + TimeToStr(TimeAlarm));
end;

procedure TForm3.Timer2Timer(Sender: TObject);
var
  a, b, c: integer;
begin
  if rr > 0 then
  begin
    a := random(90) + 10;
    b := random(90) + 10;
    c := random(90) + 10;
    Form3.Color := a * 10000 + b * 100 + c;

    rr := rr - 1;
  end
  else
    Form3.Color := clBtnFace;
end;

end.
