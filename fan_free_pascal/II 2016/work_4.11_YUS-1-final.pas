{Vladyslav Mambetov}
{Data 2016.03.12}

program ASCII;

uses
  crt;

var
  chk, i, nn, n1, n2, n, h1, h2, clm, df, v, vc, j, n1c, res, d, k: byte;

begin
  clrscr;
  
  {receive data entered from the keyboard}
  write(' Enter the step: ');
  read(chk);
  writeln;
  
  {primary data processing}
  n1 := ord('%');
  n2 := ord('m');
  clm := 4;
  df := 12;
  nn := (n2 - n1);
  
  while frac(nn / chk) <> 0 do
  begin
    n2 := n2 - 1;
    nn := (n2 - n1);
  end;
  
  n := trunc(nn / chk) + 1;
  
  if n < clm then clm := n;
  
  h1 := trunc(n / clm);
  if frac(n / clm) = 0 then h2 := trunc(n / clm)
  else h2 := trunc(n / clm) + 1;
  
  v := n - h1 * clm;
  vc := v;
  
  if vc = 0 then vc := clm;
  d := h2 * chk;
  if v = 0 then v := clm;
  
  {main part}
  write(' ╔');
  for i := 1 to clm * df do
    if i mod df <> 0 then 
      write('═') 
    else if i <> clm * df then write('╤');
  write('╗');
  writeln;
  
  n1 := n1 - chk;
  for i := 1 to h2 do
  begin
    write(' ║');
    n1 := n1 + chk;
    n1c := n1;
    for j := 0 to clm - 1 do
    begin
      if (i = h2) and (j >= v) then n1c := 255;
      if (n1c <> 255) or (n1c = n2) then
      begin
        res := n1c + j * d;
        if j > v then res := n1c + j * d - chk * (j - v);
        case length(inttostr(res)) of
          2: k := 2;
          3: k := 1;
        end;
        if res <= n2 then
        begin
          case res of
            7, 8, 9, 10, 13, 149: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(res));
          end;
        end
        else n1c := 255;
      end;
      
      if (j + 1 <> clm) and (i <> h2) then write(' │') 
      else if (i <> h2) then write(' ║');
      if (j + 1 <> clm) and (i = h2) and (j < vc) then write(' │') 
      else if (i = h2) and (j < vc) then write(' ║');
    end;
    
    if i <> h2 then
    begin
      writeln;
      write(' ╟');
      for  j := 1 to clm * df do 
        if j mod df <> 0 then 
          write('─') 
        else if j <> clm * df then
        begin
          if (h1 = i) and (j div df > vc) then
          begin
            write('┴');
          end
          else write('┼');
        end;
      
      if i = h1 then write('╜')
      else write('╢');
    end;
    writeln;
  end;
  
  write(' ╚');
  for i := 1 to vc * df do 
    if i mod df <> 0 then 
      write('═') 
    else if i <> vc * df then write('╧');
  if (vc = clm) then writeln('╝')
  else writeln('╛');
  
  //readkey;
end.