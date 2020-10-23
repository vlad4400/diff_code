program lr5_1;
uses Dos,Crt;
Var
    a: byte;
    p: pointer;
    flag_a: boolean;

Procedure myKey;
Interrupt;
Begin
a:=port[$60];
write(a);
if a = 129 then
  flag_a := true;
Port[$20]:=$20;
End;

Begin
	clrscr;
	GetIntVec(9,p);
	SetIntVec(9, @myKey);
  repeat until flag_a;
  SetIntVec(9,p);
end.
