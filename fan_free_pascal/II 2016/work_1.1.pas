{Vladyslav Mambetov}
{Date 2016.02.18}

program TranslationToACSII;

uses crt;

var
  n :byte;

begin
  {cleaning the screen}
  clrscr;

 {main part}
  repeat
    write('Enter the number: ');
    readln(n);
    If (n > -1) and (n < 16) then
      begin
        writeln('You have entered the number ',n);
        writeln('10ss = ',n);
        if n < 10 then
          n := n + 48
          else n := n + 55;
          writeln('16ss = ',chr(n));
          n := 1;
      end
      else begin
        writeln('Error. Need a number from 0 to 15.');
        n := 0;
      end;
  until n = 1;

  {pause}
  readln;

end.
