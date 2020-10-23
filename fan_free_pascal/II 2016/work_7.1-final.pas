{Vladyslav Mambetov}
{Date 2016.03.12-17}

program work27b;

uses crt;

var
  y :array[1..60] of real;
  x :array[1..30] of real;
  i :byte;
  
begin
  clrscr;
  
  for i := 1 to 60 do
  begin
    y[i] := 10 * random - 3;
    writeln(' {y',i,'} = ',y[i]);
  end;
  
  writeln;
  
  for i := 1 to 30 do
  begin
    x[i] := y[i*2];
    writeln(' {x',i,'} = ',x[i]);
  end;
  
  writeln;
  
  readkey;
end.