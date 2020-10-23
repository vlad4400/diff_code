program lw4p1v2;

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

	SetIntVec(8, p);
End.
