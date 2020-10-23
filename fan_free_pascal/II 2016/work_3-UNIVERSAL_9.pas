{Vladyslav Mambetov}
{Date 2016.03.05-06}

program ASCII;

uses crt;

var
  chng, clm, shw, n2, sgn, i, k :byte;
  min, max :string;
  n1, n1c, chk, nn, d, h, res:longint;
  rlim, v: real;
  //priz: integer;
  //-wht - characters or character codes;
  //chng - change character codes consecutively by rows or columns;
  //clm - the number of columns;
  //min, max - minimum, maximum;
  //shw - what show codes;
  //chk - the pitch;
  //-imc - it must change(change order: forwards, backwards);
  
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
  readln(clm);
  writeln;
  
  clrscr;
  
  min := '00000';
  max := '000255';
  shw := 1;
  chk := 5;
  //clm := 8;
  chng := 2;
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  If length(min) = 1 then
    n1 := ord(min[1])
    else n1 := strtoint(min);
  
  If length(max) = 1 then
    n2 := ord(max[1])
    else n2 := strtoint(max);
    
  {output the string on dysplay}
  write(' Display ');
  case shw of
    1: write('an even codes');
    2: write('an uneven codes');
    3: write('of a pitch ',chk);
  end;
  write(' from ',n1,'[');
  case n1 of
    7,8,9,10,13: write('?');
    else write(char(n1));
  end;
  write('] ');
  if n1 < n2 then
    begin 
      write('forwards');
      sgn := 1;
    end
    else write('backwards');
  write(' to ',n2,'[');
  case n2 of
    7,8,9,10,13: write('?');
    else write(char(n2));
  end;
  write('] in ',clm,' column');
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
    
  if (shw = 1) or (shw = 2) then
    begin
      if sgn = 1 then chk := 2
        else chk := -2;
    end;
  if (shw = 3) and  (sgn = 0) then chk := - chk;
  
  n1 := n1 - chk;
  
  if chng = 1 then
  begin
    while n1 <> n2 do
    begin
      for i := 1 to clm do
        begin
          if n1 <> n2 then
            begin
                  n1 := n1 + chk;
                  case length(inttostr(n1)) of
                    1: k := 3 + 1;
                    2: k := 2 + 1;
                    3: k := 1 + 1;
                  end;
              if sgn = 1  then 
                begin
                  if n1 <= n2 then
                    begin
                      case n1 of
                        7,8,9,10,13: write(' ':k,'[',n1,'] = ?');
                        else write(' ':k,'[',n1,'] = ',char(n1));
                      end;
                    end
                    else n1 := n2;
                end;
              if sgn = 0  then 
                begin
                  if n1 >= n2 then
                    begin
                      case n1 of
                        7,8,9,10,13: write(' ':k,'[',n1,'] = ?');
                        else write(' ':k,'[',n1,'] = ',char(n1));
                      end;
                    end
                    else n1 := n2;
                end;
            end;
        end;
        writeln;
    end;
  end;
  
  if (n2 = 0) or (n1 = 0) then nn := abs(n2 - n1) + 1
    else nn := abs(n2 - n1);
  n1c := n1;
  writeln('nn=',nn);
  writeln('n1=',n1);
  writeln('n2=',n2);
  if chng = 2 then 
  begin
    rlim := nn / clm;
    writeln('rlim=',rlim);
    
    if frac(rlim) = 0 then h := trunc(rlim)
    else h := trunc(rlim) + 1;
    if (shw = 1) and (h mod 2 = 1) then d := h + 1
    else d := h;
    writeln('d=',d);
    writeln('h=',h);
    writeln;
  
  if sgn = 1 then
  begin
  writeln('n1c=',n1c);
  while n1 < n1c + h do
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
      if res <= n2 then 
      begin
        case res of
          7,8,9,10,13: write(' ':k,'[',res,'] = ?');
          //7,8,9,10,13,34,36,38,40,42,46,48,52,54,60,62,68,70,72,74,84,86,88,98,94,96,100,104,106,112,114,122,124,128,130,136,138,140,142,158,160,162,164,166,168,170,182,184,186,188,198,190,200,202,218,220,230,234,238,250: write(' ':k,'[',s,'] = ?');
        else write(' ':k,'[',res,'] = ',char(res));
        end;
      end;
    end;
    writeln;
  end;
  end;
  end;
  
  if sgn = 2 then
  
  {PAUSE}
  readkey;
end.