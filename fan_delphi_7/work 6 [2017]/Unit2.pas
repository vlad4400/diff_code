unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    BStartStop: TButton;
    EditStopwatch: TEdit;
    Timer1: TTimer;
    ButtonR: TButton;
    BitBtnClose: TBitBtn;
    procedure BStartStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ButtonRClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  StartTime: TDateTime;
  FlagStartTime: Boolean;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.BStartStopClick(Sender: TObject);
begin

  If Timer1.Enabled then
  begin
    Timer1.Enabled := False;
    BStartStop.Caption := 'Старт';
    StartTime := Time - StartTime;
  end
  else
    begin
      Timer1.Enabled := True;
      BStartStop.Caption := 'Стоп';
      StartTime := Time - StartTime;
      FlagStartTime := False;
    end;
  
end;

procedure TForm2.Timer1Timer(Sender: TObject);
var
  Min, Sec, MSec: Word;
  StrTime: String;
  i: integer;
begin
    DecodeTime(Time - StartTime, Min, Min, Sec, MSec);

    For i := 1 to 2 - Length(FloatToStr(Min)) do
    begin
      StrTime := StrTime + '0';
    end;

    StrTime := StrTime + IntToStr(Min) + ':';

    For i := 1 to 2 - Length(IntToStr(Sec)) do
    begin
      StrTime := StrTime + '0';
    end;

    StrTime := StrTime + IntToStr(Sec) + '.';

    For i := 1 to 2 - Length(IntToStr(MSec)[1] + IntToStr(MSec)[2]) do
    begin
      StrTime := IntToStr(MSec)[1] + IntToStr(MSec)[2] + '0';
    end;

    StrTime := StrTime + IntToStr(MSec)[1] + IntToStr(MSec)[2];
    
    
    EditStopwatch.Text := StrTime;

end;

procedure TForm2.ButtonRClick(Sender: TObject);
begin
  StartTime := StartTime - StartTime;
  Timer1.Enabled := False;
  BStartStop.Caption := 'Старт';
  EditStopwatch.Text := '00:00.00';
end;

begin
  FlagStartTime := True;
end.
