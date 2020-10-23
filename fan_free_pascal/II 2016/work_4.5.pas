{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var i, n, k, kp, x, y :byte;

begin
  {cleaning the screen}
  clrscr;


  {main part}
  n := 230;
  x := 5;
  y := 1;
  
  n := n + 1;
  for i := 1 to y do writeln;
  write('╔':x);
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
    write('║':x);
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
    
    if n > 105 then begin
    kp := 1;
    write('╟':x);
    for i:= 1 to 47 do
      begin
        if i = 12 * kp then
        begin
          kp := kp + 1;
          write('┼');
        end
          else write('─');
      end;
    write('╢');
    writeln;
    end;
    
  end;
  write('╚':x);
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
