{Vladyslav Mambetov}
{Date 2016.02.26-03.09}

program MM_3_4;

uses
  crt;

var
  k, n1, n2, dd, s, i, nn, n1c, p, kp: byte;
  titi, v: real;

begin
  {cleaning the screen}
  clrscr;
  
  {input data}
  //write('Number of columns: ');
  //read(k);
  //writeln;
  
  {main part}
  n1 := 104;
  n2 := 230;
  k := 3;
  
  writeln;
  writeln;
  n1 := n1 - 1;
  n2 := n2 - 1;
  n1c := n1;
  nn := n2 - n1;
  titi := nn / k;
  if frac(titi) = 0 then dd := trunc(titi)
  else dd := trunc(titi) + 1;
  if dd mod 2 = 1 then dd := dd + 1
  else dd := dd + 2;
  v := (dd * k - nn) / 2;
  
  while v >= k do
  begin
    v := v - k;
    dd := dd - 2;
    p := p + 2;
  end;
  
  //dd := dd - 2;
  
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
  
  while n1 < n1c + (n2 - n1c) / k - p  + 2 do
  begin
    write('║':5);
    n1 := n1 + 2;
    for i := 1 to k do
    begin
      s := n1 + (i - 1) * dd;
      if s <= n2 then 
        write('[':2, s, '] = ', char(s));
      if i <> k then write('│':2)
      else write('║':2);
    end;
    writeln;
    
    if (n1 <> 145) then 
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
      write('╢');
      writeln;
    end;
  end;
  
  write('╚':5);
  kp := 1;
  for i := 1 to 35 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write('╧');
    end
    else write('═');
  end;
  writeln('╝');
  
  {pause}
  readkey;
end.