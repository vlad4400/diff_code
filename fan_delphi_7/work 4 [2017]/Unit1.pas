unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    RadGroupTool: TRadioGroup;
    BExit: TButton;
    procedure BExitClick(Sender: TObject);
    procedure RadGroupToolClick(Sender: TObject);
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
{
��������� �������� ����������.
}
procedure TForm1.BExitClick(Sender: TObject);
begin
  Close;
end;

{
*���� ��� ������ ����������, �� ��������� ����� ���� � ������������,
�������� ���. ����� �������� ���������� ���������� RadioGroup
�������� ItemIndex ����������� -1(�� ������ �� ���� ������� �����������).
*���� ��� ������ �����������, �� ������� ���������, ��� �� �� ��������.
}
procedure TForm1.RadGroupToolClick(Sender: TObject);
begin

  Case RadGroupTool.ItemIndex of
    0:
      begin
        Form2.EOperand1.Clear;
        Form2.EOperand2.Clear;
        Form2.EResult.Clear;
        Form2.LSingOperation.Caption := '?';

        Form2.ShowModal;
        
        RadGroupTool.ItemIndex := -1;
      end;
    1: ShowMessage('���������� ������������ �� ���������');
  end;

end;

end.
 