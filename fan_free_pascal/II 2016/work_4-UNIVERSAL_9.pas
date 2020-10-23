{Vladyslav Mambetov}
{Date 2016.03.05-07}

program ASCII;

uses
  crt;

var
  chng, shw, clm, n2, sgn, k, x, y, i, badrow: byte;
  min, max: string;
  n1, n1c, chk, nn, d, h, res, v: longint;
  rlim: real;
  //flagEnded: boolean;
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
  
  if shw = 3 then
  begin
    write('Enter the pitch: ');
    read(chk);
    writeln;
  end;
  
  write(' Enter how change character codes by rows(1) or colomns(2): ');
  read(chng);
  writeln;
  
  write(' Enter the number of culumns: ');
  readln(clm);
  writeln;
  
  clrscr;}
  
  
  {MARKING}
  x := 5;
  y := 2;
  
  {FOR A QUICK CHECK}
  min := '00';
  max := '00';
  shw := 2;
  chk := 3;
  clm := 9;
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
  else write(chr(n1));
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
  else write(chr(n2));
  end;
  write('] in ', clm, ' column');
  if clm > 1 then write('s');
  write('.');
  
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
  
  if (shw = 3) and  (sgn = 0) then chk := -chk;
  
  n1 := n1 - chk;
  n1c := n1;
  
  if (n2 = 0) or (n1 = 0) then nn := abs(n2 - n1) + 1
  else nn := abs(n2 - n1);
  rlim := nn / clm;
  writeln(' rlim: ', rlim);
  writeln(' h: ', h);
  writeln(' d: ', d);
  if frac(rlim) = 0 then h := trunc(rlim)
  else h := trunc(rlim) + 1;
  if (sgn = 0) then h := -h;
  d := h;
  writeln(' rlim: ', rlim);
  writeln(' h: ', h);
  writeln(' d: ', d);
  if (shw = 1) and (h mod 2 <> 0) then d := h + h mod 2;
  if (shw = 2) and (h mod 2 <> 0) then d := h + h mod 2;
  if (shw = 3) and (sgn = 1) then while d mod chk <> 0 do d := d + 1;
  if (shw = 3) and (sgn = 0) then while d mod chk <> 0 do d := d - 1;
  writeln(' rlim: ', rlim);
  writeln(' h: ', h);
  writeln(' d: ', d);
  writeln(' n1: ', n1);
  writeln(' nn: ', nn);
  writeln(' clm: ',clm);
  
  if trunc(nn / chk) mod clm = 0 then badrow := trunc(d / chk)
  else badrow := trunc(d / chk - 1);
  
  v := abs(abs(trunc(nn / chk)) - badrow * clm);
  writeln(' nn / chk: ', nn / chk);
  writeln(' trunc(nn / chk): ', trunc(nn / chk));
  writeln(' badrow * clm: ', badrow * clm);
  writeln(' v: ', v);
  //if v < 0 then v := abs(v);
  
  if abs(trunc(nn / chk)) < clm then clm := abs(trunc(nn / chk));
  //rlim := abs(trunc(nn / k));
  //clm := trunc(nn/k);
  //while abs(trunc(nn / chk)) < 0 do
  
  for i := 1 to y do writeln;
  write('':x, '╔');
  for i := 1 to clm * 13 do
    if i mod 13 <> 0 then 
      write('═') 
    else if i <> clm * 13 then write('╤');
  write('╗');
  writeln;
  
  writeln(' clm: ',clm);
  
  if chng = 1 then
  begin
    while n1 <> n2 do
    begin
      write('':x, '║');
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
            //write(' n0:',n1);
            if n1 <= n2 then
            begin
              case n1 of
                7, 8, 9, 10, 13, 149: write(' ':k, '[', n1, '] = ?');
              else write(' ':k, '[', n1, '] = ', chr(n1));
              end;
              if n1 + chk > n2 then n1 := n2;
            end
            else n1 := n2;
          end;
          if sgn = 0  then 
          begin
            if n1 >= n2 then
            begin
              case n1 of
                7, 8, 9, 10, 13, 149: write(' ':k, '[', n1, '] = ?');
              else write(' ':k, '[', n1, '] = ', chr(n1));
              end;
              if n1 + chk < n2 then n1 := n2;
            end
            else n1 := n2;
          end;
          //write(' n1:',n1);
          //write(' i:',i);
          if i <> clm then write(' │') 
          else write(' ║');
        end;
      end;
      writeln;
      if n1 <> n2 then
      begin
        write('':x, '╟');
        for  i := 1 to clm * 13 do 
          if i mod 13 <> 0 then 
            write('─') 
          else if i <> clm * 13 then
          begin
            if (n1c + badrow * clm * chk = n1) and (i div 13 > v) then
            begin
              //writeln(' i div 13: ',i div 13);
              write('┴');
            end
            else write('┼');
            {for j := 1 to v do
            begin
            if n1c + badrow * clm * chk - chk * j = n1 then 
            FlagEnded := True;
            //writeln;
            //writeln(n1c + badrow * clm * chk - chk * j,' ',i,' ',n1); 
            end;
            if flagEnded = True then write('┴')
            else write('┼')};
          end;
        if n1 = n1c + badrow * clm * chk then writeln('╜')
        else writeln('╢');
      end;
    end;
  end;
  writeln;
  //writeln(' FlagEnded: ', flagEnded);
  //writeln(' trunc(nn / clm): ', trunc(nn / clm) mod clm);
  //writeln(' int(nn / clm): ',int(nn / clm));
  writeln(' n1c: ', n1c);
  writeln(' clm: ', clm);
  writeln(' n2: ', n2);
  //writeln(' n1: ',n1);
  writeln(' nn: ', nn);
  writeln(' d: ', d);
  writeln(' h: ', h);
  //writeln(' :: ',n2 - chk * (clm - (d * clm - n2)));
  writeln(' badrow: ', badrow);
  writeln(' n1c + badrow * clm * chk: ', n1c + badrow * clm * chk);
  
  if chng = 2 then 
  begin
    
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
            7, 8, 9, 10, 13, 149: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(res));
          end;
        end;
        if (sgn = 0) and (res >= n2) then
        begin
          case res of
            7, 8, 9, 10, 13, 149: write(' ':k, '[', res, '] = ?');
          else write(' ':k, '[', res, '] = ', chr(res));
          end;
        end;
      end;
      writeln;
      if (sgn = 1) and (n1 > n1c + h) then n1 := n1c + h;
      if (sgn = 0) and (n1 < n1c + h) then n1 := n1c + h;
    end;
  end;
  
  writeln;
  writeln(' v: ',v);
  writeln(' clm: ',clm);
  
  if v = 0 then v := clm;
  
  write('':x, '╚');
  for i := 1 to v * 13 do 
    if i mod 13 <> 0 then 
      write('═') 
    else if i <> v * 13 then write('╧');
  writeln;
  //if n2 mod v < 0 then  writeln('╝')
  //else writeln('╛');
  if (v = clm) then writeln('╝')
    else writeln('╛');
  
  writeln;
  writeln(' v: ', v);
  writeln(' clm: ',clm);
  
  
  {PAUSE}
  //readkey;
end.