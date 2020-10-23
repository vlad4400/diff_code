program lw4p1v1;

uses Dos, Crt;

Var x:integer;
	{t:real;}
    {c:real;}
    {a:real;}
    {b:real;}
    p:pointer;

Procedure myint8;
	Interrupt;
Begin
	x:=x+1;
	gotoxy(5,5);
	Write(x);
	Port[$20]:=$20;
End;

Begin
	clrscr;
  {
	port[$43]:=$36;
	port[$40]:=$FF;
	port[$40]:=$FF;
  }

	GetIntVec(8,p);
	SetIntVec(8, @myint8);

	readln;

	SetIntVec(8,p);
End.
