program lw4p3v2;

uses Dos,Crt;

Var a:integer;
    t:integer;
    p:pointer;
    i:integer;

procedure MyDelay(t:integer);
begin
  t := t * 5000;
  port[$43]:=$36;
  port[$40]:=$FF;
  port[$40]:=$FF;

  for i := 1 to t do
  Begin
    Repeat
    until(port[$40] = 0);
    port[$40]:=$FF;
    port[$40]:=$FF;
  end;
end;

Procedure myint8;
  Interrupt;
Begin
  a := a + 1;
  gotoxy(3, 5);
  Write(a);
  Port[$20] := $20;
End;

Begin
  clrscr;
  port[$43] := $36;
  port[$40] := $FF;
  port[$40] := $FF;

  GetIntVec(8,p);
  SetIntVec(8, @myint8);

  port[$21] := 2;
  mydelay(2);
  port[$21] := 0;

  SetIntVec(8,p);
End.
