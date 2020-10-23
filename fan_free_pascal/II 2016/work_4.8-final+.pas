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
  
  write(chr(201):x);
  kp := 1;
  for i:= 1 to 47 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write(chr(209));
    end
      else write(chr(205));
  end;
  writeln(chr(187));
  
  while n > 104 + 2 do
  begin
    i := 1;
    write(chr(186):x);
    while (i < 4 + 1) and (n > 104 + 2) do
    begin
      i := i + 1;
      n := n - 2;
      write('[':2,n,'] = ',chr(n));
      case i of
      1,2,3: write(chr(179):2);
      4: if n <> 105 then write(chr(179):2);
      end;
    end;
    
    if n = 105 then writeln(chr(179):2)
      else writeln(chr(186):k+2);
    
    if n > 105 then 
    begin
      kp := 1;
      write(chr(199):x);
      for i:= 1 to 47 do
      begin
        if i = 12 * kp then
        begin
          kp := kp + 1;
          write(chr(197));
        end
          else write(chr(196));
      end;
      if n = 111 then writeln(chr(189))
        else writeln(chr(185));
    end;
  end;
  
  write(chr(200):x);
  kp := 1;
  for i:= 1 to 35 do
  begin
    if i = 12 * kp then
    begin
      kp := kp + 1;
      write(chr(207));
    end
      else write(chr(205));
  end;
  writeln(chr(190));
  
  {pause}
  readkey;
end.
