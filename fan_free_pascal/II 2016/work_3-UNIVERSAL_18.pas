{Vladyslav Mambetov}
{Date 2016.03.05-09}

program ASCII;

uses
  crt;

var
  chng, n2, clm, shw, sgn, i, j, k, n: byte;
  min, max: string;
  n1, chk, nn, d, h1, h2, res, iu, n1c: longint;
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
  
  {write(' Enter an starting value: ');
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
      write('Enter the pitch: ');
      read(chk);
      writeln;
    end;
  
  write(' Enter how change character codes by rows(1) or colomns(2):');
  read(chng);
  writeln;}
  
  //write(' Enter the number of culumns: ');
  //readln(clm);
  //writeln;
  
  clrscr;
  
  min := '000000100';
  max := '00000060';
  shw := 3;
  chk := 4;
  clm := 5;
  chng := 2;
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  if length(min) = 1 then
    n1 := ord(min[1])
  else n1 := strtoint(min);
  
  if length(max) = 1 then
    n2 := ord(max[1])
  else n2 := strtoint(max);
  
  
  {output the string on dysplay}
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
  writeln;
  
  
  {MAIN PART}
  if (shw = 1) or (shw = 2) then chk := 2;
  if (shw = 1) and (n1 mod 2 = 1) then
  begin
    if sgn = 1 then n1 := n1 + 1
    else n1 := n1 - 1;
  end;
  if (shw = 2) and (n1 mod 2 = 0) then 
  begin
    if sgn = 1 then n1 := n1 + 1
    else n1 := n1 - 1;
  end;
  if sgn = 1 then iu := 1
  else iu := -1;
  
  nn := (n2 - n1) * iu;
  while frac(nn / chk) <> 0 do
  begin
    n2 := n2 - 1 * iu;
    nn := (n2 - n1) * iu;
  end;
  
  chk := chk * iu;
  
  n := trunc(nn / chk * iu) + 1;
  
  h1 := trunc(n / clm);
  if frac(n / clm) = 0 then h2 := trunc(n / clm)
  else h2 := trunc(n / clm) + 1;
  
  writeln;
  writeln(' clm: ', clm);
  writeln(' iu:', iu);
  writeln(' n1: ', n1);
  writeln(' n2: ', n2);
  writeln(' chk: ', chk);
  writeln(' nn: ', nn);
  writeln(' n: ', n);
  writeln(' h1: ', h1);
  writeln(' h2: ', h2);
  writeln(' d: ', d);
  writeln;
  
  if chng = 1 then
  begin
    d := chk;
    chk := clm * chk;
  end
  else
  begin
    d := h2 * chk;
  end;
  
  writeln(' chk:', chk);
  writeln(' d:', d);
  writeln;
  
  n1 := n1 - chk;
  for i := 1 to h2 do
  begin
    n1 := n1 + chk;
    n1c := n1;
    for j := 1 to clm do
    begin
      if (n1c <> 255 * iu) or (n1c = n2) then
      begin
        res := n1c + (j - 1) * d;
        case length(inttostr(res)) of
          1: k := 3 + 1;
          2: k := 2 + 1;
          3: k := 1 + 1;
        end;
        if res * iu <= n2 * iu then
        begin
          case n1 of
            7, 8, 9, 10, 13, 149: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(n1));
          end;
        end
        else n1c := 255 * iu;
      end;
    end;
    writeln;
  end;
  
  
  {PAUSE}
  readkey;
end.