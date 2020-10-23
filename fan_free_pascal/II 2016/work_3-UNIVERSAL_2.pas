{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var
  chng, clm, shw, chk: byte;
  min, max: string;
  //-wht - characters or character codes;
  //chng - change character codes consecutively by rows or columns;
  //clm - the number of columns;
  //min, max - minimum, maximum;
  //shw - what show codes;
  //chk - the pitch;
  //-imc - it must change(change order: forwards, backwards);
  
begin
  {cleaning the screen}
  clrscr;
  
  {enter the data}
  //write('What do you will enter characters(1) or character codes(2): ');
  //read(wht);
  
  write(' Enter an starting value: ');
  read(max);
  writeln;
  write(' Enter the final value: ');
  read(min);
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
  
  {main part}
 
  
  {pause}
  readkey;
end.