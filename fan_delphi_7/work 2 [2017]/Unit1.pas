unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: Integer;
  c: Extended;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  b: Extended;

begin
  a := StrToInt(Edit1.Text);
  c := StrToFloat(Edit2.Text);

  b := a + c;

  Label2.Caption := FloatToStr(b);
end;

end.
