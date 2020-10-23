unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    MemoClock: TMemo;
    RadBForm2: TRadioButton;
    RadBForm3: TRadioButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure RadBForm2Click(Sender: TObject);
    procedure RadBForm3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.RadBForm2Click(Sender: TObject);
begin
  RadBForm2.Checked := False;
  Form2.ShowModal;
end;

procedure TForm1.RadBForm3Click(Sender: TObject);
begin
  Form3.ShowModal;
  RadBForm3.Checked := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  MemoClock.Text := TimeToStr(Time);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  MemoClock.Text := TimeToStr(Time);
  rr := 0;
end;

end.
