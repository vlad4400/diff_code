unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseClick(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BeginDraw: Boolean;
  BeginX, BeginY, EndX, EndY: Integer;

implementation

{$R *.dfm}
{$R MyCursor1.res}
  const crCur=5;


procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clRed;

  Screen.Cursors[crCur] := LoadCursor(hInstance, 'Pen_Cursor');

  With Image1 do
  begin
    OnMouseDown := nil;
    OnMouseMove := nil;
    OnMouseUp := nil;
  end;

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BeginDraw := True;
  BeginX := X; BeginY := Y;
  EndX := X; EndY := Y;
  Image1.Canvas.Pen.Mode := PmNotXor;
end;

procedure TForm1.Image1MouseClick(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

  If BeginDraw then
  begin

    With Image1.Canvas do
    begin
      MoveTo(BeginX, BeginY); LineTo(EndX, EndY);
      MoveTo(BeginX, BeginY); LineTo(X, Y);
      EndX := X; EndY := Y;
    end;

  end;

end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  BeginDraw := False;
  Image1.Canvas.Pen.Mode := pmCopy;

  With Image1.Canvas do
  begin
    MoveTo(BeginX, BeginY); LineTo(X, Y);
  end;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Form1.Cursor := crDefault;
  
  With Image1 do
  begin
    OnMouseDown := nil;
    OnMouseMove := nil;
    OnMouseUp := nil;
  end;

end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Form1.Cursor := crCur;

  With Image1 do
  begin
    OnMouseDown := Image1MouseDown;
    OnMouseMove := Image1MouseClick;
    OnMouseUp := Image1MouseUp;
  end;

end;

end.
