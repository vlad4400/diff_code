{Vladyslav Mambetov}
{Date 2016.03.20}

program g5;

uses crt;

var
  z :array[1..85] of real;
  i, index :byte;
  min, s, n :real;
  
begin
  clrscr;
  
  min := 15;
  randomize;
  for i := 1 to 85 do
  begin
    z[i] := 20 * random - 5;
    writeln('{z',i,'} = ',z[i]);
    if z[i] > 0 then
    begin
      s := s + z[i];
      n := n + 1;
      if z[i] < min then
      begin
        min := z[i];
        index := i;
      end;
    end;
  end;
  s := exp(ln(s)*(1/n));
  writeln;
  writeln('Minimum with positive the z[',index,'] = ',min);
  writeln('Geometric mean: ',s);
  
  readkey;
end.