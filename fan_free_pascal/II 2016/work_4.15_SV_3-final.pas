{Vladyslav Mambetov}
{Date 2016.02.28-03.10}

program SV_3;

uses
  crt;

var
  n1, n2, x, kp, i, k, nn: byte;

begin
  {cleaning the screen}
  clrscr;
  
  {input date}
  write('Enter the number of first char: ');
  read(n1);
  clrscr;
  writeln('You have entered the number: ', n1);
  writeln;
  
  {main part}
  n2 := 144;
  x := 5;
  kp := 1;
  
  write('╔':x);
  for i := 1 to 23 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╤');
    end
    else write('═');
  end;
  writeln('╗');
  
  n2 := n2 + 1;
  if n1 mod 2 = 1 then n1 := n1 + 1;
  nn := n2 - n1;
  repeat
    if n1 >= 100 then k := 2
    else if n1 < 10 then k := 4
    else k := 3;
    write('║':x);
    case n1 of
      7, 8, 9, 10, 13, 149: write('[':k, n1, '] = ?');
    else write('[':k, n1, '] = ', chr(n1));
    end;
    write('│':2);
    if n1 = 144 then writeln;
    n1 := n1 + 2;
    if n1 < n2 then
    begin
      if n1 >= 100 then k := 2
      else if n1 < 10 then k := 4
      else k := 3;
      case n1 of
        7, 8, 9, 10, 13, 149: write('[':k, n1, '] = ?');
      else write('[':k, n1, '] = ', chr(n1));
      end;
      writeln(' ║');
      n1 := n1 + 2;
    end
    else n1 := n1 + 2;
    
    if n1 < 146 then 
    begin
      kp := 1;
      write('╟':x);
      for i := 1 to 23 do
      begin
        if i = 12 * kp then
        begin
          kp := kp + 1;
          write('┼');
        end
        else write('─');
      end;
      if (n1 = 111) or (n1 = 144) then write('╜')
      else write('╢');
      writeln;
    end;
    
  until n1 > n2;
  
  if n1 = 148 then nn := 1
  else nn := 2;
  
  write('╚':x);
  kp := 1;
  for i := 1 to 11 * nn do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╧');
    end
    else write('═');
  end;
  if n1 = 148 then write('╛')
  else write('═╝');
  writeln;
  
  {pause}
  readkey;
end.