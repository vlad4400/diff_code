{Vladyslav Mambetov}
{Date 2016.02.24}

program AL3;

uses
  crt;

var
  n1, n1c, n2, d, dd, kp, i, k: byte;

begin
  {cleaning the screen}
  clrscr;
  
  {main part}
  n1 := 65;
  n2 := 104;
  
  writeln;
  write('╔':5);
  kp := 1;
  for i := 1 to 35 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╤');
    end
    else write('═');
  end;
  writeln('╗');
  
  n1 := n1 + 1;
  n1c := n1;
  if (n2 - n1) mod 3 = 0 then 
    d := (n2 - n1) div 3
  else d := (n2 - n1) div 3 + 1;
  
  if d mod 2 = 1 then d := d + 1;
  repeat
    write('║':5);
    write('[':3, n1, '] = ', chr(n1));
    write('│':2);
    dd := n1 + d;
    if dd <= n2 then
    begin
      write('[':3, dd, '] = ', chr(dd));
      dd := dd + d;
      write('│':2);
      if dd <= n2 then
      begin
        if dd > 99 then k := 1
        else k := 0;
        write('[':3 - k, dd, '] = ', chr(dd));
        write('║':2);
        writeln;
      end
      else 
      begin
        writeln;
      end;
      if (n1 <> 78) then 
      begin
        kp := 1;
        write('╟':5);
        for i := 1 to 35 do
        begin
          if i = 12 * kp then
          begin
            kp := kp + 1;
            write('┼');
          end
          else write('─');
        end;
        if n1 = 76 then write('╜')
        else write('╢');
        writeln;
      end;
      
    end
    else writeln;
    n1 := n1 + 2;
  until n1 >= n1c + d;
  
  write('╚':5);
  kp := 1;
  for i := 1 to 23 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╧');
    end
    else write('═');
  end;
  writeln('╛');
  
  {pause}
  readkey;
end.