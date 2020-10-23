{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var i, n, k, kp, x, y :byte;

begin
  {cleaning the screen}
  clrscr;


  {main part}
  x := 5;
  y := 1;
  
  n := 230;
  
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
      case i of
      1,2,3: write('│':2);
      4: if n <> 105 then write('│':2);
      end;
    end;
    
    if n = 105 then write('│':2)
      else write('║':k+2);
    writeln;
    
    if n > 119 then 
    begin
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
    
    if (n <= 119) and (n > 111) then
    begin
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
    
    if (n <= 111) and (n > 105) then
    begin
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
      write('╜');
      writeln;
    end;
    
  end;
  write('╚':x);
  kp := 1;
  for i:= 1 to 35 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╧');
    end
      else write('═');
  end;
  write('╛');
  writeln;
  
  {pause}
  readkey;
end.
