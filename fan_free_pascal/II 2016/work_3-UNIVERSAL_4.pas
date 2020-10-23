{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var
  clm, shw, chk, n1, n2: byte;
  min, max: string;
  //-wht - characters or character codes;
  //-chng - change character codes consecutively by rows or columns;
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
  
  write(' Enter the number of culumns: ');
  readln(clm);
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
    
  clrscr;
  }
  min := '011';
  max := 'g';
  clm := 3;
  shw := 1;
  
  
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
  write(' from ',n1,'[',char(n1),']',' to ',n2,'[',char(n2),'] in ',clm,' column');
  if clm > 1 then write('s');
  
  writeln;
  writeln;
  
  
  {MAIN PART}
  while n1 < n2 do
  begin
    if n1 < n2 then n1 := n1 + 2;
    writeln(n1);
  end;
  
  
  {PAUSE}
  readkey;
end.