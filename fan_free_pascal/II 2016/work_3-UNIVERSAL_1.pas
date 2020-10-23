{Vladyslav Mambetov}
{Date 2016.03.05}

program ASCII;

uses crt;

var
  wht, chng, clm, chk, imc: byte;
  min, max:char;
  //wht - characters or character codes;
  //chng - change character codes consecutively by rows or columns;
  //clm - the number of columns;
  //min, max - minimum, maximum;
  //chk - the pitch;
  //imc - it must change(change order: forwards, backwards);
  
begin
  {cleaning the screen}
  clrscr;
  
  {enter the data}
  //write('What do you will enter characters(1) or character codes(2): ');
  //read(wht);
  write('Enter an initial value')
  write('How change ');
  if wht = 1 then write('characters')
    else write('chracter codes');
  write(' by rows(1) or columns(2): ');
  read(chng);
  write('Enter the number of culumns: ');
  read(clm);
  
  {main part}
 
  
  {pause}
  readkey;
end.