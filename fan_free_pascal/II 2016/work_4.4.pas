{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var i, n, k, kp :byte;

begin
  {cleaning the screen}
  clrscr;


  {main part}
  n := 230;
  n := n + 1;
  writeln;
  write('╔':3);
  kp := 1;
  for i:= 1 to 47 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╤');
    end
    else write('═');
  end;
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
      write('[':2,n,'] = ',char(n));
      if i < 5 then write('│':2);
    end;
    if n = 105 then k := 12
      else k := 2;
    write('║':k);
    writeln;
  end;
  write('╚':3);
  kp := 1;
  for i:= 1 to 47 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╧');
    end
    else write('═');
  end;
  write('╝');
  writeln;
  
  {pause}
  readkey;
end.
