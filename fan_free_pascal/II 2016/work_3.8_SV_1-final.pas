{Vladyslav Mambetov}
{Date 2016.02.28}

program SV_3;

uses crt;

var
  n1, n2 :byte;

begin
  {cleaning the screen}
  clrscr;
  
  {input date}
  write('Enter the number of first char: ');
  read(n1);
  clrscr;
  writeln('You have entered the number: ', n1);
  writeln;
  
  {main part}
  n2 := 144;
  
  n2 := n2 + 1;
  if n1 mod 2 = 1 then n1 := n1 + 1;
  repeat
    write('[':4,n1,'] = ',char(n1));
    n1 := n1 + 2;
    if n1 < n2 then
    begin
      writeln('[':4,n1,'] = ',char(n1));
      n1 := n1 + 2;
    end;
  until n1 > n2;
  
  {pause}
  readkey;
end.