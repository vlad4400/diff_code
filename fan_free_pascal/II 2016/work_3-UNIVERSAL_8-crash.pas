{Vladyslav Mambetov}
{Date 2016.03.05-06}

program ASCII;

uses crt;

var
  chng, clm, shw, n2, sgn, i, k, d, n1c, n2c, j :byte;
  min, max :string;
  n1, chk, nn, step :longint;
  nc :real;
  //flagOutputSymbol: boolean;
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
  {
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
      write('Enter the pitch: ');
      read(chk);
      writeln;
    end;
    
  write(' Enter how change character codes by rows(1) or colomns(2):');
  read(chng);
  writeln;
  
  write(' Enter the number of culumns: ');
  readln(clm);
  writeln;
  
  clrscr;
  }
  min := '0005';
  max := '0083';
  shw := 3;
  chk := 1;
  clm := 3;
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
  
  if (n2 = 0) or (n1 = 0) then nn := abs(n2 - n1) + 1
    else nn := abs(n2 - n1);
  //writeln('nn=',nn,' ');
  nc := nn / clm;
  //writeln('nc=',nc,' ');
  if frac(nc) = 0 then d := trunc(nc)
    else d := trunc(nc) + 1;
  //writeln('d=',d,' ');
  
  step := chk;
  n2c := n2;
  if chng = 1 then
  begin
    //nc := ;
  end
  else 
  begin
    n2 := 0;
    chk := 0;
  end;
  //writeln('chk=',chk);
  //writeln;
  n1 := n1 - chk - step;
  n1c := n1;
  //writeln('step=',step);
  //writeln('n1=n1c=',n1c);
  
  {the output table}
  for j := 1 to d do
  begin
    n1c := n1c + step;
    for i := 1 to clm do
      begin
        //if n1 <> n2c then
          begin
            //writeln('n1=',n1);
            //writeln('(i - 1) * d=',(clm - 1) * d);
            if chng = 1 then n1 := n1 + chk
              else n1 := n1c + (i - 1) * d;
            case length(inttostr(n1)) of
              1: k := 3 + 1;
              2: k := 2 + 1;
              3: k := 1 + 1;
            end;
            //writeln('n1=',n1);
            if sgn = 1  then 
              begin
                if n1 <= n2c then
                  begin
                    case n1 of
                      7,8,9,10,13: write(' ':k,'[',n1,'] = ?');
                      else write(' ':k,'[',n1,'] = ',char(n1));
                    end;
                  end
                  else if chng = 1 then n1 := n2c;
              end;
            if sgn = 0  then 
              begin
                if n1 >= n2c then
                  begin
                    case n1 of
                      7,8,9,10,13: write(' ':k,'[',n1,'] = ?');
                      else write(' ':k,'[',n1,'] = ',char(n1));
                    end;
                  end
                  else if chng = 1 then n1 := n2c;;
              end;
          end;
      end;
      writeln;
  end;
  
  
  {PAUSE}
  readkey;
end.