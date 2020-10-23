program nomer3;
uses crt;

var 
  min, max, H, z, x, y, A, B :real;

begin
  clrscr;
  
  Write('Enter the z = ');
  ReadLn(z);
  Write('Enter the x = ');
  ReadLN(x);
  Write('Enter the y = ');
  ReadLn(y);
  
  A := x - z;
  B := y;
  
  If (A = B) or (x = z)
    then Write('Error of Imput x - z = y, or x = z.')
    else 
    Begin
      If A < B
        then min := A
        else min := B;
      If x > z
        then max := x
        else max := z;
      H := min/(max + z);
      clrscr;
      WriteLn('z = ',z:0:2);
      WriteLn('x = ',x:0:2);
      WriteLn('y = ',y:0:2);
      WriteLn('H = ',H:5:2);
    End;
  
  ReadKey;
end.                 
