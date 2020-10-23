{Vladyslav Mambetov}
{Date 2016.03.05-10}

program ASCII;

uses
  crt;

var
  chng, n2, clm, shw, sgn, i, j, k, v, vc, x, y, left, right, df: byte;
  min, max: string;
  n1, chk, nn, d, h1, h2, res, iu, n1c, n, vv: longint;
  //df - doubtful;
  //iu - iconic unit;
  //chng - change character codes consecutively by rows or columns;
  //clm - the number of columns;
  //min, max - minimum, maximum;
  //shw - what show codes;
  //chk - the pitch;

begin
  {CLEANING THE SCREEN}
  clrscr;
  
  
  {ENTER THE DATE}
  
  write(' Enter an starting value: ');
  readln(min);
  writeln;
  
  write(' Enter the final value: ');
  readln(max);
  writeln;
  
  writeln(' What are the codes of characters you wont display even?');
  writeln(' 1 - an even codes');
  writeln(' 2 - an uneven codes');
  writeln(' 3 - of a predetermined pitch');
  write(' Answer: ');
  read(shw);
  writeln;
  
  If shw = 3 then
    begin
      write(' Enter the pitch: ');
      read(chk);
      writeln;
    end;
  
  write(' Enter how change character codes by rows(1) or colomns(2): ');
  read(chng);
  writeln;
  
  write(' Enter the number of culumns: ');
  readln(clm);
  
  clrscr;
  
  {min := '159';
  max := '01';
  shw := 3;
  chk := 4;
  clm := 6;
  chng := 2;}
  
  {RAPID CHANGES IN DESIGN}
  df := 12; ///danger!!!(df = 12)
  x := 5;
  y := 2;
  left := 0;
  right := 0;
  
  df := df + left + right;
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  if length(min) = 1 then
    n1 := ord(min[1])
  else n1 := strtoint(min);
  
  if length(max) = 1 then
    n2 := ord(max[1])
  else n2 := strtoint(max);
  
  
  {output the string on dysplay}
  writeln;
  write(' To display ');
  if chng = 1 then
  begin
    write('by row');
    write('s');
  end
  else 
  begin
    write('by colomn');
    if clm <> 2 then write('s');
  end;
  case shw of
    1: write(' an even codes');
    2: write(' an uneven codes');
    3: write(' of a pitch ', chk);
  end;
  write(' from ', n1, '[');
  case n1 of
    7, 8, 9, 10, 13: write('?');
  else write(char(n1));
  end;
  write('] ');
  if n1 < n2 then
  begin
    write('forwards');
    sgn := 1;
  end
  else write('backwards');
  write(' to ', n2, '[');
  case n2 of
    7, 8, 9, 10, 13: write('?');
  else write(char(n2));
  end;
  write('] in ', clm, ' column');
  if clm > 1 then write('s');
  write('.');
  
  writeln;
  
  
  {MAIN PART}
  if sgn = 1 then iu := 1
  else iu := -1;
  if (shw = 1) or (shw = 2) then chk := 2;
  if (shw = 1) and (n1 mod 2 = 1) then n1 := n1 + iu;
  if (shw = 2) and (n1 mod 2 = 0) then n1 := n1 + iu;
  
  nn := (n2 - n1) * iu;
  while frac(nn / chk) <> 0 do
  begin
    n2 := n2 - 1 * iu;
    nn := (n2 - n1) * iu;
  end;
  
  chk := chk * iu;
  
  n := trunc(nn / chk * iu) + 1;
  
  if n < clm then clm := n;
  
  h1 := trunc(n / clm);
  if frac(n / clm) = 0 then h2 := trunc(n / clm)
  else h2 := trunc(n / clm) + 1;
  
  v := n - h1 * clm;
  vc := v;
  
  if vc = 0 then vc := clm;
  
  {writeln;
  writeln(' clm: ', clm);
  writeln(' iu: ', iu);
  writeln(' n1: ', n1);
  writeln(' n2: ', n2);
  writeln(' chk: ', chk);
  writeln(' nn: ', nn);
  writeln(' n: ', n);
  writeln(' h1: ', h1);
  writeln(' h2: ', h2);
  writeln(' v: ', v);
  writeln;}
  
  
  if chng = 1 then
  begin
    d := chk;
    chk := clm * chk;
    v := clm;
    vv := -1;
  end
  else
  begin
    d := h2 * chk;
    if v = 0 then v := clm;
  end;
  
  {writeln(' chk:', chk);
  writeln(' d:', d);
  writeln(' v:', v);
  writeln;}
  
  for i := 1 to y do writeln;
  write('':x, '╔');
  for i := 1 to clm * df do
    if i mod df <> 0 then 
      write('═') 
    else if i <> clm * df then write('╤');
  write('╗');
  writeln;
  
  n1 := n1 - chk;
  for i := 1 to h2 do
  begin
    write('':x, '║');
    n1 := n1 + chk;
    n1c := n1;
    for j := 0 to clm - 1 do
    begin
      if (i = h2) and (j >= v) then n1c := 255 * iu;
      if (n1c <> 255 * iu) or (n1c = n2) then
      begin
        res := n1c + j * d;
        if j > v then res := n1c + j * d - chk * (j - v);
        case length(inttostr(res)) of
          1: k := 3;
          2: k := 2;
          3: k := 1;
        end;
        if res * iu <= n2 * iu then
        begin
          case res of
            7, 8, 9, 10, 13, 149: write(' ':k + left, '[', res, '] = ?');
          else write(' ':k + left, '[', res, '] = ', chr(res));
          end;
        end
        else n1c := 255 * iu;
      end;
      
      if (j + 1 <> clm) and (i <> h2) then write('':right,' │') 
      else if (i <> h2) then write('':right,' ║');
      if (j + 1 <> clm) and (i = h2) and (j < vc) then write('':right,' │') 
      else if (i = h2) and (j < vc) then write('':right,' ║');
    end;
    if i <> h2 then
    begin
      writeln;
      write('':x, '╟');
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
  
  write('':x, '╚');
  for i := 1 to vc * df do 
    if i mod df <> 0 then 
      write('═') 
    else if i <> vc * df then write('╧');
  if (vc = clm) then writeln('╝')
  else writeln('╛');
  
  {PAUSE}
  readkey;
end.