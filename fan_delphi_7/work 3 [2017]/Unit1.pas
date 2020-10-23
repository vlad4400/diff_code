unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdValueBB: TEdit;
    BShowBBList: TButton;
    BExit: TButton;
    procedure BExitClick(Sender: TObject);
    procedure BShowBBListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.BExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.BShowBBListClick(Sender: TObject);
begin
  Form2.ShowModal;
  EdValueBB.Text:= IntToStr(Form2.ModalResult);
end;

end.
