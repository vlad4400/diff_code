{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var i, n, k :byte;

begin
  {cleaning the screen}
  clrscr;


  {main part}
  n := 230;
  n := n + 1;
  writeln;
  write('╔':3);
  for i:= 1 to 50 do
    write('═');
  write('╗');
  
  writeln;
  while n > 104 + 2 do
  begin
    i := 1;
    write('║':3);
    while (i < 4 + 1) and (n > 104 + 2) do
    begin
      i := i + 1;
      n := n - 2;
      write('[':4,n,'] = ',char(n));
    end;
    if n = 105 then k := 15
    else k := 3;
    write('║':k);
    writeln;
  end;
  write('╚':3);
  for i:= 1 to 50 do
    write('═');
  write('╝');
  writeln;
  
  {pause}
  readkey;
end.
