unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    BOff: TButton;
    BC: TButton;
    BCE: TButton;
    Bevel1: TBevel;
    GroupBox2: TGroupBox;
    BFunc1: TButton;
    BFunc2: TButton;
    BPlus: TButton;
    BDiv: TButton;
    BMult: TButton;
    BMinus: TButton;
    BResult: TButton;
    GroupBox1: TGroupBox;
    BMC: TButton;
    BMP: TButton;
    BMR: TButton;
    BMS: TButton;
    B7: TButton;
    B8: TButton;
    B9: TButton;
    B4: TButton;
    B5: TButton;
    B6: TButton;
    B1: TButton;
    B2: TButton;
    B3: TButton;
    BChangeSing: TButton;
    B0: TButton;
    BComa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BOffClick(Sender: TObject);
    procedure BAllClick(Sender: TObject);
    procedure BComaClick(Sender: TObject);
    procedure BAllControlClick(Sender: TObject);
    procedure BResultClick(Sender: TObject);
    procedure BCClick(Sender: TObject);
    procedure BCEClick(Sender: TObject);
    procedure BChangeSingClick(Sender: TObject);
    procedure AllMamoryClick(Sender: TObject);
    procedure BFunc1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FlagStart, FlagPoint: Boolean;
  Operation: Integer;
  Op1, Op2, Storage: Extended;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FlagStart := true;
  FlagPoint := false;
  Operation := 0;
  Storage := 0;
end;

procedure TForm1.BOffClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.BAllClick(Sender: TObject);
begin

  if FlagStart then
  begin
    FlagStart := false;
    Edit1.Text := TButton(Sender).Caption;
  end else
    if Edit1.Text <> '0' then
      Edit1.Text := Edit1.Text + TButton(Sender).Caption
    else
      if StrToFloat(Edit1.Text) = 0 then
        Edit1.Text := TButton(Sender).Caption;

end;

procedure TForm1.BComaClick(Sender: TObject);
begin

  if FlagStart = false then
  begin
      if FlagPoint = false then
      begin
        FlagPoint := true;
        Edit1.Text := Edit1.Text + ',';
      end;
  end else
    if (StrToFloat(Edit1.text) = 0) or FlagStart then
    begin
        FlagStart := false;
        FlagPoint := true;
        Edit1.Text := '0,';
    end;

end;

procedure TForm1.BAllControlClick(Sender: TObject);
begin
  Operation := TButton(Sender).Tag;
  Op1 := StrToFloat(Edit1.Text);
  FlagStart := true;
  FlagPoint := false;
end;

procedure TForm1.BResultClick(Sender: TObject);
begin

  if FlagStart then Exit;
  if Operation = 0 then Exit;
  
  Op2 := StrToFloat(Edit1.Text);

  try
    case Operation of
      1: Op1 := Op1 + Op2;
      2: Op1 := Op1 - Op2;
      3: Op1 := Op1 * Op2;
      4: Op1 := Op1 / Op2;
      5: Op1 := sqrt(Op1*Op1 + Op2*Op2);
    end;
  except
    on EZeroDivide do ShowMessage('Деление на ноль');
  else
    ShowMessage('Неизвестная ошибка');
  end;

  Edit1.Text := FloatToStr(Op1);
  FlagStart := true;
  FlagPoint := false;
  Operation := 0;

end;

procedure TForm1.BCClick(Sender: TObject);
begin
  Edit1.Text := '0';
  FlagStart := true;
  FlagPoint := false;
  Op1 := 0;
end;

procedure TForm1.BCEClick(Sender: TObject);
begin
  Edit1.Text := '0';
  FlagStart := true;
  FlagPoint := false;
end;

procedure TForm1.BChangeSingClick(Sender: TObject);
begin
  Edit1.Text := FloatToStr((-StrToFloat(Edit1.Text)));
end;

procedure TForm1.AllMamoryClick(Sender: TObject);
begin

  case TButton(Sender).Tag of
    1: Storage := 0;
    2: Storage := Storage + StrToFloat(Edit1.Text);
    3: begin
          Edit1.Text := FloatToStr(Storage);
          Flagstart:=false;
          end;
    4: Storage := StrToFloat(Edit1.Text);
  end;

end;

procedure TForm1.BFunc1Click(Sender: TObject);
begin
  Edit1.Text := FloatToStr(exp(StrToFloat(Edit1.Text)));
  
  FlagStart := true;
  FlagPoint := false;
end;

end.
