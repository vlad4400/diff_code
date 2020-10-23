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
  write(' Enter an starting value: ');
  readln(min);
  writeln;
  
  write(' Enter the final value: ');
  readln(max);
  writeln;
  
  write(' Enter the number of culumns: ');
  read(clm);
  writeln;
  
  writeln(' What are the codes of characters you wont display even?');
  writeln(' 1 - even codes(1)');
  writeln(' 2 - uneven codes');
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
  
  
  {PROCESSING OF INPUT VALUE}
  {Calculate the character of codes}
  If length(min) = 1 then
    n1 := ord(min[1])
    else n1 := strtoint(min);
  
  If length(max) = 1 then
    n2 := ord(max[1])
    else n2 := strtoint(max);
  
  
  {MAIN PART}
    
  
  {PAUSE}
  readkey;
end.