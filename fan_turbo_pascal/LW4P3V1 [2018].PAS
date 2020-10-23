program lw4p3v1;

uses Dos, Crt;

Var a: integer;
    p: pointer;

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

	GetIntVec(8, p);
	SetIntVec(8, @myint8);

	readln;
  writeln('you pressed enter');

	port[$21] := 2;
  delay(2000);
	port[$21] := 0;

	SetIntVec(8, p);
End.
