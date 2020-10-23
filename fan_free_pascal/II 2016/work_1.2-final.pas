{Vladyslav Mambetov}
{Date 2016.02.18}

program TranslationToACSII;

uses crt;

var
  n :byte;

begin
  {cleaning the screen}
  clrscr;
  
  {the enter number, with check}
  write('Enter the number: ');
  read(n);
  while (n < 0) or (n > 15) do
    begin
      clrscr;
      writeln('Error. You have entered the number ',n,'. Need a number from 0 to 15.');
      writeln;
      write('Enter the number: ');
      read(n);
    end;
  clrscr;
  writeln('You have entered the number ',n,'.');
    
  {main part}
  writeln;
  writeln('10ss = ',n);
  If n < 10 then
      n := n + 48
    else begin
      n := n + 55;
    end;
  writeln('16ss = ',chr(n));

  {pause}
  readln;

end.
