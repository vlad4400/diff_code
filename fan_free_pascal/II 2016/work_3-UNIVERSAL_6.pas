{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var
  chng, clm, shw, n1, n2, sgn, i, s, priz : byte;
  min, max: string;
  chk: longint;
  flagOutputSymbol: boolean;
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
  min := '0001';
  max := '00033';
  shw := 3;
  chk := 4;
  clm := 5;
  chng := 1;
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  If length(min) = 1 then
    n1 := ord(min[1])
    else n1 := strtoint(min);
  
  If length(max) = 1 then
    n2 := ord(max[1])
    else n2 := strtoint(max);
    
  {output on dysplay}
  write(' Display ');
  case shw of
    1: write('an even codes');
    2: write('an uneven codes');
    3: write('of a pitch ',chk);
  end;
  write(' from ',n1,'[',char(n1),'] ');
  if n1 < n2 then
    begin 
      write('forwards');
      sgn := 1;
    end
    else write('backwards');
  write(' to ',n2,'[',char(n2),'] in ',clm,' column');
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
  if (shw = 3) and  (sgn = 0) then chk := - abs(chk);
  
  n1 := n1 - chk;
  flagOutputSymbol := True;
  while n1 <> n2 do
  begin
    for i := 1 to clm do
      begin
        if n1 <> n2 then
         begin
          if sgn = 1  then 
            begin
              if n1 + chk > n1 then n1 := n1 + chk
                else n1 := n2;
              if n1 <= n2 then write('':1,n1:3)
                else n1 := n2;
            end;
          if sgn = 0  then 
            begin
              if n1 + chk < n1 then n1 := n1 + chk
                else n1 := n2;              
              if n1 >= n2 then write('':1,n1:3)
                else n1 := n2;
            end;
        end;
      end;
      writeln;
  end;
  
  
  {PAUSE}
  readkey;
end.