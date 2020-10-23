{Vladyslav Mambetov}
{Date 2016.02.24}

program ASCII;

uses crt;

var s, v, n, i :byte;

begin
  {cleaning the screen}
  clrscr;

  {main part}
  n := 230;
  n := n + 1;
  s := (n - 104) div 4;
  while {(n > w - s) and }(n - 3*s - 5 > 104) do
  begin
      n := n - 2;
      write('[':4,n,'] = ',char(n));
      v := n - s - 1;
      write('[':4,v,'] = ',char(v));
      v := v - s - 1;
      write('[':4,v,'] = ',char(v));
      v := v - s - 1;
      writeln('[':4,v,'] = ',char(v));
  end;
  v := n - 2;
  for i:=1 to ((230+1-104) mod 4) do
  begin
    write('[':4,v,'] = ',char(v));
    v := v - s - 1;
  end;

  {pause}
  readkey;
end.