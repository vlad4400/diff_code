{Vladyslav Mambetov}
{Date 2016.03.05-06}

program ASCII;

uses
  crt;

var
  chng, clm, shw, n2, sgn, i, k, n: byte;
  min, max: string;
  n1, n1c, chk, nn, d, h, res, iu: longint;
  rlim: real;
  //iu - iconic unit;
  //priz: integer;
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
  
  write(' Enter the number of culumns: ');
  //readln(clm);
  writeln;
  
  clrscr;
  
  min := '000033';
  max := '0002';
  shw := 3;
  chk := 3;
  clm := 7;
  chng := 1;
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  if length(min) = 1 then
    n1 := ord(min[1])
  else n1 := strtoint(min);
  
  if length(max) = 1 then
    n2 := ord(max[1])
  else n2 := strtoint(max);
  
  {output the string on dysplay}
  write(' Display ');
  case shw of
    1: write('an even codes');
    2: write('an uneven codes');
    3: write('of a pitch ', chk);
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
  if (shw = 1) and (n2 mod 2 = 1) then
  begin
    if sgn = 1 then n2 := n2 - 1
    else n2 := n2 + 1;
  end;
  if (shw = 2) and (n2 mod 2 = 0) then 
  begin
    if sgn = 1 then n2 := n2 - 1
    else n2 := n2 + 1;
  end;
  
  if sgn = 1 then iu := 1
  else iu := -1;
  
  chk := chk * iu;
  
  if (n1 = 0) or (n2 = 0) then nn := abs(n2 - n1) + 1
  else nn := abs(n2 - n1);
  
  n := trunc(nn / chk * iu) + 1;
  
  writeln;
  writeln(' iu:', iu);
  writeln(' n1: ', n1);
  writeln(' n2: ', n2);
  writeln(' chk: ', chk);
  writeln(' nn: ', nn);
  writeln(' n: ', n);
  writeln;
  
  if chng = 1 then
  begin
    
    n1 := n1 - chk;
    while n1 <> 255 * iu do
    begin
      for i := 1 to clm do
      begin
        if n1 <> 255 * iu then
        begin
          n1 := n1 + chk;
          case length(inttostr(n1)) of
            1: k := 3 + 1;
            2: k := 2 + 1;
            3: k := 1 + 1;
          end;
          if n1 * iu <= n2 * iu then
          begin
            case n1 of
              7, 8, 9, 10, 13: write(' ':k, '[', n1, '] = ?');
            else write(' ':k, '[', n1, '] = ', chr(n1));
            end;
          end
          else n1 := 255 * iu;
        end;
      end;
      writeln;
    end;
    
  end;
  
  
  {if (n2 = 0) or (n1 = 0) then nn := abs(n2 - n1) + 1
  else nn := abs(n2 - n1);}
  n1c := n1;
  
  if chng = 2 then 
  begin
    //rlim := nn / clm;
    //writeln('rlim=', rlim);
    
    //if frac(rlim) = 0 then h := trunc(rlim)
    //else h := trunc(rlim) + 1;
    if (sgn = 0) then h := -h;
    d := h;
    if (shw = 1) and (h mod 2 <> 0) then d := h + h mod 2;
    if (shw = 2) and (h mod 2 <> 0) then d := h + h mod 2;
    if (shw = 3) and (sgn = 1) then while d mod chk <> 0 do d := d + 1;
    if (shw = 3) and (sgn = 0) then while d mod chk <> 0 do d := d - 1;
    writeln('d=', d);
    writeln('h=', h);
    writeln;
    //n1 := n1 - chk;
    writeln('n1c=', n1c);
    
    
    while n1 <> n1c + h do
    begin
      n1 := n1 + chk;
      for i := 1 to clm do
      begin
        res := n1 + (i - 1) * d;
        case length(inttostr(res)) of
          1: k := 3 + 1;
          2: k := 2 + 1;
          3: k := 1 + 1;
        end;
        if (sgn = 1) and (res <= n2) then 
        begin
          case res of
            7, 8, 9, 10, 13: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(res));
          end;
        end;
        if (sgn = 0) and (res >= n2) then
        begin
          case res of
            7, 8, 9, 10, 13: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(res));
          end;
        end;
      end;
      writeln;
      if (sgn = 1) and (n1 > n1c + h) then n1 := n1c + h;
      if (sgn = 0) and (n1 < n1c + h) then n1 := n1c + h;
    end;
  end;
  
  
    {PAUSE}
  readkey;
end.