{Vladyslav Mambetov}
{Date 2016.02.24}

program ASCII;

uses crt;

var i, n :byte;

begin
  {cleaning the screen}
  clrscr;

  {main part}
  n := 230;
  n := n + 1;
  while n > 104 + 2 do
  begin
    i := 1;
    while (i < 4 + 1) and (n > 104 + 2) do
    begin
      i := i + 1;
      n := n - 2;
      write('[':4,n,'] = ',char(n));
    end;
    writeln;
  end;

  {pause}
  readkey;
end.
